/* This file begun October 2020 by AKB. It reads in Arkansas data from the 2012 
general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Arkansas_Results

import excel using detail.xlsx, ///
    sheet("2") cellrange(A4:AG78) 

/* Renaming the County name variable, and restricting to only those variables with
the total N of votes cast for each candidate. I drop variables that report 
separately votes case on election day, early voting, absentee, provisional, and 
for some reason a category "Columbia, Ouachita & Union" [which are counties] 
reported for every county... I also retain the total N votes cast in the county */
keep A H N T Z AF AG

rename A County

save AR_2012.dta, replace

/* Assigning county ID numbers, per 
https://usa.ipums.org/usa/volii/ICPSR.shtml#arkansas */

gen cnticpsr = .
replace cnticpsr = 10 if County == "Arkansas"
replace cnticpsr = 30 if County == "Ashley"
replace cnticpsr = 50 if County == "Baxter"
replace cnticpsr = 70 if County == "Benton"
replace cnticpsr = 90 if County == "Boone"
replace cnticpsr = 110 if County == "Bradley"
replace cnticpsr = 130 if County == "Calhoun"
replace cnticpsr = 150 if County == "Carroll"
replace cnticpsr = 170 if County == "Chicot"
replace cnticpsr = 190 if County == "Clark"
replace cnticpsr = 210 if County == "Clay"
replace cnticpsr = 230 if County == "Cleburne"
replace cnticpsr = 250 if County == "Cleveland"
replace cnticpsr = 270 if County == "Columbia"
replace cnticpsr = 290 if County == "Conway"
replace cnticpsr = 310 if County == "Craighead"
replace cnticpsr = 330 if County == "Crawford"
replace cnticpsr = 350 if County == "Crittenden"
replace cnticpsr = 370 if County == "Cross"
replace cnticpsr = 390 if County == "Dallas"
replace cnticpsr = 410 if County == "Desha"
replace cnticpsr = 430 if County == "Drew"
replace cnticpsr = 450 if County == "Faulkner"
replace cnticpsr = 470 if County == "Franklin"
replace cnticpsr = 490 if County == "Fulton"
replace cnticpsr = 510 if County == "Garland"
replace cnticpsr = 530 if County == "Grant"
replace cnticpsr = 550 if County == "Greene"
replace cnticpsr = 570 if County == "Hempstead"
replace cnticpsr = 590 if County == "Hot Spring"
replace cnticpsr = 610 if County == "Howard"
replace cnticpsr = 630 if County == "Independence"
replace cnticpsr = 650 if County == "Izard"
replace cnticpsr = 670 if County == "Jackson"
replace cnticpsr = 690 if County == "Jefferson"
replace cnticpsr = 710 if County == "Johnson"
replace cnticpsr = 730 if County == "Lafayette"
replace cnticpsr = 750 if County == "Lawrence"
replace cnticpsr = 770 if County == "Lee"
replace cnticpsr = 790 if County == "Lincoln"
replace cnticpsr = 810 if County == "Little River"
replace cnticpsr = 830 if County == "Logan"
replace cnticpsr = 850 if County == "Lonoke"
replace cnticpsr = 870 if County == "Madison"
replace cnticpsr = 890 if County == "Marion"
replace cnticpsr = 910 if County == "Miller"
replace cnticpsr = 930 if County == "Mississippi"
replace cnticpsr = 950 if County == "Monroe"
replace cnticpsr = 970 if County == "Montgomery"
replace cnticpsr = 990 if County == "Nevada"
replace cnticpsr = 1010 if County == "Newton"
replace cnticpsr = 1030 if County == "Ouachita"
replace cnticpsr = 1050 if County == "Perry"
replace cnticpsr = 1070 if County == "Phillips"
replace cnticpsr = 1090 if County == "Pike"
replace cnticpsr = 1110 if County == "Poinsett"
replace cnticpsr = 1130 if County == "Polk"
replace cnticpsr = 1150 if County == "Pope"
replace cnticpsr = 1170 if County == "Prairie"
replace cnticpsr = 1190 if County == "Pulaski"
replace cnticpsr = 1210 if County == "Randolph"
replace cnticpsr = 1230 if County == "St Francis"
replace cnticpsr = 1250 if County == "Saline"
replace cnticpsr = 1270 if County == "Scott"
replace cnticpsr = 1290 if County == "Searcy"
replace cnticpsr = 1310 if County == "Sebastian"
replace cnticpsr = 1330 if County == "Sevier"
replace cnticpsr = 1350 if County == "Sharp"
replace cnticpsr = 1370 if County == "Stone"
replace cnticpsr = 1390 if County == "Union"
replace cnticpsr = 1410 if County == "Van Buren"
replace cnticpsr = 1430 if County == "Washington"
replace cnticpsr = 1450 if County == "White"
replace cnticpsr = 1470 if County == "Woodruff"
replace cnticpsr = 1490 if County == "Yell"

/* checked. All counties have ID number assigned. */

gen State = "Arkansas"
gen sticpsr = 42
gen stfips = 5
gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr
rename Z NVote_Obama
rename T NVote_Romney
rename AF NVote_Lindsay
rename H NVote_Johnson
rename N NVote_Stein
rename AG NVote_Total

save AR_2012.dta, replace

clear
