/* This file begun October 2020 by AKB. It reads in South Carolina data from the 2012 
general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\SCarolina_Results

import excel using detail.xlsx, ///
    sheet("2") cellrange(A4:M49) 
	
save SC_2012.dta, replace

keep A D F H J L M

rename A County
gen State = "South Carolina"
gen sticpsr = 48
gen stfips = 45
rename H NVote_Obama
rename D NVote_Romney
rename F NVote_Johnson
rename J NVote_Goode
rename L NVote_Stein
rename M NVote_Total

gen ID_County = .

replace ID_County = 0010 if County == "Abbeville"
replace ID_County = 0030 if County == "Aiken"
replace ID_County = 0050 if County == "Allendale"
replace ID_County = 0070 if County == "Anderson"
replace ID_County = 0090 if County == "Bamberg"
replace ID_County = 0110 if County == "Barnwell"
replace ID_County = 0130 if County == "Beaufort"
replace ID_County = 0150 if County == "Berkeley"
replace ID_County = 0170 if County == "Calhoun"
replace ID_County = 0190 if County == "Charleston"
replace ID_County = 0210 if County == "Cherokee"
replace ID_County = 0230 if County == "Chester"
replace ID_County = 0250 if County == "Chesterfield"
replace ID_County = 0270 if County == "Clarendon"
replace ID_County = 0290 if County == "Colleton"
replace ID_County = 0310 if County == "Darlington"
replace ID_County = 0330 if County == "Dillon"
replace ID_County = 0350 if County == "Dorchester"
replace ID_County = 0370 if County == "Edgefield"
replace ID_County = 0390 if County == "Fairfield"
replace ID_County = 0410 if County == "Florence"
replace ID_County = 0430 if County == "Georgetown"
replace ID_County = 0450 if County == "Greenville"
replace ID_County = 0470 if County == "Greenwood"
replace ID_County = 0490 if County == "Hampton"
replace ID_County = 0510 if County == "Horry"
replace ID_County = 0530 if County == "Jasper"
replace ID_County = 0550 if County == "Kershaw"
replace ID_County = 0570 if County == "Lancaster"
replace ID_County = 0590 if County == "Laurens"
replace ID_County = 0610 if County == "Lee"
replace ID_County = 0630 if County == "Lexington"
replace ID_County = 0650 if County == "McCormick"
replace ID_County = 0670 if County == "Marion"
replace ID_County = 0690 if County == "Marlboro"
replace ID_County = 0710 if County == "Newberry"
replace ID_County = 0730 if County == "Oconee"
replace ID_County = 0750 if County == "Orangeburg"
replace ID_County = 0755 if County == "Pendleton"
replace ID_County = 0770 if County == "Pickens"
replace ID_County = 0790 if County == "Richland"
replace ID_County = 0810 if County == "Saluda"
replace ID_County = 0830 if County == "Spartanburg"
replace ID_County = 0850 if County == "Sumter"
replace ID_County = 0870 if County == "Union"
replace ID_County = 0890 if County == "Williamsburg"
replace ID_County = 0910 if County == "York"
rename ID_County cnticpsr
	
gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr

save SC_2012.dta, replace

clear
