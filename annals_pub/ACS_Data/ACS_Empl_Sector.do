/* This file begun July 2019 by AKB. It read ACS Employment Sector data into 
Stata, restricts the observations to include only counties in the states we are 
interested in, and identifies the predictive variables we will use re: 
distribution of workers across industries.
*/

clear all

import excel "ACS_2017_5Y_Empl_Sector.xls", first

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
	 SCarolina == 1 | Tennessee == 1 |Virginia ==1
	 
/* Renaming and labeling employment variables */
rename HC01_EST_VC01 NCivEmpl
rename HC01_MOE_VC01 MOE_CivEmp
drop HC02_EST_VC01 - HC06_MOE_VC01
rename HC01_EST_VC02 NEmpl_AgExtr
rename HC01_MOE_VC02 MOE_AgExtr
drop HC02_EST_VC02 - HC06_MOE_VC02
rename HC01_EST_VC03 NEmpl_Constr
rename HC01_MOE_VC03 MOE_Constr
drop HC02_EST_VC03 - HC06_MOE_VC03
rename HC01_EST_VC04 NEmpl_Manuf
rename HC01_MOE_VC04 MOE_Manuf
drop HC02_EST_VC04 - HC06_MOE_VC04
rename HC01_EST_VC05 NEmpl_Whlsl
rename HC01_MOE_VC05 MOE_Whsl
drop HC02_EST_VC05 - HC06_MOE_VC05
rename HC01_EST_VC06 NEmpl_Retail
rename HC01_MOE_VC06 MOE_Retail
drop HC02_EST_VC06 - HC06_MOE_VC06
rename HC01_EST_VC07 NEmpl_Transport
rename HC01_MOE_VC07 MOE_Transport
drop HC02_EST_VC07 - HC06_MOE_VC07
rename HC01_EST_VC08 Nempl_Info
rename HC01_MOE_VC08 MOE_Info
drop HC02_EST_VC08 - HC06_MOE_VC08
rename HC01_EST_VC09 Nempl_FIRE
rename HC01_MOE_VC09 MOE_FIRE
drop HC02_EST_VC09 - HC06_MOE_VC09
rename HC01_EST_VC10 Nempl_Prof
rename HC01_MOE_VC10 MOE_Prof
drop HC02_EST_VC10 - HC06_MOE_VC10
rename HC01_EST_VC11 Nempl_EdHlth
rename HC01_MOE_VC11 MOE_EdHlth
drop HC02_EST_VC11 - HC06_MOE_VC11
rename HC01_EST_VC12 Nempl_ArtRec
rename HC01_MOE_VC12 MOE_ArtRec
drop HC02_EST_VC12 - HC06_MOE_VC12
rename HC01_EST_VC13 Nempl_OthSvc
rename HC01_MOE_VC13 MOE_OthSvc
drop HC02_EST_VC13 - HC06_MOE_VC13
rename HC01_EST_VC14 NEmpl_PubAdm
rename HC01_MOE_VC14 MOE_PubAdm
drop HC02_EST_VC14 - HC06_MOE_VC17

la var NCivEmpl "Civilian employed population 16 years and over"
la var MOE_CivEmp "MOE: Civilian employed population 16 years and over"
la var NEmpl_AgExtr "Agriculture, forestry, fishing and hunting, and mining"
la var MOE_AgExtr "MOE: Agriculture, forestry, fishing and hunting, and mining"
la var NEmpl_Constr "Workers in Construction"
la var MOE_Constr "MOE: Workers in Construction"
la var NEmpl_Manuf "Workers in Manufacturing"
la var MOE_Manuf "MOE: Workers in Manufacturing"
la var NEmpl_Whlsl "Workers in Wholesale Trade"
la var MOE_Whsl "MOE: Workers in Wholesale Trade"
la var NEmpl_Retail "Workers in Retail Trade"
la var MOE_Retail "MOE: Workers in Retail Trade"
la var NEmpl_Transport "Workers in Transportation and warehousing, and utilities"
la var MOE_Transport "MOE: Workers in Transportation and warehousing, and utilities"
la var Nempl_Info "Workers in Information"
la var MOE_Info "MOE: Workers in Information"
la var Nempl_FIRE "Workers in Finance, Insurance, Real Estate & Leasing"
la var MOE_FIRE "MOE: Workers in FIRE"
la var Nempl_Prof "Workers in Prof., scientific, management, admin & waste"
la var MOE_Prof "MOE: Workers in Prof., scientific, management, admin & waste"
la var Nempl_EdHlth "Workers in Ed svcs, health care and social assistance"
la var MOE_EdHlth "MOE: Workers in Ed svcs, health care and social assistance"
la var Nempl_ArtRec "Workers in  Arts, entertainment, rec, and accommodation & food svcs" 
la var MOE_ArtRec "MOE: Workers in  Arts, entertainment, rec, and accommodation & food svcs" 
la var Nempl_OthSvc "Workers in Other Services"
la var MOE_OthSvc "MOE: Workers in Other Services"
la var NEmpl_PubAdm "Workers in Public Administration"
la var MOE_PubAdm "MOE: Workers in Public Administration"
 
save ACS_Empl_Sector.dta, replace

clear


