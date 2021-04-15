/* This file begun October 2020 by AKB. It reads in Kentucky data from the 2012 
general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Kentucky_Results

import excel using detail.xlsx, ///
    sheet("2") cellrange(A4:M123) 
	
save KY_2012.dta, replace
	
keep A D F H J L M

gen State = "Kentucky"
gen sticpsr = 51
gen stfips = 21
rename A County
rename F NVote_Obama
rename D NVote_Romney
rename J NVote_Terry
rename L NVote_Johnson
rename H NVote_Stein
rename M NVote_Total

gen ID_County = .

replace ID_County = 0010 if County == "Adair"
replace ID_County = 0030 if County == "Allen"
replace ID_County = 0050 if County == "Anderson"
replace ID_County = 0070 if County == "Ballard"
replace ID_County = 0090 if County == "Barren"
replace ID_County = 0110 if County == "Bath"
replace ID_County = 0130 if County == "Bell"
replace ID_County = 0150 if County == "Boone"
replace ID_County = 0170 if County == "Bourbon"
replace ID_County = 0190 if County == "Boyd"
replace ID_County = 0210 if County == "Boyle"
replace ID_County = 0230 if County == "Bracken"
replace ID_County = 0250 if County == "Breathitt"
replace ID_County = 0270 if County == "Breckinridge"
replace ID_County = 0290 if County == "Bullitt"
replace ID_County = 0310 if County == "Butler"
replace ID_County = 0330 if County == "Caldwell"
replace ID_County = 0350 if County == "Calloway"
replace ID_County = 0370 if County == "Campbell"
replace ID_County = 0390 if County == "Carlisle"
replace ID_County = 0410 if County == "Carroll"
replace ID_County = 0430 if County == "Carter"
replace ID_County = 0450 if County == "Casey"
replace ID_County = 0470 if County == "Christian"
replace ID_County = 0490 if County == "Clark"
replace ID_County = 0510 if County == "Clay"
replace ID_County = 0530 if County == "Clinton"
replace ID_County = 0550 if County == "Crittenden"
replace ID_County = 0570 if County == "Cumberland"
replace ID_County = 0590 if County == "Daviess"
replace ID_County = 0610 if County == "Edmonson"
replace ID_County = 0630 if County == "Elliott"
replace ID_County = 0650 if County == "Estill"
replace ID_County = 0670 if County == "Fayette"
replace ID_County = 0690 if County == "Fleming"
replace ID_County = 0710 if County == "Floyd"
replace ID_County = 0730 if County == "Franklin"
replace ID_County = 0750 if County == "Fulton"
replace ID_County = 0770 if County == "Gallatin"
replace ID_County = 0790 if County == "Garrard"
replace ID_County = 0810 if County == "Grant"
replace ID_County = 0830 if County == "Graves"
replace ID_County = 0850 if County == "Grayson"
replace ID_County = 0870 if County == "Green"
replace ID_County = 0890 if County == "Greenup"
replace ID_County = 0910 if County == "Hancock"
replace ID_County = 0930 if County == "Hardin"
replace ID_County = 0950 if County == "Harlan"
replace ID_County = 0970 if County == "Harrison"
replace ID_County = 0990 if County == "Hart"
replace ID_County = 1010 if County == "Henderson"
replace ID_County = 1030 if County == "Henry"
replace ID_County = 1050 if County == "Hickman"
replace ID_County = 1070 if County == "Hopkins"
replace ID_County = 1090 if County == "Jackson"
replace ID_County = 1110 if County == "Jefferson"
replace ID_County = 1130 if County == "Jessamine"
replace ID_County = 1150 if County == "Johnson"
replace ID_County = 1155 if County == "Josh Bell"
replace ID_County = 1170 if County == "Kenton"
replace ID_County = 1190 if County == "Knott"
replace ID_County = 1210 if County == "Knox"
replace ID_County = 1230 if County == "Larue"
replace ID_County = 1250 if County == "Laurel"
replace ID_County = 1270 if County == "Lawrence"
replace ID_County = 1290 if County == "Lee"
replace ID_County = 1310 if County == "Leslie"
replace ID_County = 1330 if County == "Letcher"
replace ID_County = 1350 if County == "Lewis"
replace ID_County = 1370 if County == "Lincoln"
replace ID_County = 1390 if County == "Livingston"
replace ID_County = 1410 if County == "Logan"
replace ID_County = 1430 if County == "Lyon"
replace ID_County = 1450 if County == "McCracken"
replace ID_County = 1470 if County == "McCreary"
replace ID_County = 1490 if County == "McLean"
replace ID_County = 1510 if County == "Madison"
replace ID_County = 1530 if County == "Magoffin"
replace ID_County = 1550 if County == "Marion"
replace ID_County = 1570 if County == "Marshall"
replace ID_County = 1590 if County == "Martin"
replace ID_County = 1610 if County == "Mason"
replace ID_County = 1630 if County == "Meade"
replace ID_County = 1650 if County == "Menifee"
replace ID_County = 1670 if County == "Mercer"
replace ID_County = 1690 if County == "Metcalfe"
replace ID_County = 1710 if County == "Monroe"
replace ID_County = 1730 if County == "Montgomery"
replace ID_County = 1750 if County == "Morgan"
replace ID_County = 1770 if County == "Muhlenberg"
replace ID_County = 1790 if County == "Nelson"
replace ID_County = 1810 if County == "Nicholas"
replace ID_County = 1830 if County == "Ohio"
replace ID_County = 1850 if County == "Oldham"
replace ID_County = 1870 if County == "Owen"
replace ID_County = 1890 if County == "Owsley"
replace ID_County = 1910 if County == "Pendleton"
replace ID_County = 1930 if County == "Perry"
replace ID_County = 1950 if County == "Pike"
replace ID_County = 1970 if County == "Powell"
replace ID_County = 1990 if County == "Pulaski"
replace ID_County = 2010 if County == "Robertson"
replace ID_County = 2030 if County == "Rockcastle"
replace ID_County = 2050 if County == "Rowan"
replace ID_County = 2070 if County == "Russell"
replace ID_County = 2090 if County == "Scott"
replace ID_County = 2110 if County == "Shelby"
replace ID_County = 2130 if County == "Simpson"
replace ID_County = 2150 if County == "Spencer"
replace ID_County = 2170 if County == "Taylor"
replace ID_County = 2190 if County == "Todd"
replace ID_County = 2210 if County == "Trigg"
replace ID_County = 2230 if County == "Trimble"
replace ID_County = 2250 if County == "Union"
replace ID_County = 2270 if County == "Warren"
replace ID_County = 2290 if County == "Washington"
replace ID_County = 2310 if County == "Wayne"
replace ID_County = 2330 if County == "Webster"
replace ID_County = 2350 if County == "Whitley"
replace ID_County = 2370 if County == "Wolfe"
replace ID_County = 2390 if County == "Woodford" 
/* Checked: All observations have a value for ID_County - but I need to rename to 
make it conform to other data files. */
rename ID_County cnticpsr

gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr

save KY_2012.dta, replace

clear
