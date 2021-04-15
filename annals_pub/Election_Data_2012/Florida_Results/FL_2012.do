/* This file created October 2020 by AKB. It reads in 2012election data for the
stte of Florida and ultimately creates a single file with election results 
reported by county. Because of the way that the data arrived from the Florida
board of elections, there are several steps involve in this. */

clear

version 15.1

cd H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Florida_Results

import excel using FL_Votes.xlsx

* Dropping all results except for Presidential race
keep if D == "PRE"

* Dropping variable with extraneous information
drop A-F H-K

save FL_2012.dta, replace

/* Now, creating separate data files for each candidate (Florida reports a 
separate observation for each candidate and county, including a separate record
for each write-in candidate -- so 1206 observations for only 67 counties...) */

keep if L == "Romney"

rename G County
rename O NVote_Romney
keep County NVote_Romney

save Romney.dta, replace

clear

use FL_2012.dta

keep if L == "Obama"

rename G County
rename O NVote_Obama
keep County NVote_Obama

save Obama.dta, replace

clear

use FL_2012.dta

keep if L == "Stevens"

rename G County
rename O NVote_Stevens
keep County NVote_Stevens

save Stevens.dta, replace

clear

use FL_2012.dta

keep if L == "Johnson"

rename G County
rename O NVote_Johnson
keep County NVote_Johnson

save Johnson.dta, replace

clear

use FL_2012.dta

keep if L == "Goode,"

rename G County
rename O NVote_Goode
keep County NVote_Goode

save Goode.dta, replace

clear

use FL_2012.dta

keep if L == "Stein"

rename G County
rename O NVote_Stein
keep County NVote_Stein

save Stein.dta, replace

clear

use FL_2012.dta

keep if L == "Barnett"

rename G County
rename O NVote_Barnett
keep County NVote_Barnett

save Barnett.dta, replace

clear

use FL_2012.dta

keep if L == "Alexander"

rename G County
rename O NVote_Alexander
keep County NVote_Alexander

save Alexander.dta, replace

clear

use FL_2012.dta

keep if L == "Lindsay"

rename G County
rename O NVote_Lindsay
keep County NVote_Lindsay

save Lindsay.dta, replace

clear

use FL_2012.dta

keep if L == "Barr"

rename G County
rename O NVote_Barr
keep County NVote_Barr

save Barr.dta, replace

clear

use FL_2012.dta

keep if L == "Hoefling"

rename G County
rename O NVote_Hoefling
keep County NVote_Hoefling

save Hoefling.dta, replace

clear

use FL_2012.dta

keep if L == "Anderson"

rename G County
rename O NVote_Anderson
keep County NVote_Anderson

save Anderson.dta, replace

clear

use FL_2012.dta

keep if L == "Byrne"

rename G County
rename O NVote_Byrne
keep County NVote_Byrne

save Byrne.dta, replace

clear

use FL_2012.dta

keep if L == "Coniglio"

rename G County
rename O NVote_Coniglio
keep County NVote_Coniglio

save Coniglio.dta, replace

clear

use FL_2012.dta

keep if L == "Duncan"

rename G County
rename O NVote_Duncan
keep County NVote_Duncan

save Duncan.dta, replace

clear

use FL_2012.dta

keep if L == "Durham"

rename G County
rename O NVote_Durham
keep County NVote_Durham

save Durham.dta, replace

clear

use FL_2012.dta

keep if L == "Magee"

rename G County
rename O NVote_Magee
keep County NVote_Magee

save Magee.dta, replace

clear

use FL_2012.dta

keep if L == "Reed"

rename G County
rename O NVote_Reed
keep County NVote_Reed

save Reed.dta, replace

clear

/* Now merge them all together... */

use Romney.dta

merge 1:1 County using Obama.dta
drop _merge

merge 1:1 County using Stevens.dta
drop _merge

merge 1:1 County using Johnson.dta
drop _merge

merge 1:1 County using Goode.dta
drop _merge

merge 1:1 County using Stein.dta
drop _merge

merge 1:1 County using Barnett.dta
drop _merge

merge 1:1 County using Alexander.dta
drop _merge

merge 1:1 County using Lindsay.dta
drop _merge

merge 1:1 County using Barr.dta
drop _merge

merge 1:1 County using Hoefling.dta
drop _merge

merge 1:1 County using Anderson.dta
drop _merge

merge 1:1 County using Byrne.dta
drop _merge

merge 1:1 County using Coniglio.dta
drop _merge

merge 1:1 County using Duncan.dta
drop _merge

merge 1:1 County using Durham.dta
drop _merge

merge 1:1 County using Magee.dta
drop _merge

merge 1:1 County using Reed.dta
drop _merge

save FL_2012.dta, replace /* cardinal sin: need to create original read-in file 
                             w/ a different name. */
							 
