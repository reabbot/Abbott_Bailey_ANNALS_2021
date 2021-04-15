/* This file begun October 2020 by AKB. It reads in Tennessee data from the 
2012 general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Tennessee_Results

use Obama.dta

save TN_2012.dta, replace

merge 1:1 County using Romney.dta

drop _merge

merge 1:1 County using Johnson.dta

drop _merge

merge 1:1 County using Goode.dta

drop _merge

merge 1:1 County using Stein.dta

drop _merge

merge 1:1 County using Anderson.dta

drop _merge

merge 1:1 County using Miller.dta

drop _merge

save TN_2012.dta, replace

gen State = "Tennessee"
gen sticpsr = 54
gen stfips = 47

gen NVote_Total = NVote_Obama + NVote_Romney + NVote_Goode + NVote_Stein + ///
	NVote_Johnson + NVote_Anderson + NVote_Miller 

gen County2 =strproper(County)
drop County
rename County2 County

gen ID_County = .

replace ID_County = 0010 if County == "Anderson"
replace ID_County = 0030 if County == "Bedford"
replace ID_County = 0050 if County == "Benton"
replace ID_County = 0070 if County == "Bledsoe"
replace ID_County = 0090 if County == "Blount"
replace ID_County = 0110 if County == "Bradley"
replace ID_County = 0130 if County == "Campbell"
replace ID_County = 0150 if County == "Cannon"
replace ID_County = 0170 if County == "Carroll"
replace ID_County = 0190 if County == "Carter"
replace ID_County = 0210 if County == "Cheatham"
replace ID_County = 0230 if County == "Chester"
replace ID_County = 0250 if County == "Claiborne"
replace ID_County = 0270 if County == "Clay"
replace ID_County = 0290 if County == "Cocke"
replace ID_County = 0310 if County == "Coffee"
replace ID_County = 0330 if County == "Crockett"
replace ID_County = 0350 if County == "Cumberland"
replace ID_County = 0370 if County == "Davidson"
replace ID_County = 0390 if County == "Decatur"
replace ID_County = 0410 if County == "Dekalb"
replace ID_County = 0430 if County == "Dickson"
replace ID_County = 0450 if County == "Dyer"
replace ID_County = 0470 if County == "Fayette"
replace ID_County = 0490 if County == "Fentress"
replace ID_County = 0510 if County == "Franklin"
replace ID_County = 0530 if County == "Gibson"
replace ID_County = 0550 if County == "Giles"
replace ID_County = 0570 if County == "Grainger"
replace ID_County = 0590 if County == "Greene"
replace ID_County = 0610 if County == "Grundy"
replace ID_County = 0630 if County == "Hamblen"
replace ID_County = 0650 if County == "Hamilton"
replace ID_County = 0670 if County == "Hancock"
replace ID_County = 0690 if County == "Hardeman"
replace ID_County = 0710 if County == "Hardin"
replace ID_County = 0730 if County == "Hawkins"
replace ID_County = 0750 if County == "Haywood"
replace ID_County = 0770 if County == "Henderson"
replace ID_County = 0790 if County == "Henry"
replace ID_County = 0810 if County == "Hickman"
replace ID_County = 0830 if County == "Houston"
replace ID_County = 0850 if County == "Humphreys"
replace ID_County = 0870 if County == "Jackson"
replace ID_County = 0875 if County == "James"
replace ID_County = 0890 if County == "Jefferson"
replace ID_County = 0910 if County == "Johnson"
replace ID_County = 0930 if County == "Knox"
replace ID_County = 0950 if County == "Lake"
replace ID_County = 0970 if County == "Lauderdale"
replace ID_County = 0990 if County == "Lawrence"
replace ID_County = 1010 if County == "Lewis"
replace ID_County = 1030 if County == "Lincoln"
replace ID_County = 1050 if County == "Loudon"
replace ID_County = 1070 if County == "Mcminn"
replace ID_County = 1090 if County == "Mcnairy"
replace ID_County = 1110 if County == "Macon"
replace ID_County = 1130 if County == "Madison"
replace ID_County = 1150 if County == "Marion"
replace ID_County = 1170 if County == "Marshall"
replace ID_County = 1190 if County == "Maury"
replace ID_County = 1210 if County == "Meigs"
replace ID_County = 1230 if County == "Monroe"
replace ID_County = 1250 if County == "Montgomery"
replace ID_County = 1270 if County == "Moore"
replace ID_County = 1290 if County == "Morgan"
replace ID_County = 1310 if County == "Obion"
replace ID_County = 1330 if County == "Overton"
replace ID_County = 1350 if County == "Perry"
replace ID_County = 1370 if County == "Pickett"
replace ID_County = 1390 if County == "Polk"
replace ID_County = 1410 if County == "Putnam"
replace ID_County = 1430 if County == "Rhea"
replace ID_County = 1450 if County == "Roane"
replace ID_County = 1470 if County == "Robertson"
replace ID_County = 1490 if County == "Rutherford"
replace ID_County = 1510 if County == "Scott"
replace ID_County = 1530 if County == "Sequatchie"
replace ID_County = 1550 if County == "Sevier"
replace ID_County = 1570 if County == "Shelby"
replace ID_County = 1590 if County == "Smith"
replace ID_County = 1610 if County == "Stewart"
replace ID_County = 1630 if County == "Sullivan"
replace ID_County = 1650 if County == "Sumner"
replace ID_County = 1670 if County == "Tipton"
replace ID_County = 1690 if County == "Trousdale"
replace ID_County = 1710 if County == "Unicoi"
replace ID_County = 1730 if County == "Union"
replace ID_County = 1750 if County == "Van Buren"
replace ID_County = 1770 if County == "Warren"
replace ID_County = 1790 if County == "Washington"
replace ID_County = 1810 if County == "Wayne"
replace ID_County = 1830 if County == "Weakley"
replace ID_County = 1850 if County == "White"
replace ID_County = 1870 if County == "Williamson"
replace ID_County = 1890 if County == "Wilson"
rename ID_County cnticpsr

	
gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr

save TN_2012.dta, replace

clear
