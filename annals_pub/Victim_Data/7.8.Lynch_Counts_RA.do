/* This file was begun in April 2020 by Amy Bailey to calculate the number of 
lynching events. It uses the 2018 version of the Beck-Tolnay inventory. */


clear all


import excel using Lynch_Victims.xlsx, cellrange (A3:R4930)

/* drop variables we won't use */
drop E F G H /* reported victim names */ L /* Victim age */ P Q R /* info on mob */ 

/* Did not import: S (Method of death) T U (Info on accusation) V W (info on mob) */

rename A Status
rename B Year
rename C Month
rename D Day
rename I Vicnum
rename J Race
rename K Sex
rename M uniqfips
rename N County
rename O State

replace Vicnum = strtrim(Vicnum)
replace Race = strtrim(Race)
replace Status = strtrim(Status)



keep if State ==  "AL" | State == "AR" | State == "FL" | State == "GA" | ///
     State == "LA" | State == "MS" | State == "NC" | State == "SC" | ///
	 State == "TN" | State == "VA" | State =="KY"
	 /* 
. tab State

      State |      Freq.     Percent        Cum.
------------+-----------------------------------
         AL |        496       10.29       10.29
         AR |        406        8.43       18.72
         FL |        344        7.14       25.86
         GA |        675       14.01       39.87
         KY |        458        9.51       49.38
         LA |        616       12.79       62.16
         MS |        811       16.83       79.00
         NC |        183        3.80       82.79
         SC |        261        5.42       88.21
         TN |        445        9.24       97.45
         VA |        123        2.55      100.00
------------+-----------------------------------
      Total |      4,818      100.00


*/

/* Confirm with Rebecca: We're OK restricting to these cases? Note: The data 
are set up to track information on individual cases - not events, as we plan to 
use them. So have to reformat so that only one observation per event is 
retained. */

keep if Status == "Lynching" | Status == "Probable lynching" | ///
     Status == "Probable lynching - suicide"
/* We lose another 183 cases here. 

note: possible categories are: Coincidental death; Coincidental death - probable;
		Lynching; Possible lynching; Possible lynching - suicide; Probable 
		lynching; Probable lynching - suicide.
		
	We keep those that are lynchings or probable lynchings (under a variety of
	circumstances). Remaining N = 4360.
						 */

save Lynch_Counts_precollapse.dta, replace


/* This generates an ID that will be shared among all victims in a given event */
replace Day = "15" if Day == "?" /*setting unclear dates (N=9) to mid-month */
replace Day = "29" if Day == "129" /* looks like a data entry error. */
destring Day, replace

drop if uniqfips < 1000 /* 6 cases where county was indeterminant */
drop if uniqfips == 281315 /* Sumner County, MS? Can't find evidence it existed. */

***********************************************************************
*updated 7/8/2020

tostring Year Month Day uniqfips, replace
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

gen eventID = Year + Month + Day + uniqfips
destring Year Month Day uniqfips, replace
destring eventID, replace
***********************************************************************

gen person = 1

la var Vicnum "Victim number for this event"
la var eventID  "Unique identifier for event"

/* Possible racial categories are:  Asian-Chinese (N=1)
									Black (N=3,579)
									Black, possibly Spanish (N=1)
									Black-Bahamian (N=2)
									Black-West Indian (N=1)
									Black-mulatto (N=47)
									Black-mulatto-Native American (N=2)
									Black-octoroon (N=1)
									Native American (N=2)
									Native American-Half breed (N=2)
									Possibly Native American (N=2)
									White (N=678)
									White, possibly Mexican (N=1)
									White-Canadian (N=1)
									White-English (N=1)
									White-Hungarian(N=1)
									White-Irish (N=1)
									White-Italian (N=24)
									White-Scottish (N=1)
									White-Spaniard (N=2)
									White-Syrian (N=1)

									 */
/* Here we classify victims by racial / ethnic category */

gen black = 0
replace black = 1 if Race == "Black"

