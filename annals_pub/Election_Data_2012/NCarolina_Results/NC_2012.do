/* This file begun October 2020 by AKB. It reads in Noth Carolina data from the 
2012 general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\NCarolina_Results

use Obama.dta

save NC_2012.dta, replace

merge 1:1 County using Romney.dta

drop _merge

merge 1:1 County using Johnson.dta

drop _merge

merge 1:1 County using Goode.dta

drop _merge

merge 1:1 County using WriteIn.dta

drop _merge

merge 1:1 County using Total.dta

drop _merge

save NC_2012.dta, replace

gen State = "North Carolina"
gen sticpsr = 47
gen stfips = 37

gen County2 =strproper(County)
drop County
rename County2 County

gen ID_County = .
replace ID_County = 0010 if County == "Alamance"
replace ID_County = 0030 if County == "Alexander"
replace ID_County = 0050 if County == "Alleghany"
replace ID_County = 0070 if County == "Anson"
replace ID_County = 0090 if County == "Ashe"
replace ID_County = 0110 if County == "Avery"
replace ID_County = 0130 if County == "Beaufort"
replace ID_County = 0150 if County == "Bertie"
replace ID_County = 0170 if County == "Bladen"
replace ID_County = 0190 if County == "Brunswick"
replace ID_County = 0210 if County == "Buncombe"
replace ID_County = 0230 if County == "Burke"
replace ID_County = 0250 if County == "Cabarrus"
replace ID_County = 0270 if County == "Caldwell"
replace ID_County = 0290 if County == "Camden"
replace ID_County = 0310 if County == "Carteret"
replace ID_County = 0330 if County == "Caswell"
replace ID_County = 0350 if County == "Catawba"
replace ID_County = 0370 if County == "Chatham"
replace ID_County = 0390 if County == "Cherokee"
replace ID_County = 0410 if County == "Chowan"
replace ID_County = 0430 if County == "Clay"
replace ID_County = 0450 if County == "Cleveland"
replace ID_County = 0470 if County == "Columbus"
replace ID_County = 0490 if County == "Craven"
replace ID_County = 0510 if County == "Cumberland"
replace ID_County = 0530 if County == "Currituck"
replace ID_County = 0550 if County == "Dare"
replace ID_County = 0570 if County == "Davidson"
replace ID_County = 0590 if County == "Davie"
replace ID_County = 0610 if County == "Duplin"
replace ID_County = 0630 if County == "Durham"
replace ID_County = 0650 if County == "Edgecombe"
replace ID_County = 0670 if County == "Forsyth"
replace ID_County = 0690 if County == "Franklin"
replace ID_County = 0710 if County == "Gaston"
replace ID_County = 0730 if County == "Gates"
replace ID_County = 0750 if County == "Graham"
replace ID_County = 0770 if County == "Granville"
replace ID_County = 0790 if County == "Greene"
replace ID_County = 0810 if County == "Guilford"
replace ID_County = 0830 if County == "Halifax"
replace ID_County = 0850 if County == "Harnett"
replace ID_County = 0870 if County == "Haywood"
replace ID_County = 0890 if County == "Henderson"
replace ID_County = 0910 if County == "Hertford"
replace ID_County = 0930 if County == "Hoke"
replace ID_County = 0950 if County == "Hyde"
replace ID_County = 0970 if County == "Iredell"
replace ID_County = 0990 if County == "Jackson"
replace ID_County = 1010 if County == "Johnston"
replace ID_County = 1030 if County == "Jones"
replace ID_County = 1050 if County == "Lee"
replace ID_County = 1070 if County == "Lenoir"
replace ID_County = 1090 if County == "Lincoln"
replace ID_County = 1110 if County == "Mcdowell"
replace ID_County = 1130 if County == "Macon"
replace ID_County = 1150 if County == "Madison"
replace ID_County = 1170 if County == "Martin"
replace ID_County = 1190 if County == "Mecklenburg"
replace ID_County = 1210 if County == "Mitchell"
replace ID_County = 1230 if County == "Montgomery"
replace ID_County = 1250 if County == "Moore"
replace ID_County = 1270 if County == "Nash"
replace ID_County = 1290 if County == "New Hanover"
replace ID_County = 1310 if County == "Northampton"
replace ID_County = 1330 if County == "Onslow"
replace ID_County = 1350 if County == "Orange"
replace ID_County = 1370 if County == "Pamlico"
replace ID_County = 1390 if County == "Pasquotank"
replace ID_County = 1410 if County == "Pender"
replace ID_County = 1430 if County == "Perquimans"
replace ID_County = 1450 if County == "Person"
replace ID_County = 1470 if County == "Pitt"
replace ID_County = 1490 if County == "Polk"
replace ID_County = 1510 if County == "Randolph"
replace ID_County = 1530 if County == "Richmond"
replace ID_County = 1550 if County == "Robeson"
replace ID_County = 1570 if County == "Rockingham"
replace ID_County = 1590 if County == "Rowan"
replace ID_County = 1610 if County == "Rutherford"
replace ID_County = 1630 if County == "Sampson"
replace ID_County = 1650 if County == "Scotland"
replace ID_County = 1670 if County == "Stanly"
replace ID_County = 1690 if County == "Stokes"
replace ID_County = 1710 if County == "Surry"
replace ID_County = 1730 if County == "Swain"
replace ID_County = 1750 if County == "Transylvania"
replace ID_County = 1770 if County == "Tyrrell"
replace ID_County = 1790 if County == "Union"
replace ID_County = 1810 if County == "Vance"
replace ID_County = 1830 if County == "Wake"
replace ID_County = 1835 if County == "Walton"
replace ID_County = 1850 if County == "Warren"
replace ID_County = 1870 if County == "Washington"
replace ID_County = 1890 if County == "Watauga"
replace ID_County = 1910 if County == "Wayne"
replace ID_County = 1930 if County == "Wilkes"
replace ID_County = 1950 if County == "Wilson"
replace ID_County = 1970 if County == "Yadkin"
replace ID_County = 1990 if County == "Yancey"
rename ID_County cnticpsr

gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr

save NC_2012.dta, replace

clear
