/* This file begun June 2019 by AKB. NOTE: Second time! Lost another .do file
on TS3. Need to figure out what is going on! */


clear all


import delimited using Averted_Data_Original.csv

save Averted_Data.dta, replace

drop v3 v5 v7 v10 v15 v16 v18 v19 v27 v28 v31 v32 v34 
/* v34 provides name and race/gender of target/s */

rename v1 Year, replace
la var Year "Year of incident"

rename v2 Accusation, replace
la var Accusation "Offense Target Accused of Committing"

* rename v3 WDB_Code
* la var WDB_Code "Woody's Code"

rename v4 Composition, replace
la var Composition "Composition of Mob"

rename v6 Day, replace
la var Day "Day (of month) of incident"

rename v20 Month, replace
la var Month "Month of incident"

tostring v8, replace
replace v9 = v8 if v9 == "-"
/* Note: 2 replacements -- both have mob county listed as 'Indeterminant' */
destring v9 v8, replace

rename v8 FIPSLynch, replace
rename v9 FIPSMob, replace
la var FIPSLynch "FIPS for county where incident occurred"
la var FIPSMob "FIPS for county where mob originated"

* rename v16 mob_cnty, replace
rename v17 mob_size, replace
* rename v18 mob_state, replace
* rename v28 inc_place, replace
rename v11 County, replace
rename v12 State, replace

* la var mob_cnty "County where mob originated"
* la var mob_state "State where mob originated"
la var mob_size "Size of mob, if reported"
* la var inc_place "Place where incident occurred"
la var County "County where incident occurred"
la var State "State where incident occurred"

rename v14 severity
rename v33 threat_code
la var severity "Severity of incident"
la var threat_code "Numeric threat indicator"

* rename v10 notable
* rename v15 militia
* la var notable "Something notable about this incident"
* la var militia "Militia called out"

rename v21 nblkvic, replace
rename v22 nfemvic, replace
rename v23 nmalvic, replace
rename v24 nothvic, replace
rename v25 ntotvic, replace
rename v26 nwhtvic, replace
rename v30 nunkvic, replace
la var nblkvic "N black victims"
la var nfemvic "N female victims"
la var nmalvic "N male victims"
la var ntotvic "N total victims"
la var nwhtvic "N white victims"
la var nothvic "N victims of other races"
la var nunkvic "N victims unknown gender"

* rename v34 vic_details, replace
* la var vic_details "Victim's name and demographics"

rename v13 lynched
rename v29 problem
la var lynched "Lynched later [one or more target]"
la var problem "Woody flagged as problem case"

* rename v27 nonstate_int, replace
* rename v32 state_int, replace
* la var nonstate_int "Nonstate Intervention"
* la var state_int "State_Intervention"
/* v27 & v32 are state & nonstate intervention */

save Averted_Data.dta, replace

/* This section creates racial classifications for the mob members, and identifies those that are explicitly
portrayed as linked to white supremacist organizations. */

gen mixedmob = 0
replace mixedmob = 1 if Composition == "11 black, 1 white" | Composition == "Black and white" | ///
     Composition == "Blacks and whites" | Composition == "Masked white and black" | ///
	 Composition == "White and black" | Composition == "White and black; Masked" | ///
	 Composition == "Whites and blacks" 
la var mixedmob "Mob comprised of multiple races"
	 
gen blackmob = 0
replace blackmob = 1 if Composition == "Black" | Composition == "Black soldiers" | ///
     Composition == "Black women" | Composition == "Black?" | Composition == "Masked-black" | ///
	 Composition == "Possibly black" | Composition == "Probably black"
la var blackmob "Mob composed of black people"
	 
gen wht_sup_mob = 0
replace wht_sup_mob = 1 if Composition == "Ku klux" | Composition == "Ku klux/Red Men" | ///
     Composition == "Ku klux/whitecaps" | Composition == "Kuklux" | Composition == "Kuklux/regulators" | ///
	 Composition == "Masked" | Composition == "Masked - Ku klux" | Composition == "Mostly masked" | ///
	 Composition == "Night riders" | Composition == "Nightriders" | Composition == "Possible ku klux" | ///
	 Composition == "Red Shirts/Rough Riders" | Composition == "Regulators" | Composition == "Some masked" | ///
	 Composition == "ku klux" | Composition == "Vigilantes" | Composition == "White caps" | ///
	 Composition == "White caps/ku klux" | Composition == "Whitecaps" 
la var wht_sup_mob "Mob appears linked to white supremacist organization"