gen allblack = 0
replace allblack = 1 if Race == "Black" | Race == "Black, possibly Spanish" | ///
     Race == "Black-Bahamian" | Race == "Black-Creole" | Race == ///
	 "Black-West Indian" | Race == "Black-mulatto" | Race == ///
	 "Black-mulatto-Native American" | Race == "Black-octoroon"
/* 3530 victims are Black. */
	 
gen otherPOC = 0
replace otherPOC = 1 if Race == "Asian-Chinese" | Race == "Native American" | ///
    Race == "Native American-Half breed" | Race == "Possibly Native American"
/* 7 victims are other POC. */

gen allPOC = allblack + otherPOC
	
gen white = 0
replace white = 1 if Race == "White"
* 600 observations are White.

gen white_ethnic = 0
replace white_ethnic = 1 if Race == "White, possibly Mexican" | Race == "White-Canadian" | ///
    Race == "White-English" | Race == "White-Hungarian" | Race == "White-Irish" | ///
	Race == "White-Italian" | Race == "White-Scottish" | Race == "White-Spaniard" | ///
	Race == "White-Syrian" | Race == "White-German/Dutch"
* 34 observations.

gen allwhite = white + white_ethnic

la var black "Victim is black (with no qualifiers)"
la var allblack "Victim is black (may include qualifiers)"
la var otherPOC "Victim POC but not black"
la var allPOC "Victim is POC, which includes black"
la var white "Victim is white (no ethnic qualifiers)"
la var white_ethnic "Victim identified as a white ethnic"
la var allwhite "Victim is white (ethnic or not)"

/*commented out 7.8.20

gen firstlist = 0
replace firstlist= 1 if Vicnum ==  "1 of 1" | Vicnum == "1 of 1 " | ///
    Vicnum == "1 of 11" | Vicnum == "1 of 13" | Vicnum == "1 of 2" | ///
	Vicnum == "1 of 3" | Vicnum == "1 of 4" | Vicnum == "1 of 5" | ///
	Vicnum == "1 of 6" | Vicnum == "1 of 7" | Vicnum == "1 of 8" | ///
	Vicnum == "1 of2"
	
*/

save Lynch_Counts_precollapse, replace


********************************************************************
*added 7.8.20 recreating the contents of Race_Counts.dta by summing race columns
*I'm doing this so I don't have to merge Race_Counts.dta later. 
		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen VicNum= total(person)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen NWhite= total(allwhite)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen Nwht_eth= total(white_ethnic)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen NBlack= total(allblack)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen NPOC= total(allPOC)

		la var VicNum "Number of people killed in this event (total)"
		la var NWhite "N all whites killed in event"
		la var Nwht_eth "N white ethnics killed in event"
		la var NBlack "N all blacks killed in event"
		la var NPOC  "N all people of color killed event" 


********************************************************************
*Dropping all but 1 case of each event id
*added 7.8.20
sort uniqfips Year Month Day
quietly by uniqfips Year Month Day: gen dup= cond(_N==1,0,_n)
keep if (dup<=1)
drop dup
*******************************************************************

/* We lose 942 observations here. So the following should reflect state level
distribution of the number of EVENTS.

tab State

      State |      Freq.     Percent        Cum.
------------+-----------------------------------
         AL |        381       10.41       10.41
         AR |        315        8.60       19.01
         FL |        249        6.80       25.81
         GA |        533       14.56       40.37
         KY |        349        9.53       49.90
         LA |        449       12.26       62.17
         MS |        620       16.94       79.10
         NC |        130        3.55       82.66
         SC |        183        5.00       87.65
         TN |        347        9.48       97.13
         VA |        105        2.87      100.00
------------+-----------------------------------
      Total |      3,661      100.00


*/

gen code1 = uniqfips
/* In this next step, I create a count for the total number of lynching events
that took place in each county. */
sort code1
collapse (first) State County uniqfips /*vicnum */ (count) nevents=eventID  ///
				   (sum)VicNum=  VicNum       ///
						NWhite=  NWhite       ///
						Nwht_eth= Nwht_eth    ///
						NBlack= NBlack        ///
						NPOC=  NPOC, by(code1) 
