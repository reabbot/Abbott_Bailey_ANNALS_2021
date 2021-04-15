/*
Author: R.Abbott
last modified: 5/28/2020
This Do file: This do file reads in the longitudinal religious congregations data file, 
which starts out as a building level unit of anlaysis. This do file transforms it
to county level unit of analysis. 
*/


clear all
use "Longitudinal Religious Congregations and Membership File, 1980-2010 (County Level)"


*Keeping only most recent year
keep if year==2010


*Data was initially congregation level, it was transformed with the following steps... 

	/*Dropping variables that record churches individual level name, church code,
	and some variables that track information on grouping churches based on type. 
	The only church type variable that was kept was 'reltrad' which Religious 
	tradition category - based on Steensland et al (2000)*/

	drop  grpname grpcode family NOTE_MIS NOTE_COM NOTE_MEA
	

	*Generating variables for each type of house of worship, set equal to freq by county
	gen county_evan=.
	label variable county_evan 			"Number of evangelical protestant buildings in the county"
	gen county_mainlineprot=.
	label variable county_mainlineprot 	"Number of mainline protestant buildings in the county"
	gen county_cath=.
	label variable county_cath 			"Number of catholic buildings in the county"
	gen county_other=.
	label variable county_other 		"Number of other buildings in the county"
	gen county_orth=.
	label variable county_orth 			"Number of orthodox buildings in the county"
	gen county_blkprot=.
	label variable county_blkprot 		"Number of black protestant buildings in the county"
	
	egen group = group(fipsmerg)
	su group, meanonly
	
	forvalues i = 1/`r(max)' {
	
	
		count if (reltrad==1 & group==`i')
		replace county_evan			=r(N) if group==`i'
		
		count if (reltrad==2 & group==`i')
		replace county_mainlineprot	=r(N) if group==`i'
		
		count if (reltrad==3 & group==`i')
		replace county_cath			=r(N) if group==`i'
		
		count if (reltrad==4 & group==`i')
		replace county_other		=r(N) if group==`i'
		
		count if (reltrad==5 & group==`i')
		replace county_orth			=r(N) if group==`i'
		
		count if (reltrad==6 & group==`i')
		replace county_blkprot		=r(N) if group==`i'
	
	
	}
	
		
		
	*Generating variables for the number of adherents for each religion by county
	gen county_evan_adh=.
	label variable county_evan_adh 			"Number of evangelical protestant adherents in the county"

	gen county_mainlineprot_adh=.
	label variable county_mainlineprot_adh 	"Number of mainline protestant adherents in the county"

	gen county_cath_adh=.
	label variable county_cath_adh 			"Number of catholic adherents in the county"

	gen county_other_adh=.
	label variable county_other_adh 		"Number of other adherents in the county"

	gen county_orth_adh=.
	label variable county_orth_adh 			"Number of orthodox protestant adherents in the county"

	gen county_blkprot_adh=.
	label variable county_blkprot_adh 		"Number of black protestant adherents in the county"

	
	su group, meanonly
	
			forvalues i = 1/`r(max)' {	
			
			sum(adherent) if (group==`i' & reltrad==1)
			replace county_evan_adh			=r(sum) if group==`i'
			
			sum(adherent) if (group==`i' & reltrad==2)
			replace county_mainlineprot_adh	=r(sum) if group==`i'
			
			sum(adherent) if (group==`i' & reltrad==3)
			replace county_cath_adh			=r(sum) if group==`i'
			
			sum(adherent) if (group==`i' & reltrad==4)
			replace county_other_adh		=r(sum) if group==`i'
			
			sum(adherent) if (group==`i' & reltrad==5)
			replace county_orth_adh			=r(sum) if group==`i'
			
			sum(adherent) if (group==`i' & reltrad==6)
			replace county_blkprot_adh		=r(sum) if group==`i'
			
		
			}
	*Generating a variable for the number of congregations for each religion by county
	gen county_evan_cong=.
	label variable county_evan_cong 			"Number of evangelical protestant congregations in the county"

	gen county_mainlineprot_cong=.
	label variable county_mainlineprot_cong 	"Number of mainline protestant congregations in the county"

	gen county_cath_cong=.
	label variable county_cath_cong 			"Number of catholic congregations in the county"

	gen county_other_cong=.
	label variable county_other_cong 			"Number of other congregations in the county"

	gen county_orth_cong=.
	label variable county_orth_cong 			"Number of orthodox protestant congregations in the county"

	gen county_blkprot_cong=.
	label variable county_blkprot_cong 			"Number of black protestant congregations in the county"
	
	su group, meanonly
	
			forvalues i = 1/`r(max)' {	
			
			sum(congreg) if (group==`i' & reltrad==1)
			replace county_evan_cong			=r(sum) if group==`i'
			
			sum(congreg) if (group==`i' & reltrad==2)
			replace county_mainlineprot_cong	=r(sum) if group==`i'
			
			sum(congreg) if (group==`i' & reltrad==3)
			replace county_cath_cong			=r(sum) if group==`i'
			
			sum(congreg) if (group==`i' & reltrad==4)
			replace county_other_cong		=r(sum) if group==`i'
			
			sum(congreg) if (group==`i' & reltrad==5)
			replace county_orth_cong			=r(sum) if group==`i'
			
			sum(congreg) if (group==`i' & reltrad==6)
			replace county_blkprot_cong		=r(sum) if group==`i'
			
		
			}
	*Dropping house of worship level variables
	drop group
	drop adherent
	drop congreg
	drop reltrad
	
	
	*Keeping only the first observation in each county so the resulting dataset is county level
	    unab vlist : _all
        sort `vlist'
        quietly by `vlist':  gen dup = cond(_N==1,0,_n)
		drop if dup>1
		drop dup
	
	*Changing variable name for merging
	rename fipsmerg FIPSLynch
	

	
/* Restricting to observations only in our 11 states */
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

rename FIPSLynch uniqfips
rename stateab STATE
rename cntynm County_relig
drop year
label variable totpop "total population for religious data 2010"
	
	save religious_data.dta, replace
