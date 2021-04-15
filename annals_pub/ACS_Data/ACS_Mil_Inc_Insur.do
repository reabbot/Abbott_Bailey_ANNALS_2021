/* This file begun July 2019 by AKB. It read ACS Employment Sector data into 
Stata, restricts the observations to include only counties in the states we are 
interested in, and identifies the predictive variables we will use re: 
distribution of people across races.
*/

clear all
import excel "ACS_Mil_Inc_Insur.xlsx", first

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

keep FIPSLynch GEOid GEOdisplaylabel HC01_VC03 HC02_VC03 HC01_VC04 HC02_VC04 ///
     HC01_VC06 HC02_VC06 HC01_VC07 HC02_VC07 HC01_VC08 HC02_VC08 HC01_VC09 ///
     HC02_VC09 HC01_VC74 HC02_VC74 HC01_VC75 HC02_VC75 HC01_VC76 HC02_VC76 ///
	 HC01_VC77 HC02_VC77 HC01_VC82 HC02_VC82 HC01_VC83 HC02_VC83 HC01_VC84 ///
     HC02_VC84 HC01_VC85 HC02_VC85 HC01_VC86 HC02_VC86 HC01_VC91 HC02_VC91 ///
     HC01_VC97 HC02_VC97 HC01_VC99 HC02_VC99 HC01_VC101 HC02_VC101 HC01_VC103 ///
     HC02_VC103 HC01_VC104 HC02_VC104 HC01_VC105 HC02_VC105 HC01_VC106 ///
	 HC02_VC106 HC01_VC111 HC02_VC111 HC01_VC112 HC02_VC112 HC01_VC113 ///
	 HC02_VC113 HC01_VC114 HC02_VC114 HC01_VC115 HC02_VC115 HC01_VC124 ///
	 HC02_VC124 HC01_VC130 HC02_VC130 HC01_VC131 HC02_VC131 HC03_VC161 ///
	 HC04_VC161 HC03_VC171 HC04_VC171


/* Renaming variables with intuitive variable names. */
rename HC01_VC03 NEmp_Stat
rename HC02_VC03 MOE_Emp_Stat
rename HC01_VC04 NLFP
rename HC02_VC04 MOE_LFP
rename HC01_VC06 NEmploy
rename HC02_VC06 MOE_Employ
rename HC01_VC07 NUnemploy
rename HC02_VC07 MOE_Unemploy
rename HC01_VC08 NMilitary
rename HC02_VC08 MOE_Military
rename HC01_VC09 NNot_in_LF
rename HC02_VC09 MOE_Not_in_LF
rename HC01_VC74 NHouseholds
rename HC02_VC74 MOE_Households
rename HC01_VC75 NHH_LT10K
rename HC02_VC75 MOE_HH10K
rename HC01_VC76 NHH_10_15K
rename HC02_VC76 MOE_HH10_15K
rename HC01_VC77 NHH_15_25K
rename HC02_VC77 MOE_HH15_25K
rename HC01_VC82 NHH_100_150K
rename HC02_VC82 MOE_HH100_150K
rename HC01_VC83 NHH_150_200K
rename HC02_VC83 MOE_HH150_200K
rename HC01_VC84 NHH_GT200K
rename HC02_VC84 MOE_HH200K
rename HC01_VC85 MedHHInc
rename HC02_VC85 MOE_MedHHInc
rename HC01_VC86 MeanHHInc
rename HC02_VC86 MOE_MeanHHInc
rename HC01_VC91 NHH_SocSec
rename HC02_VC91 MOE_HHSocSec
rename HC01_VC97 NHH_SSI
rename HC02_VC97 MOE_HHSSI
rename HC01_VC99 NHH_TANF
rename HC02_VC99 MOE_HHTANF
rename HC01_VC101 NHH_SNAP
rename HC02_VC101 MOE_HHSNAP
rename HC01_VC103 NFam_Inc
rename HC02_VC103 MOE_NFamInc
rename HC01_VC104 NFam_LT10K
rename HC02_VC104 MOE_Fam10K
rename HC01_VC105 NFam_10_15K
rename HC02_VC105 MOE_Fam10_15K
rename HC01_VC106 NFam_15_25K
rename HC02_VC106 MOE_Fam15_25K
rename HC01_VC111 NFam_100_150K
rename HC02_VC111 MOE_Fam100_150K
rename HC01_VC112 NFam_150_200K
rename HC02_VC112 MOE_Fam150_200K
rename HC01_VC113 NFam_GT200K
rename HC02_VC113 MOE_FamGT200K
rename HC01_VC114 MedFamInc
rename HC02_VC114 MOE_MedFamInc
rename HC01_VC115 MeanFamInc
rename HC02_VC115 MOE_MeanFamInc
rename HC01_VC124 MedWrkEarn
rename HC02_VC124 MOE_MedWrkEarn
rename HC01_VC130 BasePop_HlthIns
rename HC02_VC130 MOE_BasePop_HlthIns
rename HC01_VC131 NPop_HlthIns
rename HC02_VC131 MOE_NPop_HlthIns
rename HC03_VC161 PctFamPov
rename HC04_VC161 MOE_PctFamPov
rename HC03_VC171 Pov_Rate
rename HC04_VC171 MOE_Pov_Rate