la var nevents "N events in this county"

drop code1 

save Lynch_Counts_All.dta, replace

clear

/* In the next steps, we restrict to only observations where there is at least
one black victim. */

use Lynch_Counts_precollapse.dta

gen code1 = uniqfips


*****************updated 7.8.20 
	*I'm doing this so I don't have to merge Race_Counts.dta later. 
		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen VicNum= total(person)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen NWhite= total(allwhite)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen Nwht_eth= total(white_ethnic)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen NBlack= total(allblack)

		sort uniqfips Year Month Day
		quietly by uniqfips Year Month Day: egen NPOC= total(allPOC)

		la var VicNum "Number of people killed in this event (total)"
		la var NWhite "N all whites killed in event"
		la var Nwht_eth "N white ethnics killed in event"
		la var NBlack "N all blacks killed in event"
		la var NPOC  "N all people of color killed event" 

********************************************************************
keep if allblack == 1
* we lost 641observations


*Dropping all but 1 case of each event id
*added 7.8.20
sort uniqfips Year Month Day
quietly by uniqfips Year Month Day: gen dup= cond(_N==1,0,_n)
keep if (dup<=1)
drop dup
*728 observations deleted 

/* The following represents distribution of events with at least 1 black victim

 tab State

      State |      Freq.     Percent        Cum.
------------+-----------------------------------
         AL |        314       10.26       10.26
         AR |        238        7.78       18.05
         FL |        220        7.19       25.24
         GA |        489       15.99       41.22
         KY |        218        7.13       48.35
         LA |        393       12.85       61.20
         MS |        573       18.73       79.93
         NC |        103        3.37       83.30
         SC |        168        5.49       88.79
         TN |        256        8.37       97.16
         VA |         87        2.84      100.00
------------+-----------------------------------
      Total |      3,059      100.00


*/


****************** *************************************************

collapse (first) State County uniqfips (count) nevents_blk=eventID	///
				   (sum)VicNum=  VicNum       ///
						NWhite=  NWhite       ///
						Nwht_eth= Nwht_eth    ///
						NBlack= NBlack        ///
						NPOC=  NPOC, by(code1) 

la var nevents_blk "N events with black victim/s in a county"

/************************************************************************
*commented out 7.8.20
replace event_blk = 1 if event_blk > 0
*************************************************************************/
drop code1

save Lynch_Counts_atleast1black.dta, replace

clear

/*updated 7.8.20 we don't need this part because I added calculated columns above
that reflect the data in race counts 
				/* Now we merge, and link the information on the number and racial distribution of victims who were killed
				in each event. */

				merge m:1 eventID using Race_Counts.dta

				/*

				SUCCESS!!!!!! :-)

					Result                           # of obs.
					-----------------------------------------
					not matched                             0
					matched                             4,349  (_merge==3)
					-----------------------------------------

				*/

				drop _merge

				/*commented out 7.8.20
				keep if Vicnum == "1 of 1"
				 */


				drop Status Vicnum Race Sex FIPSMob MobCounty MobState person black allblack ///
					 otherPOC allPOC white white_ethnic allwhite

				keep if State == "AL" | State == "AR" | State == "FL" | State== "GA" | ///
					 State == "LA" | State =="MS" | State == "NC" | State == "SC" | ///
					 State == "TN" | State == "VA"

				/* We lose 357 observations. Distribution by state is:

					  State |      Freq.     Percent        Cum.
				------------+-----------------------------------
						 AL |        299       11.55       11.55
						 AR |        251        9.70       21.25
						 FL |        187        7.23       28.48
						 GA |        409       15.80       44.28
						 LA |        337       13.02       57.30
						 MS |        490       18.93       76.24
						 NC |         97        3.75       79.98
						 SC |        138        5.33       85.32
						 TN |        283       10.94       96.25
						 VA |         97        3.75      100.00
				------------+-----------------------------------
					  Total |      2,588      100.00

				Lynchings are documented between 1865 and 1971, but 95% occurred between 1870 
				and 1940.
				*/
*/






