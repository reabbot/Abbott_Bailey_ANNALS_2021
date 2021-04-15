clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Mississippi_Results

import excel using Mississippi.xlsx

save MS_2012.dta, replace

gen State = "Mississippi"
gen sticpsr = 46
gen stfips = 28
rename A County
rename B NVote_Obama
rename C NVote_Romney
rename D NVote_Goode
rename E NVote_Johnson
rename F NVote_Stein
rename G NVote_Washer
rename H NVote_Total

drop if County == "" | County == "County"

destring NVote_Obama NVote_Romney NVote_Goode NVote_Johnson NVote_Stein ///
	NVote_Washer NVote_Total, replace

drop I J K

replace County = "Carroll" if County == "Carroll "
replace County = "Franklin" if County == "Fraklin"

gen ID_County = .

replace ID_County = 0010 if County == "Adams"
replace ID_County = 0030 if County == "Alcorn"
replace ID_County = 0050 if County == "Amite"
replace ID_County = 0070 if County == "Attala"
replace ID_County = 0090 if County == "Benton"
replace ID_County = 0110 if County == "Bolivar"
replace ID_County = 0130 if County == "Calhoun"
replace ID_County = 0150 if County == "Carroll"
replace ID_County = 0170 if County == "Chickasaw"
replace ID_County = 0190 if County == "Choctaw"
replace ID_County = 0210 if County == "Claiborne"
replace ID_County = 0230 if County == "Clarke"
replace ID_County = 0250 if County == "Clay"
replace ID_County = 0270 if County == "Coahoma"
replace ID_County = 0290 if County == "Copiah"
replace ID_County = 0310 if County == "Covington"
replace ID_County = 0330 if County == "Desoto"
replace ID_County = 0350 if County == "Forrest"
replace ID_County = 0370 if County == "Franklin"
replace ID_County = 0390 if County == "George"
replace ID_County = 0410 if County == "Greene"
replace ID_County = 0430 if County == "Grenada"
replace ID_County = 0450 if County == "Hancock"
replace ID_County = 0470 if County == "Harrison"
replace ID_County = 0490 if County == "Hinds"
replace ID_County = 0510 if County == "Holmes"
replace ID_County = 0530 if County == "Humphreys"
replace ID_County = 0550 if County == "Issaquena"
replace ID_County = 0570 if County == "Itawamba"
replace ID_County = 0590 if County == "Jackson"
replace ID_County = 0610 if County == "Jasper"
replace ID_County = 0630 if County == "Jefferson"
replace ID_County = 0650 if County == "Jefferson Davis"
replace ID_County = 0670 if County == "Jones"
replace ID_County = 0690 if County == "Kemper"
replace ID_County = 0710 if County == "Lafayette"
replace ID_County = 0730 if County == "Lamar"
replace ID_County = 0750 if County == "Lauderdale"
replace ID_County = 0770 if County == "Lawrence"
replace ID_County = 0790 if County == "Leake"
replace ID_County = 0810 if County == "Lee"
replace ID_County = 0830 if County == "Leflore"
replace ID_County = 0850 if County == "Lincoln"
replace ID_County = 0870 if County == "Lowndes"
replace ID_County = 0890 if County == "Madison"
replace ID_County = 0910 if County == "Marion"
replace ID_County = 0930 if County == "Marshall"
replace ID_County = 0950 if County == "Monroe"
replace ID_County = 0970 if County == "Montgomery"
replace ID_County = 0990 if County == "Neshoba"
replace ID_County = 1010 if County == "Newton"
replace ID_County = 1030 if County == "Noxubee"
replace ID_County = 1050 if County == "Oktibbeha"
replace ID_County = 1070 if County == "Panola"
replace ID_County = 1090 if County == "Pearl River"
replace ID_County = 1110 if County == "Perry"
replace ID_County = 1130 if County == "Pike"
replace ID_County = 1150 if County == "Pontotoc"
replace ID_County = 1170 if County == "Prentiss"
replace ID_County = 1190 if County == "Quitman"
replace ID_County = 1210 if County == "Rankin"
replace ID_County = 1230 if County == "Scott"
replace ID_County = 1250 if County == "Sharkey"
replace ID_County = 1270 if County == "Simpson"
replace ID_County = 1290 if County == "Smith"
replace ID_County = 1310 if County == "Stone"
replace ID_County = 1330 if County == "Sunflower"
replace ID_County = 1350 if County == "Tallahatchie"
replace ID_County = 1370 if County == "Tate"
replace ID_County = 1390 if County == "Tippah"
replace ID_County = 1410 if County == "Tishomingo"
replace ID_County = 1430 if County == "Tunica"
replace ID_County = 1450 if County == "Union"
replace ID_County = 1470 if County == "Walthall"
replace ID_County = 1490 if County == "Warren"
replace ID_County = 1510 if County == "Washington"
replace ID_County = 1530 if County == "Wayne"
replace ID_County = 1550 if County == "Webster"
replace ID_County = 1570 if County == "Wilkinson"
replace ID_County = 1590 if County == "Winston"
replace ID_County = 1610 if County == "Yalobusha"
replace ID_County = 1630 if County == "Yazoo"

* All observations have valid ID_County value. But have to rename...
rename ID_County cnticpsr

gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr

save MS_2012.dta, replace

clear