la var NEmp_Stat "N Age 16+ for whom employment status is known"
la var MOE_Emp_Stat "MOE: N Age 16+ for whom employment status is known"
la var NLFP "N Age 16+ who are labor force participants"
la var MOE_LFP "MOE: N Age 16+ who are labor force participants"	 
la var NEmploy "N Age 16+ employed"
la var MOE_Employ "MOE: N Age 16+ employed"
la var NUnemploy "N Age 16+ Unemployed"	 
la var MOE_Unemploy "MOE: N Age 16+ Unemploy"
la var NMilitary "N Age 16+ in military"
la var MOE_Military "MOE: N Age 16+ in military"
la var NNot_in_LF "N Age 16+ Not in Labor Force"
la var MOE_Not_in_LF "MOE: N Age 16+ Not in Labor Force"
la var NHouseholds "Total N Households"
la var MOE_Households "MOE: N Total Households"
la var NHH_LT10K "N Households < $10,000 income"
la var MOE_HH10K "MOE: N Households < $10,000 income"
la var NHH_10_15K "N Households w/ income $10K-$14,999"
la var MOE_HH10_15K "MOE: N Households w/ income $10K-$14,999"
la var NHH_15_25K "N Households w/ income $15K-$24,999"
la var MOE_HH15_25K "MOE: N Households w/ income $15K-$24,999"
la var NHH_100_150K "N Households w/ income $100K-$149,999"
la var MOE_HH100_150K "MOE: N Households w/ income $100K-$149,999"
la var NHH_150_200K "N Households w/ income $150K-$199,999"
la var MOE_HH150_200K "MOE: N Households w/ income $150K-$199,999"
la var NHH_GT200K "N Households w/ income $200K or greater"
la var MOE_HH200K "MOE: N Households w/ income $200K or greater"
la var MedHHInc "Median Household Income"
la var MOE_MedHHInc "MOE: Median Household Income"
la var MeanHHInc "Mean Household Income"
la var MOE_MeanHHInc "MOE: Mean Household Income"
la var NHH_SocSec "N Households receiving Social Security"
la var MOE_HHSocSec "MOE: N Households receiving Social Security"
la var NHH_SSI "N Households receiving SSI"
la var MOE_HHSSI "MOE: N Households receiving SSI"
la var NHH_TANF "N households receiving cash assistance"
la var MOE_HHTANF "MOE: N Households receiving cash assistance"
la var NHH_SNAP "N Households receiving SNAP / food assistance"
la var MOE_HHSNAP "MOE: N Households receiving SNAP / food assistance"
la var NFam_Inc "N Families for whom income is calculated"
la var MOE_NFamInc "MOE: N Families for whom income is calculated"
la var NFam_LT10K "N Families w/ income < $10k"
la var MOE_Fam10K "MOE: N Families w/ income < $10k"
la var NFam_10_15K "N Families w/ income $10K - $14,999"
la var MOE_Fam10_15K "MOE: N Families w/ income $10K - $14,999"
la var NFam_15_25K "N Families w/ income $15K - $24,999"
la var MOE_Fam15_25K "MOE: N Families w/ income $15K - $24,999"
la var NFam_100_150K "N Families w/ income $100K - $149,999"
la var MOE_Fam100_150K "MOE: N Families w/ income $100K - $149,999"
la var NFam_150_200K "N Families w/ income $150K - $199,999"
la var MOE_Fam150_200K "MOE: N Families w/ income $150K - $199,999"
la var NFam_GT200K "N Families w/ income $200K & higher"
la var MOE_FamGT200K "MOE: N Families w/ income $200K & higher"
la var MedFamInc "Median Family Income"
la var MOE_MedFamInc "MOE: Median Family Income"
la var MeanFamInc "Mean Family Income"
la var MOE_MeanFamInc "MOE: Mean Family Income"
la var MedWrkEarn "Median Worker Earnings"
la var MOE_MedWrkEarn "MOE: Median Worker Earnings"
la var BasePop_HlthIns "Base Population: Health Insurance Calculations"
la var MOE_BasePop_HlthIns "MOE: Base Population: Health Insurance Calculations"
la var NPop_HlthIns "Noninstitutionalized Population w/ Health Insurance"
la var MOE_NPop_HlthIns "MOE: Noninstitutionalized Population w/ Health Insurance"
la var PctFamPov "Percent of families living at or below the poverty line"
la var MOE_PctFamPov "MOE: Percent of families living at or below the poverty line"
la var Pov_Rate "Percent of all people living at or below the poverty rate"
la var MOE_Pov_Rate "MOE: Percent of all people living at or below the poverty rate"


save ACS_Mil_Inc_Insur.dta, replace
clear
	 
