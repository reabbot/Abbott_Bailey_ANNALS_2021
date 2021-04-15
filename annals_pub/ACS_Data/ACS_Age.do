/* This file begun July 2019 by AKB. It read ACS Employment Sector data into 
Stata, restricts the observations to include only counties in the states we are 
interested in, and identifies the predictive variables we will use re: 
distribution of people across races.
*/

clear all

import excel "ACS_Age.xlsx", first

/* Restricting to observations only in our 11 states */
rename GEOid2 FIPSLynch
drop if GEOid == "Id"
destring FIPSLynch, replace
gen Alabama = 0
replace Alabama = 1 if FIPSLynch > 1000 & FIPSLynch < 2000
gen Arkansas = 0
replace Arkansas = 1 if FIPSLynch > 5000 & FIPSLynch < 6000
gen Florida = 0
replace Florida = 1 if FIPSLynch > 12000 & FIPSLynch < 13000
gen Georgia = 0
replace Georgia = 1 if FIPSLynch > 13000 & FIPSLynch < 14000
gen Kentucky = 0
replace Kentucky = 1 if FIPSLynch > 21000 & FIPSLynch < 22000
gen Louisiana = 0
replace Louisiana = 1 if FIPSLynch > 22000 & FIPSLynch < 23000
gen Mississippi = 0
replace Mississippi= 1 if FIPSLynch > 28000 & FIPSLynch < 29000
gen NCarolina = 0
replace NCarolina = 1 if FIPSLynch > 37000 & FIPSLynch < 38000
gen SCarolina = 0
replace SCarolina = 1 if FIPSLynch > 45000 & FIPSLynch < 46000
gen Tennessee = 0 
replace Tennessee = 1 if FIPSLynch > 47000 & FIPSLynch < 48000
gen Virginia = 0 
replace Virginia = 1 if FIPSLynch > 51000 & FIPSLynch < 51900

keep if Alabama == 1 | Arkansas == 1 | Florida == 1 | Georgia == 1 | ///
     Kentucky == 1 | Louisiana == 1 | Mississippi == 1 | NCarolina == 1 | ///
	 SCarolina == 1 | Tennessee == 1| Virginia ==1

/* Keeping only the variables we will use from this file */

keep FIPSLynch GEOid GEOdisplaylabel HC01_VC03 HC02_VC03 HC01_VC09 HC02_VC09 ///
     HC01_VC10 HC02_VC10 HC01_VC11 HC02_VC11 HC01_VC12 HC02_VC12 HC01_VC13 ///
     HC02_VC13 HC01_VC19 HC02_VC19 HC01_VC20 HC02_VC20 HC01_VC21 HC02_VC21 ///
	 HC01_VC24 HC02_VC24 

/* Renaming variables with intuitive variable names. */
rename HC01_VC03 Pop_AgeSex
rename HC02_VC03 MOE_Pop_AgeSex
rename HC01_VC09 NPop_U5
rename HC02_VC09 MOE_NPop_U5
rename HC01_VC10 NPop_5_9
rename HC02_VC10 MOE_NPop_5_9
rename HC01_VC11 NPop_10_14
rename HC02_VC11 MOE_NPop_10_14
rename HC01_VC12 NPop_15_19
rename HC02_VC12 MOE_NPop_15_19
rename HC01_VC13 NPop_20_24
rename HC02_VC13 MOE_NPop_20_24
rename HC01_VC19 NPop_65_74
rename HC02_VC19 MOE_NPop_65_74
rename HC01_VC20 NPop_75_84
rename HC02_VC20 MOE_NPop_75_84
rename HC01_VC21 NPop_85Plus
rename HC02_VC21 MOE_NPop_85Plus
rename HC01_VC24 Median_Age
rename HC02_VC24 MOE_Median_Age

la var Pop_AgeSex "Population for basis of Age-Sex calculations"
la var MOE_Pop_AgeSex "MOE: Population for basis of Age-Sex calculations"
la var NPop_U5 "Population under age 5"
la var MOE_NPop_U5 "MOE: Population under age 5"
la var NPop_5_9 "Population ages 5 to 9"
la var MOE_NPop_5_9 "MOE: Population ages 5 to 9"
la var NPop_10_14 "Population ages 10 to 14"
la var MOE_NPop_10_14 "MOE: Population ages 10 to 14"
la var NPop_15_19 "Population ages 15 to 19"
la var MOE_NPop_15_19 "MOE: Population ages 15 to 19"
la var NPop_20_24 "Population ages 20 - 24"
la var MOE_NPop_20_24 "MOE: Population ages 20 - 24"
la var NPop_65_74 "Population ages 65 - 74"
la var MOE_NPop_65_74 "MOE: Population ages 65 - 74"
la var NPop_75_84 "Population ages 75 - 84"
la var MOE_NPop_75_84 "MOE: Population ages 75 - 84"
la var NPop_85Plus "Population aged 85 and older"
la var MOE_NPop_85Plus "MOE: Population aged 85 and older"
la var Median_Age "Median Age"
la var MOE_Median_Age "MOE: Median Age"

destring FIPSLynch Pop_AgeSex MOE_Pop_AgeSex NPop_U5 MOE_NPop_U5 NPop_5_9 ///
     MOE_NPop_5_9 NPop_10_14 MOE_NPop_10_14 NPop_15_19 MOE_NPop_15_19 ///
	 NPop_20_24 MOE_NPop_20_24 NPop_65_74 MOE_NPop_65_74 NPop_75_84 ///
	 MOE_NPop_75_84 NPop_85Plus MOE_NPop_85Plus Median_Age MOE_Median_Age, replace

gen NPop_24U = NPop_U5 + NPop_5_9 + NPop_10_14 + NPop_15_19 + NPop_20_24
la var NPop_24U "Population age 24 and younger"
gen PctPop_24U = NPop_24U / Pop_AgeSex * 100
la var PctPop_24U "Percent of Population Age 24 and younger"

gen NPop_65Plus = NPop_65_74 + NPop_75_84 + NPop_85Plus
la var NPop_65Plus "Population age 65 and older"
gen PctPop_65Plus = NPop_65Plus / Pop_AgeSex * 100
la var PctPop_65Plus "Percent of Population Age 65 and Older"

save ACS_Age.dta, replace

clear

/* Amy's observation: Most counties with high percentages of foreign-born 
population are in Florida which makes sense, as well as the Atlanta metro area.
Also the following:
- Sevier County, Arkansas (poultry processing plant)
- Stewart County, Georgia (major ICE detention center -- run by CCA)
- Whitfield County, Georgia (carpet manufacturing: newspaper article about ICE enforcement)
- Mecklenberg County, NC (Charlotte) 
*/
	 
	 