gen whitemob = 1
replace whitemob = 0 if blackmob == 1 | mixedmob == 1 | Composition == ""
la var whitemob "Mob composed of white people"

gen mobmiss = 0
replace mobmiss = 1 if Composition == ""
la var mobmiss "No data on composition of mob"

replace State = "TN" if State == "TN "
replace State = "WV" if State == "WV "
replace State = "NC" if State == " NC"
/* original data have 320 incidents in VA & 142 in WV */

*updated 7.8.2020 RA, nolonger dropping VA
drop if State == "WV"
/* We lose 462 observations */

/* Of the remaining 2,979 cases, there are 190 that ocurred prior to 
1882, and 338 that occurred after 1930 [528 total]. */

drop if Year < 1882 | Year > 1930

/* And we lose 528 cases...N = 2451. NOTE: Of these, 120 had targets who were 
subsequently lynched. In 93 of these cases, there was a single target (so certainly 
this person was lynched and should be included in event counts for completed 
lynchings).*/

replace ntotvic = "3" if ntotvic == "Multiple"
destring ntotvic, replace
drop if lynched == "Yes" & ntotvic == 1

/* My thought would be to remove the remaining 27 cases, since those event counts 
should be captured in the Lynched data? So I go ahead and delete them here... */

drop if lynched == "Yes"

/* Note: Case of John Gibson, 1894 MS - June newspaper announced he has been
sentenced to death for an alleged murder that occurred "some months ago", and 
that a lynching had been threatened at the time of the murder. WDB does not 
assign a data, so we will assign as Jan. 1 1894. */

replace Month = "1" if Month == "-"

replace Day = "1" if Day == "-"

/* Also a total of 28 cases where Day (of month) was not completely clear.
Have assigned those the date Woody identified as plausible [indicated by N?]
or the earliest date in a range of potential dates [which was usually two
adjacent days].*/

replace Day = "1"  if Day == "1?"
replace Day = "3" if Day == "3?"
replace Day = "5" if Day == "5?" | Day == "5-6"
replace Day = "6" if Day == "6?"
replace Day = "7" if Day == "7?"
replace Day = "8" if Day == "8?"
replace Day = "10" if Day == "10-11"
replace Day = "11" if Day == "11?"
replace Day = "12" if Day == "12?"
replace Day = "13" if Day == "13?" | Day == "13-15"
replace Day = "14" if Day == "14?"
replace Day = "15" if Day == "15?" | Day == ">15"
replace Day = "16" if Day == "16-17"
replace Day = "17" if Day == "17?"
replace Day = "18" if Day == "18?" | Day == "18-19"
replace Day = "19" if Day == "19-20"
replace Day = "20" if Day == "20?"
replace Day = "27" if Day == "27?" | Day == "27-31"
replace Day = "28" if Day == "28?" | Day == "28-30"
replace Day = "29" if Day == "29?"
replace Day = "30" if Day == "30?" | Day == "30-31"

/*commented out on 7.8.20 by RA
destring Month Day, replace

gen date = (Year * 10000) + (Month * 100) + Day
gen eventID = (date*1000000) + FIPSLynch
*/


***********************************************************************
*updated 7/8/2020

tostring Year Month Day FIPSLynch, replace
		replace Month="00" if Month=="0"
		replace Month="01" if Month=="1"
		replace Month="02" if Month=="2"
		replace Month="03" if Month=="3"
		replace Month="04" if Month=="4"
		replace Month="05" if Month=="5"
		replace Month="06" if Month=="6"
		replace Month="07" if Month=="7"
		replace Month="08" if Month=="8"
		replace Month="09" if Month=="9"

		replace Day="00" if Day=="0"
		replace Day="01" if Day=="1"
		replace Day="02" if Day=="2"
		replace Day="03" if Day=="3"
		replace Day="04" if Day=="4"
		replace Day="05" if Day=="5"
		replace Day="06" if Day=="6"
		replace Day="07" if Day=="7"
		replace Day="08" if Day=="8"
		replace Day="09" if Day=="9"

gen eventID = Year + Month + Day + FIPSLynch
destring Year Month Day FIPSLynch, replace
destring eventID, replace
***********************************************************************

la var eventID "Unique identifier for event (location + date)"

/* There were two incidents where "Multiple unnamed black men" were
threatened. I arbitrarily assigned these a numeric value of 3, as the
median incident with more than one target had three targets {modal for 
a multiple-target incident is 2]. */


save Averted_Data.dta, replace

clear