destring NVote_Romney NVote_Obama NVote_Johnson NVote_Goode NVote_Stein ///
     NVote_Barnett NVote_Alexander NVote_Lindsay NVote_Barr NVote_Hoefling ///
	 NVote_Anderson NVote_Byrne NVote_Coniglio NVote_Duncan NVote_Durham ///
	 NVote_Magee NVote_Reed, replace
							 
gen NVote_Total = NVote_Romney + NVote_Obama + NVote_Johnson + NVote_Goode + ///
     NVote_Stein + NVote_Barnett + NVote_Alexander + NVote_Lindsay + NVote_Barr + ///
	 NVote_Hoefling + NVote_Anderson + NVote_Byrne + NVote_Coniglio + ///
	 NVote_Duncan + NVote_Durham + NVote_Magee + NVote_Reed

	 
/* Source for county ID codes: 
https://www.nrcs.usda.gov/wps/portal/nrcs/detail/fl/about/?cid=nrcs143_013697 */

gen ID_County = .
replace ID_County = 0010 if County == "Alachua"
replace ID_County = 0030 if County == "Baker"
replace ID_County = 0050 if County == "Bay"
replace ID_County = 0070 if County == "Bradford"
replace ID_County = 0090 if County == "Brevard"
replace ID_County = 0110 if County == "Broward"
replace ID_County = 0130 if County == "Calhoun"
replace ID_County = 0150 if County == "Charlotte"
replace ID_County = 0170 if County == "Citrus"
replace ID_County = 0190 if County == "Clay"
replace ID_County = 0210 if County == "Collier"
replace ID_County = 0230 if County == "Columbia"
replace ID_County = 0270 if County == "Desoto"
replace ID_County = 0290 if County == "Dixie"
replace ID_County = 0310 if County == "Duval"
replace ID_County = 0330 if County == "Escambia"
replace ID_County = 0350 if County == "Flagler"
replace ID_County = 0370 if County == "Franklin"
replace ID_County = 0390 if County == "Gadsden"
replace ID_County = 0410 if County == "Gilchrist"
replace ID_County = 0430 if County == "Glades"
replace ID_County = 0450 if County == "Gulf"
replace ID_County = 0470 if County == "Hamilton"
replace ID_County = 0490 if County == "Hardee"
replace ID_County = 0510 if County == "Hendry"
replace ID_County = 0530 if County == "Hernando"
replace ID_County = 0550 if County == "Highlands"
replace ID_County = 0570 if County == "Hillsborough"
replace ID_County = 0590 if County == "Holmes"
replace ID_County = 0610 if County == "Indian River"
replace ID_County = 0630 if County == "Jackson"
replace ID_County = 0650 if County == "Jefferson"
replace ID_County = 0670 if County == "Lafayette"
replace ID_County = 0690 if County == "Lake"
replace ID_County = 0710 if County == "Lee"
replace ID_County = 0730 if County == "Leon"
replace ID_County = 0750 if County == "Levy"
replace ID_County = 0770 if County == "Liberty"
replace ID_County = 0790 if County == "Madison"
replace ID_County = 0810 if County == "Manatee"
replace ID_County = 0830 if County == "Marion"
replace ID_County = 0850 if County == "Martin"
replace ID_County = 0860 if County == "Miami-Dade"
replace ID_County = 0870 if County == "Monroe"
replace ID_County = 0890 if County == "Nassau"
replace ID_County = 0910 if County == "Okaloosa"
replace ID_County = 0930 if County == "Okeechobee"
replace ID_County = 0950 if County == "Orange"
replace ID_County = 0970 if County == "Osceola"
replace ID_County = 0990 if County == "Palm Beach"
replace ID_County = 1010 if County == "Pasco"
replace ID_County = 1030 if County == "Pinellas"
replace ID_County = 1050 if County == "Polk"
replace ID_County = 1070 if County == "Putnam"
replace ID_County = 1090 if County == "St. Johns"
replace ID_County = 1110 if County == "St. Lucie"
replace ID_County = 1130 if County == "Santa Rosa"
replace ID_County = 1150 if County == "Sarasota"
replace ID_County = 1170 if County == "Seminole"
replace ID_County = 1190 if County == "Sumter"
replace ID_County = 1210 if County == "Suwannee"
replace ID_County = 1230 if County == "Taylor"
replace ID_County = 1250 if County == "Union"
replace ID_County = 1270 if County == "Volusia"
replace ID_County = 1290 if County == "Wakulla"
replace ID_County = 1310 if County == "Walton"
replace ID_County = 1330 if County == "Washington" 
rename ID_County cnticpsr /* realized I gave this the wrong name! Ack! */

gen State = "Florida"
gen sticpsr = 43
gen stfips = 12
gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr

save FL_2012.dta, replace

clear
