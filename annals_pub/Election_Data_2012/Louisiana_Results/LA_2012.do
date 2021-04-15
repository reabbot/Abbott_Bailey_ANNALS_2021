/* This file begun October 2020 by AKB. It reads in Louisiana data from the 2012 
general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Louisiana_Results

import excel using ByParish_46257.xlsx

save LA_2012.dta, replace

drop A
drop if B == "Parish"

gen State = "Louisiana"
gen sticpsr = 45
gen stfips = 22
rename B County
rename C NVote_Obama
rename F NVote_Romney
rename G NVote_Goode
rename E NVote_Johnson
rename D NVote_Stein
rename H NVote_Anderson
rename I NVote_Fellure
rename J NVote_Lindsay
rename K NVote_White
rename L NVote_Harris
rename M NVote_Tittle

destring NVote_Obama NVote_Romney NVote_Goode NVote_Johnson NVote_Stein, replace
destring NVote_Anderson NVote_Fellure NVote_Lindsay NVote_White, replace
destring NVote_Harris NVote_Tittle, replace

gen NVote_Total = NVote_Obama + NVote_Romney + NVote_Goode + NVote_Johnson + ///
	NVote_Stein + NVote_Anderson + NVote_Fellure + NVote_Lindsay + NVote_White + ///
	NVote_Harris + NVote_Tittle

gen ID_County = .

replace ID_County = 0010 if County == "Acadia"
replace ID_County = 0030 if County == "Allen"
replace ID_County = 0050 if County == "Ascension"
replace ID_County = 0070 if County == "Assumption"
replace ID_County = 0090 if County == "Avoyelles"
replace ID_County = 0110 if County == "Beauregard"
replace ID_County = 0130 if County == "Bienville"
replace ID_County = 0150 if County == "Bossier"
replace ID_County = 0170 if County == "Caddo"
replace ID_County = 0190 if County == "Calcasieu"
replace ID_County = 0210 if County == "Caldwell"
replace ID_County = 0230 if County == "Cameron"
replace ID_County = 0250 if County == "Catahoula"
replace ID_County = 0270 if County == "Claiborne"
replace ID_County = 0290 if County == "Concordia"
replace ID_County = 0310 if County == "De Soto"
replace ID_County = 0330 if County == "East Baton Rouge"
replace ID_County = 0350 if County == "East Carroll"
replace ID_County = 0370 if County == "East Feliciana"
replace ID_County = 0390 if County == "Evangeline"
replace ID_County = 0410 if County == "Franklin"
replace ID_County = 0430 if County == "Grant"
replace ID_County = 0450 if County == "Iberia"
replace ID_County = 0470 if County == "Iberville"
replace ID_County = 0490 if County == "Jackson"
replace ID_County = 0510 if County == "Jefferson"
replace ID_County = 0530 if County == "Jefferson Davis"
replace ID_County = 0550 if County == "Lafayette"
replace ID_County = 0570 if County == "Lafourche"
replace ID_County = 0590 if County == "Lasalle"
replace ID_County = 0610 if County == "Lincoln"
replace ID_County = 0630 if County == "Livingston"
replace ID_County = 0650 if County == "Madison"
replace ID_County = 0670 if County == "Morehouse"
replace ID_County = 0690 if County == "Natchitoches"
replace ID_County = 0710 if County == "Orleans"
replace ID_County = 0730 if County == "Ouachita"
replace ID_County = 0750 if County == "Plaquemines"
replace ID_County = 0770 if County == "Pointe Coupee"
replace ID_County = 0790 if County == "Rapides"
replace ID_County = 0810 if County == "Red River"
replace ID_County = 0830 if County == "Richland"
replace ID_County = 0850 if County == "Sabine"
replace ID_County = 0870 if County == "St. Bernard"
replace ID_County = 0890 if County == "St. Charles"
replace ID_County = 0910 if County == "St. Helena"
replace ID_County = 0930 if County == "St. James"
replace ID_County = 0950 if County == "St. John The Baptist"
replace ID_County = 0970 if County == "St. Landry"
replace ID_County = 0990 if County == "St. Martin"
replace ID_County = 1010 if County == "St. Mary"
replace ID_County = 1030 if County == "St. Tammany"
replace ID_County = 1050 if County == "Tangipahoa"
replace ID_County = 1070 if County == "Tensas"
replace ID_County = 1090 if County == "Terrebonne"
replace ID_County = 1110 if County == "Union"
replace ID_County = 1130 if County == "Vermilion"
replace ID_County = 1150 if County == "Vernon"
replace ID_County = 1170 if County == "Washington"
replace ID_County = 1190 if County == "Webster"
replace ID_County = 1210 if County == "West Baton Rouge"
replace ID_County = 1230 if County == "West Carroll"
replace ID_County = 1250 if County == "West Feliciana"
replace ID_County = 1270 if County == "Winn"

* All observations have valid ID_County value. But...I have to rename.
rename ID_County cnticpsr

gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr


save LA_2012.dta, replace

clear
