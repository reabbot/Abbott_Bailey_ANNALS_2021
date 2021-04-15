/* This file begun July 2019 by AKB. It read ACS Employment Sector data into 
Stata, restricts the observations to include only counties in the states we are 
interested in, and identifies the predictive variables we will use re: 
distribution of people across races.
*/

clear all

do ACS_Age.do
do ACS_Empl_Sector.do
do ACS_Mil_Inc_Insur.do
do ACS_Nativity.do
do ACS_Race_Income.do

use ACS_Empl_Sector.dta

merge 1:1 FIPSLynch using ACS_Nativity.dta

/* 875 cases successfully matched -- none unsuccessful */

drop _merge
	 
merge 1:1 FIPSLynch using ACS_Race_Income.dta

/* 875 cases successfully matched -- none unsuccessful */

drop _merge
	 
merge 1:1 FIPSLynch using ACS_Mil_Inc_Insur.dta

/* 875 cases successfully matched -- none unsuccessful */

drop _merge
	 
merge 1:1 FIPSLynch using ACS_Age.dta

/* 875 cases successfully matched -- none unsuccessful */

drop _merge
drop MOE*
drop GEOid
rename GEOdisplaylabel county_ACS
rename FIPSLynch uniqfips

save ACS_Merged.dta, replace
clear all
