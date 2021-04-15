/* This file begun July 2019 by AKB. It read ACS Employment Sector data into 
Stata, restricts the observations to include only counties in the states we are 
interested in, and identifies the predictive variables we will use re: 
distribution of people across races.
*/

clear all
import excel "ACS_Nativity.xlsx", first

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
	 SCarolina == 1 | Tennessee == 1 | Virginia ==1

/* Keeping only the variables we will use from this file */

keep FIPSLynch GEOid GEOdisplaylabel HD01_VD01 HD02_VD01 HD01_VD02 HD02_VD02 ///
     HD01_VD24 HD02_VD24

/* Renaming variables with intuitive variable names. */
rename HD01_VD01 Pop_Nativity
rename HD02_VD01 MOE_PopNat
rename HD01_VD02 NNtvBorn
rename HD02_VD02 MOE_NNtvBorn
rename HD01_VD24 NFrnBorn
rename HD02_VD24 MOE_NFrnBorn

la var Pop_Nativity "Population used to calculate nativity"
la var MOE_PopNat "MOE: Population used to calculate nativity"
la var NNtvBorn "N Native Born in county"
la var MOE_NNtvBorn "MOE: N Native Born in county"
la var NFrnBorn "N Foreign Born in county"
la var MOE_NFrnBorn "MOE: N Foreign Born in county"

destring FIPSLynch Pop_Nativity MOE_PopNat NNtvBorn MOE_NNtvBorn NFrnBorn /// 
     MOE_NFrnBorn, replace

gen PctFrnBrn = NFrnBorn/Pop_Nativity * 100
la var PctFrnBrn "Percent of County Residents Who Are Foreign Born"

save ACS_Nativity.dta, replace
clear
/* Amy's observation: Most counties with high percentages of foreign-born 
population are in Florida which makes sense, as well as the Atlanta metro area.
Also the following:
- Sevier County, Arkansas (poultry processing plant)
- Stewart County, Georgia (major ICE detention center -- run by CCA)
- Whitfield County, Georgia (carpet manufacturing: newspaper article about ICE enforcement)
- Mecklenberg County, NC (Charlotte) 
*/
	 
	 
