/* This file begun July 2019 by AKB. It read ACS Employment Sector data into 
Stata, restricts the observations to include only counties in the states we are 
interested in, and identifies the predictive variables we will use re: 
distribution of people across races.
*/

clear all
import excel "ACS_Race_Income.xlsx", first

/* Restricting to observations only in our 10 states */
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

keep FIPSLynch GEOid GEOdisplaylabel HC01_EST_VC02 HC02_EST_VC02 HC01_EST_VC05 ///
     HC01_MOE_VC05 HC03_EST_VC05 HC03_MOE_VC05 HC01_EST_VC12 HC01_MOE_VC12 ///
	 HC01_EST_VC13 HC01_MOE_VC13 HC03_EST_VC13 HC03_MOE_VC13

/* Renaming variables with intuitive variable names. */
rename HC01_EST_VC02 NHholds
rename HC02_EST_VC02 MOE_NHholds
rename HC01_EST_VC05 NBlk_Hholds
rename HC01_MOE_VC05 MOE_NBlk_Hholds
rename HC03_EST_VC05 MedInc_BHH
rename HC03_MOE_VC05 MOE_MedInc_BHH
rename HC01_EST_VC12 NLat_Hholds
rename HC01_MOE_VC12 MOE_NLat_Hholds
rename HC01_EST_VC13 NNHW_Hholds
rename HC01_MOE_VC13 MOE_NNHW_Hholds
rename HC03_EST_VC13 MedInc_NHWHH
rename HC03_MOE_VC13 MOE_MedInc_NHWHH

la var NHholds "Number of households"
la var MOE_NHholds "MOE: Number of Households"
la var NBlk_Hholds "Number of Black Households"
la var MOE_NBlk_Hholds "MOE: Number of Black Households"
la var MedInc_BHH "Median Income: Black Households"
la var MOE_MedInc_BHH "MOE - Median Income: Black Households"
la var NLat_Hholds "Number of Latino Households"
la var MOE_NLat_Hholds "MOE - Number of Latino Households"
la var NNHW_Hholds "Number of Non-Hispanic White Households"
la var MOE_NNHW_Hholds "MOE: Number of Non-Hispanic White Households"
la var MedInc_NHWHH "Median Income: Non-Hispanic White Households"
la var MOE_MedInc_NHWHH "MOE - Median Income: Non-Hispanic White Households"

destring FIPSLynch NHholds MOE_NHholds NBlk_Hholds MOE_NBlk_Hholds MedInc_BHH ///
     MOE_MedInc_BHH NLat_Hholds MOE_NLat_Hholds NNHW_Hholds MOE_NNHW_Hholds ///
	 MedInc_NHWHH MOE_MedInc_NHWHH, replace

gen pct_NHWhite = NNHW_Hholds / NHholds * 100
gen pct_Lat = NLat_Hholds / NHholds * 100 
gen pct_Black = NBlk_Hholds / NHholds * 100
* gen BW_inc_Ratio = MedInc_BHH/MedInc_NHWHH * 100

la var pct_NHWhite "Perent Households Non-Hispanic White"
la var pct_Lat "Perent Households Latino"
la var pct_Black "Percent Households Black"
* la var BW_inc_Ratio "Black Income as a Percentage of White Income"

/* Note: There are 112 counties with so few black households that data on
household income for blacks is suppressed. For this reason, we are not able to
use the information on a black-white household income ratio. */

save ACS_Race_Income.dta, replace

clear

/* Amy's observation: Most counties with high percentages of foreign-born 
population are in Florida which makes sense, as well as the Atlanta metro area.
Also the following:
- Sevier County, Arkansas (poultry processing plant)
- Stewart County, Georgia (major ICE detention center -- run by CCA)
- Whitfield County, Georgia (carpet manufacturing: newspaper article about ICE enforcement)
- Mecklenberg County, NC (Charlotte) 
*/
	 
	 
