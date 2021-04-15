/*
This do file creates the analysis dataset for the November submission. Running 
this do file will update the analysis.dta used for the november analysis (updated 
from "First Submission Regressions" after we recieved reviewer comments).




		The steps of this do file are ...

		1) add labels to the full data 
		2) collapse data by cluster2 for analysis
		3) create a variable indicating observations included in our final sample. 

*/

set more off
capture log close
clear all

        cd ..
		cd ..
		use "FullMerge.dta"
		cd "Analysis"
		cd "Nov Submission"

		
*******************************************************************************
*Adding variable labels to County level data
******************************************************************************		
			label variable	uniqfips "County fips code from the ACS"
			label variable county_ACS "County name listed in ACS 2017" 
			label variable County_relig "County name listed in Religious data 2010" 
			label variable County_victim "County listed in victim dataset"
			label variable nevents_blk "Lynching N events with black victim/s in a county"
			label variable VicNum "Lynching N victims"
			label variable NWhite "Lynching N white victims "
			label variable Nwht_eth  "Lynching N white ethnic victims"
			label variable NBlack  "Lynching N black victims"
			label variable NPOC  "Lynching N people of color"
			label variable Naverted  "averted N events (generated from collapse) "
			label variable  nblkvic_sum  "averted N black victims"
			label variable  nfemvic_sum "averted N female victims"
			label variable  nmalvic_sum  "averted N male victims"
			label variable  nothvic_sum  "averted N  victims of other race"
			label variable  ntotvic_sum  "averted N total victims"
			label variable  nwhtvic_sum  "averted N white victims" 
			label variable  mixedmob_sum  "averted N mobs of mixed race"
			label variable  blackmob_sum  "averted N black mobs"
			label variable  wht_sup_mob_sum  "averted N white supremacist mobs"
			label variable  whitemob_sum  "averted N white mobs"
			label variable  ntrump  "N votes for trump in primary"
			label variable  county_primaries  "county name in primary data"
			label variable  nvotes  "N all votes in primary"
			label variable  state  "Full state name"
			label variable  sticpsr "icpsr state code"
			label variable  stfips  "fips state code"
			label variable  cnticpsr  "icpsr county code"
			label variable  uniqicpsr  "icpsr combined state/county id"
			label variable  B05001_001  "Total Population ACS2010"
			label variable  B05001_002  "US Born ACS2010"
			label variable  B05001_003  "Born in territories ACS2010"
			label variable  B05001_004  "Foreign Born - US Parents ACS2010"
			label variable  B05001_005  "Foreign Born - Naturalized ACS2010"
			label variable  B05001_006  "Foreign Born - Not Naturalized ACS2010"
			label variable county_fbpop "County name listed in 2010 ACS file"
			label variable statfips "state fips code"
			label variable staticpsr "state icpsr code"
			label variable cntycode "county code"
			label variable County_hist "name of county in historical agricultural/demographic/cluster data"
			rename negtot blktot
			label variable blktot "total black population 1890"
			label variable whtot "total white population 1890"
			label variable acimp "Number of improved acres in farms 1890"
			label variable acunimp "Number of unimproved acres in farms 1890"
			label variable county_clust "county name listed in cluster data" 
			rename County County_general
			label variable County_general "county name listed in general election data"
			label variable TotVotes "Total votes in General" 
			label variable Trump "Total Trump votes in General"
			label variable Clinton "Total Clinton votes in General" 
			label variable statefips "state fips code"
			label variable pctTrump "Percent of total vote Trump won in the general"
			label variable r_T_C "Ratio of Trump to Clinton votes, general"
			label variable fulltoNovVote "Historical/ACS/Religious/Primary/victim data TO general election"
			label variable fullto1968 "historical/acs/religious/primary/victim/general to 68' election data"
			label variable NVote_Obama "N Votes for Obama 2012"
			label variable NVote_Romney "N Notes for Romney 2012"
			label variable County_2012 "County name listed in 2012 data" 
			label variable fullto2012 "all other data to 2012 data merge" 


/***************************************************************************
Pre-processing for collapse
****************************************************************************/
*Recode binary state variables based on all state variables
	replace Alabama=1 if (STATE=="AL" | State=="Alabama" )
	replace Arkansas=1 if (STATE== "AR" | State=="Arkansas" )
	replace Florida=1  if (STATE== "FL" | State=="Florida" )
	replace Georgia=1 if (STATE== "GA" | State=="Georgia" )
	replace Louisiana=1 if (STATE== "LA" | State=="Louisiana")
	replace Mississippi=1 if (STATE== "MS" | State=="Mississippi" )
	replace NCarolina=1 if (STATE== "NC" | State=="North Carolina" )
	replace SCarolina=1 if (STATE== "SC" | State=="South Carolina")
	replace Tennessee=1 if (STATE== "TN" | State=="Tenessee")
	replace Virginia=1 if (STATE== "VA" | State=="Virginia" )
	replace Kentucky=1 if (STATE=="KY" | State == "Kentucky")


				gen st=""
				replace st="AL" if (Alabama==1)
				replace st="AR" if (Arkansas==1)
				replace st="FL" if (Florida==1)
				replace st="GA" if (Georgia==1)
				replace st="LA" if (Louisiana==1)
				replace st="MS" if (Mississippi==1)
				replace st="NC" if (NCarolina==1)
				replace st="SC" if (SCarolina==1)
				replace st="TN" if (Tennessee==1)
				replace st="VA" if (Virginia==1)	
				replace st="KY" if (Kentucky==1)
				drop if st==""	

*Drop excess state, county and ID variables
drop  state State stfips sticpsr cnticpsr



*Coding missing values as zero for the outcome variables
replace nevents=0 if nevents==.
replace Naverted=0 if Naverted==. 
scatter pctTrump nblkvic_sum 

/*Creating a binary variable that tags all counties that have 0 averted events 
and 0 lynching events. We will run analysis seperate for a dataset that includes these 
and one that does not. This is because we thing the 0-0 counties might not actually be 
true zeros but missing data. so we will run these analyses twice */
gen Nevents=nevents_blk + Naverted 
gen tag00=.
replace tag00=1 if Nevents==0


***looking at similar graphics for primary
gen primarytrump= (ntrump/nvotes)*100
histogram primarytrump, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump Vote Distribution Prior to Collapse")
graph save Graph "Primary-Histogram of Trumpvote prior to collapse.gph", replace

twoway (scatter primarytrump nblkvic_sum), ytitle(Pct Trump(pre collapse)) xtitle(Number of Black Vic (pre collapse))title("Trump voting by violence (pre collapse)")
graph save Graph "Primary-Trumpvotingbyviolenceprecollapse.gph",replace




/****************************************************************************
*Variables Used in Study						How the variable is calculated (after collapse)
****************************************************************************
*Calculated variables were calculated after collapsing by county


LOCAL DEMOGRAPHIC COMPOSITION
*Pct. Population Aged 65 and Older				    (NPop_65_74 + NPop_75_84 + NPop_85Plus)/Pop_AgeSex


*Pct. Population Aged Under 25						(NPop_U5 + NPop_5_9 + NPop_10_14 + NPop_15_19 + NPop_20_24)/Pop_AgeSex
*Percent Non-Hispanic White							NNHW_Hholds/NHholds
*Pct. Black											NBlk_Hholds/NHholds
*Pct. growth in foreign born						changepercentFRNBrn=(NFrnBorn/Pop_Nativity)-((B05001_004+B05001_005+B05001_006)/B05001_001)		
*Total Population 2017(in thousands)				Pop_Nativity


LABOR MARKET STRUCTURE
*Pct. Workers in Blue collar industries				(NEmpl_AgExtr + NEmpl_Constr + NEmpl_Manuf)/NCivEmpl
*Pct. Population Jobless							NUnemploy/NEmp_Stat

HOUSEHOLD ECONOMICS
*Pct. Households w/Income < $25,000					(NHH_LT10K + NHH_10_15K + NHH_15_25K)/NHouseholds
*Pct. Households Receiving SSI						NHH_SSI/NHouseholds

RELIGIOUS CHARACTARISTICS
*Percent of county that is evangelical protestant   county_evan_adh/totpop

HISTORICAL MEASURES /* AKB adds these */
* Percentage of farms owned 						farms/farmown * 100 /* 1890 measure of economic security */
* Percentage of population white					whtot/totpop1890 * 100 /* 1890 racial composiion */
* Percentage ag land in labor intensive crops		((tobacac + riceac + csugarac + cottonac)/acimp) * 100
* Percentage ag land in cotton						(cottonac/acimp) * 100

HISTORICAL MOB VIOLENCE
*Number of lynchings completed 1882-1930			nevents
*Number of lynchings threatened						Naverted
*Number of all events								Nevents=nevents+Naverted
*Ratio of lynching vics to total vics				lynchratio=nevents/Nevents

STATES
Binary variables for States in study				Alabama
													Arkansas
													Florida
													Georgia
													Louisiana
													Mississippi
													NCarolina
													SCarolina
													Tennessee
													Virginia
													Kentucky


#METHODS, SPLINE: for spline you need.... X+(X-knot)*dummy
 1) dummy variable for x on each side of the spline  
						*Creating spline dummy
						gen splinedummy =.
						replace splinedummy=0 if Nevents < 1  
						replace splinedummy=1 if Nevents >=1
	X varaible subtracted from the knot
						*creating spline X variables
						gen EventsSP=Nevents-1
						gen AvertedSP=Naverted-1
						gen LynchSP=nevents-1

OUTCOME VARIABLES
*Percent Trump										ntrump/nvotes


*/

/*For the variables listed above, all the values (except binary state code) are 
summed by cluster code. There are two cluster variables clust1 and clust2. The first
includes an additional 10 years in the cluster range. To change the clusters used
change the stclust1 or stclust2 used in the following command*/



*Creating a clusterID variable, currently clusters are unique within state. This creates a cluster variable that's unique across state.
tostring clust1 clust2, replace
gen stclust1=st+"."+clust1 /* AKB: Using stclust1 reduces cases to N=479 */
gen stclust2=st+"."+clust2 /* AKB: */

*Variable MedInc_BHH contains some dashes "-" these are removed prior to collapse
		replace MedInc_BHH="" if MedInc_BHH=="-"
		replace MedInc_BHH="2500" if MedInc_BHH=="2,500-"

 destring Alabama     					///
				Arkansas						///
				Florida							///
				Georgia							///
				Louisiana						///
				Mississippi						///
				NCarolina						///
				SCarolina						///
				Tennessee						///
				Virginia 						///
				Kentucky                        ///
				tag00             ///
				NCivEmpl 			///
				NEmpl_AgExtr  			///
				NEmpl_Constr  			///
				NEmpl_Manuf  			///
				NEmpl_Whlsl  			///
				NEmpl_Retail  			///
				NEmpl_Transport  			///
				Nempl_Info  			///
				Nempl_FIRE  			///
				Nempl_Prof  			///
				Nempl_EdHlth  			///
				Nempl_ArtRec  			///
				Nempl_OthSvc  			///
				NEmpl_PubAdm  			///
				Pop_Nativity  			///
				NNtvBorn  			///
				NFrnBorn  			///
				PctFrnBrn  			///
				NHholds  			///
				NBlk_Hholds  			///
				MedInc_BHH  			///
				NLat_Hholds  			///
				NNHW_Hholds  			///
				MedInc_NHWHH  			///
				pct_NHWhite  			///
				pct_Lat  			///
				pct_Black  			///
				NEmp_Stat  			///
				NLFP  			///
				NEmploy  			///
				NUnemploy  			///
				NMilitary  			///
				NNot_in_LF  			///
				NHouseholds  			///
				NHH_LT10K  			///
				NHH_10_15K  			///
				NHH_15_25K  			///
				NHH_100_150K  			///
				NHH_150_200K  			///
				NHH_GT200K  			///
				MedHHInc  			///
				MeanHHInc  			///
				NHH_SocSec  			///
				NHH_SSI  			///
				NHH_TANF  			///
				NHH_SNAP  			/// 			
				NFam_Inc  			///
				NFam_LT10K  			///
				NFam_10_15K  			///
				NFam_15_25K  			/// 			
				NFam_100_150K  			///
				NFam_150_200K  			/// 		
				NFam_GT200K  			///
				MedFamInc  			///
				MeanFamInc  			///
				MedWrkEarn  			///
				BasePop_HlthIns  			///
				NPop_HlthIns  			///
				PctFamPov  			///
				Pov_Rate  			///
				Pop_AgeSex  			///
				NPop_U5  			///
				NPop_5_9  			///
				NPop_10_14  			///
				NPop_15_19  			///
				NPop_20_24  			///
				NPop_65_74  			///
				NPop_75_84  			///
				NPop_85Plus  			/// 			
				Median_Age  			///
				NPop_24U  			///
				PctPop_24U  			///
				NPop_65Plus  			///
				PctPop_65Plus  			///
				totpop  			///
				county_evan  			///
				county_mainlineprot  			/// 			
				county_cath  			///
				county_other  			///
				county_orth  			///
				county_blkprot  			///
				county_evan_adh  			///
				county_mainlineprot_adh  			///
				county_cath_adh  			///
				county_other_adh  			///
				county_orth_adh  			///
				county_blkprot_adh  			///
				county_evan_cong  			///
				county_mainlineprot_cong  			///
				county_cath_cong  			///
				county_other_cong  			///
				county_orth_cong  			///
				county_blkprot_cong  			///
				nevents_blk  			///
				VicNum  			///
				NWhite  			///
				Nwht_eth  			///
				NBlack  			///
				NPOC  			///
				Naverted  			///
				nblkvic_sum  			///
				nfemvic_sum  			///
				nmalvic_sum  			///
				nothvic_sum  			///
				ntotvic_sum  			///
				nwhtvic_sum  			///
				mixedmob_sum  			///
				blackmob_sum  			///
				wht_sup_mob_sum  			///
				whitemob_sum  			///
				ntrump  			///
				nvotes  			///
				B05001_001  			///
				B05001_002  			///
				B05001_003  			///
				B05001_004  			///
				B05001_005  			///
				B05001_006  			///
				totpop1890  			///
				urb890  			/// 			
				blktot  			///
				whtot  			///
				farms  			///
				farmown  			///
				farmten  			/// 			
				farmsc  			///
				acimp  			///
				acunimp  			///
				cottonac  			///
				cotton  			///
				csugarac  			///
				riceac  			///
				tobacac  			///
				Trump  			///
				Clinton  			///
				TotVotes  			///
				pctTrump  			///
				r_T_C  			///
				NVote_Dem  			///
				NVote_Rep  			///
				NVote_Wallace  			///
				NVote_Other  			///
				NVote_Total1968  			///
				NVote_Total2012 			///
				NVote_Obama  			///
				NVote_Romney  			///
				totalurbanclusters  ///
				totalinsideurbanizedareas  ///
				totalurban  ///
				total_urbanrural  ///
				totalrural  ///
				Nevents, replace	


				
				
/*In the collapsing command below variables that are summed are ones that will
go into a calculated variable after collapse, else the variable is collapsed
by 'mean' or using 'first' which keeps the value. Outcome variables, calculated 
above, are recalculated after collapse. This is to prevent county values of small
counties to carry as much weight as larger counties. 



*/
				
collapse (first)Alabama     					///
				Arkansas						///
				Florida							///
				Georgia							///
				Louisiana						///
				Mississippi						///
				NCarolina						///
				SCarolina						///
				Tennessee						///
				Virginia 						///
				Kentucky                        ///
		   (sum)tag00             ///
		  (mean)NCivEmpl 			///
				NEmpl_AgExtr  			///
				NEmpl_Constr  			///
				NEmpl_Manuf  			///
				NEmpl_Whlsl  			///
				NEmpl_Retail  			///
				NEmpl_Transport  			///
				Nempl_Info  			///
				Nempl_FIRE  			///
				Nempl_Prof  			///
				Nempl_EdHlth  			///
				Nempl_ArtRec  			///
				Nempl_OthSvc  			///
				NEmpl_PubAdm  			///
				Pop_Nativity  			///
				NNtvBorn  			///
				NFrnBorn  			///
				PctFrnBrn  			///
				NHholds  			///
				NBlk_Hholds  			///
				MedInc_BHH  			///
				NLat_Hholds  			///
				NNHW_Hholds  			///
				MedInc_NHWHH  			///
				pct_NHWhite  			///
				pct_Lat  			///
				pct_Black  			///
				NEmp_Stat  			///
				NLFP  			///
				NEmploy  			///
				NUnemploy  			///
				NMilitary  			///
				NNot_in_LF  			///
				NHouseholds  			///
				NHH_LT10K  			///
				NHH_10_15K  			///
				NHH_15_25K  			///
				NHH_100_150K  			///
				NHH_150_200K  			///
				NHH_GT200K  			///
				MedHHInc  			///
				MeanHHInc  			///
				NHH_SocSec  			///
				NHH_SSI  			///
				NHH_TANF  			///
				NHH_SNAP  			/// 			
				NFam_Inc  			///
				NFam_LT10K  			///
				NFam_10_15K  			///
				NFam_15_25K  			/// 			
				NFam_100_150K  			///
				NFam_150_200K  			/// 		
				NFam_GT200K  			///
				MedFamInc  			///
				MeanFamInc  			///
				MedWrkEarn  			///
				BasePop_HlthIns  			///
				NPop_HlthIns  			///
				PctFamPov  			///
				Pov_Rate  			///
				Pop_AgeSex  			///
				NPop_U5  			///
				NPop_5_9  			///
				NPop_10_14  			///
				NPop_15_19  			///
				NPop_20_24  			///
				NPop_65_74  			///
				NPop_75_84  			///
				NPop_85Plus  			/// 			
				Median_Age  			///
				NPop_24U  			///
				PctPop_24U  			///
				NPop_65Plus  			///
				PctPop_65Plus  			///
				totpop  			///
				county_evan  			///
				county_mainlineprot  			/// 			
				county_cath  			///
				county_other  			///
				county_orth  			///
				county_blkprot  			///
				county_evan_adh  			///
				county_mainlineprot_adh  			///
				county_cath_adh  			///
				county_other_adh  			///
				county_orth_adh  			///
				county_blkprot_adh  			///
				county_evan_cong  			///
				county_mainlineprot_cong  			///
				county_cath_cong  			///
				county_other_cong  			///
				county_orth_cong  			///
				county_blkprot_cong  			///
				nevents_blk  			///
				VicNum  			///
				NWhite  			///
				Nwht_eth  			///
				NBlack  			///
				NPOC  			///
				Naverted  			///
				nblkvic_sum  			///
				nfemvic_sum  			///
				nmalvic_sum  			///
				nothvic_sum  			///
				ntotvic_sum  			///
				nwhtvic_sum  			///
				mixedmob_sum  			///
				blackmob_sum  			///
				wht_sup_mob_sum  			///
				whitemob_sum  			///
				ntrump  			///
				nvotes  			///
				B05001_001  			///
				B05001_002  			///
				B05001_003  			///
				B05001_004  			///
				B05001_005  			///
				B05001_006  			///
				totpop1890  			///
				urb890  			/// 			
				blktot  			///
				whtot  			///
				farms  			///
				farmown  			///
				farmten  			/// 			
				farmsc  			///
				acimp  			///
				acunimp  			///
				cottonac  			///
				cotton  			///
				csugarac  			///
				riceac  			///
				tobacac  			///
				Trump  			///
				Clinton  			///
				TotVotes  			///
				pctTrump  			///
				r_T_C  			///
				NVote_Dem  			///
				NVote_Rep  			///
				NVote_Wallace  			///
				NVote_Other  			///
				NVote_Total1968  			///
				NVote_Total2012  			///
				NVote_Obama  			///
				NVote_Romney  			///
			    totalurbanclusters  ///
				totalinsideurbanizedareas  ///
				totalurban  ///
				total_urbanrural  ///
				totalrural  ///
				Nevents,by(stclust2)
				
				
/********************************************************
EVERY THING BELOW THIS LINE IS GROUPED BY CLUSTER
*********************************************************/	
							
		/*****************************************************************
		CREATING CALCULATED VARIABLES
		*****************************************************************/							
			*Creating Calculated Control Variables
			rename PctPop_65Plus PctPop65plus
			gen PctPop25orunder		=((NPop_U5 + NPop_5_9 + NPop_10_14 + NPop_15_19 + NPop_20_24)/Pop_AgeSex) * 100
			gen PcthhNonhispwhite	=(NNHW_Hholds/NHholds) * 100
			gen PcthhBlk			=(NBlk_Hholds/NHholds) * 100
			gen PctWorkingclass		=((NEmpl_AgExtr + NEmpl_Constr + NEmpl_Manuf)/NCivEmpl) * 100
			gen PctUnemploy			=(NUnemploy/NEmp_Stat) * 100
			gen Pcthhlessthan25k	=((NHH_LT10K + NHH_10_15K + NHH_15_25K)/NHouseholds) * 100
			gen PcthhSSI			=(NHH_SSI/NHouseholds) * 100
			gen	Pctevangel			=(county_evan_adh/totpop) * 100
			gen changepercentFRNBrn         =(NFrnBorn/Pop_Nativity)-((B05001_004+B05001_005+B05001_006)/B05001_001)	
			gen Pcturban= (totalurban/total_urbanrural ) *100
			gen Pctprimary_republican= (nvotes/Pop_Nativity)*100
			
			
			gen st=.
				replace st=1 if (Alabama==1)
				replace st=2 if (Arkansas==1)
				replace st=3 if (Florida==1)
				replace st=4 if (Georgia==1)
				replace st=5 if (Louisiana==1)
				replace st=6 if (Mississippi==1)
				replace st=7 if (NCarolina==1)
				replace st=8 if (SCarolina==1)
				replace st=9 if (Tennessee==1)
				replace st=10 if (Virginia==1)	
				replace st=11 if (Kentucky==1)
			
			label define state 1"AL" 2"AR" 3"FL" 4"GA" 5"LA" 6"MS" 7"NC" 8"SC" 9"TN" 10"VA" 11"KY"
			label values st state
			
			
			*Calculated lynching variables
				*Generate a varaible that's number of total events
				*generate lynch ratio
				gen lynchratio=nevents/Nevents

			*Calculated outcome
			gen GeneralPcttrump=(Trump/TotVotes)*100
			gen PctRomney= (NVote_Romney/NVote_Total2012) * 100
			gen Trumpgain= GeneralPcttrump - PctRomney
			gen PctWallace= (NVote_Wallace/NVote_Total1968) * 100
			gen PrimaryPcttrump=(ntrump/nvotes) *100
			
			
			histogram PrimaryPcttrump, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump Primary Vote Distribution Post-Collapse")
			graph save Graph "Histogram of Trumpvote in Primary post-collapse.gph", replace

			histogram GeneralPcttrump, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump General Vote Distribution Post-Collapse")
			graph save Graph "Histogram of Trumpvote in General post-collapse.gph", replace


			*Calculating historical black%
			gen histblk=blktot/totpop1890
		
			* calculating ag variables
			gen pfarmown = farmown/farms 
			gen pcotton = cottonac/acimp
			gen plabcrop = (cottonac + csugarac + riceac + tobacac)/acimp 

			la var pfarmown "Pct. all farms owned (vs. rented / sharecropped)"
			la var pcotton "Pct. imrpvoed ag. acreage in cotton"
			la var plabcrop "Pct. Imp. ag land in cotton, cane, rice or tobacco"


replace lynchratio = 0 if lynchratio == .

gen noevents = 0
replace noevents = 1 if Nevents == 0

corr changepercentFRNBrn PrimaryPcttrump histblk pfarmown pcotton plabcrop totpop totpop1890 ///
	whtot ntotvic_sum nvotes Naverted nevents_blk blktot PctPop65plus PctPop25orunder ///
	PcthhNonhispwhite PcthhBlk PctWorkingclass PctUnemploy Pcthhlessthan25k PcthhSSI ///
	Pctevangel

* save analysis.dta, replace

save analysis_collapse.dta, replace

*********************************************************************************************************
*Generates the dataset that excludes cases with zero lynchings and zero threatened lynchings
*********************************************************************************************************
/*
This do file creates the analysis dataset for the November submission. Running 
this do file will update the analysis.dta used for the november analysis (updated 
from "First Submission Regressions" after we recieved reviewer comments).




		The steps of this do file are ...

		1) add labels to the full data 
		2) collapse data by cluster2 for analysis
		3) create a variable indicating observations included in our final sample. 

*/


capture log close
clear all

        cd ..
		cd ..
		use "FullMerge.dta"
		cd "Analysis"
		cd "Nov Submission"

		
*******************************************************************************
*Adding variable labels to County level data
******************************************************************************		
			label variable	uniqfips "County fips code from the ACS"
			label variable county_ACS "County name listed in ACS 2017" 
			label variable County_relig "County name listed in Religious data 2010" 
			label variable County_victim "County listed in victim dataset"
			label variable nevents_blk "Lynching N events with black victim/s in a county"
			label variable VicNum "Lynching N victims"
			label variable NWhite "Lynching N white victims "
			label variable Nwht_eth  "Lynching N white ethnic victims"
			label variable NBlack  "Lynching N black victims"
			label variable NPOC  "Lynching N people of color"
			label variable Naverted  "averted N events (generated from collapse) "
			label variable  nblkvic_sum  "averted N black victims"
			label variable  nfemvic_sum "averted N female victims"
			label variable  nmalvic_sum  "averted N male victims"
			label variable  nothvic_sum  "averted N  victims of other race"
			label variable  ntotvic_sum  "averted N total victims"
			label variable  nwhtvic_sum  "averted N white victims" 
			label variable  mixedmob_sum  "averted N mobs of mixed race"
			label variable  blackmob_sum  "averted N black mobs"
			label variable  wht_sup_mob_sum  "averted N white supremacist mobs"
			label variable  whitemob_sum  "averted N white mobs"
			label variable  ntrump  "N votes for trump in primary"
			label variable  county_primaries  "county name in primary data"
			label variable  nvotes  "N all votes in primary"
			label variable  state  "Full state name"
			label variable  sticpsr "icpsr state code"
			label variable  stfips  "fips state code"
			label variable  cnticpsr  "icpsr county code"
			label variable  uniqicpsr  "icpsr combined state/county id"
			label variable  B05001_001  "Total Population ACS2010"
			label variable  B05001_002  "US Born ACS2010"
			label variable  B05001_003  "Born in territories ACS2010"
			label variable  B05001_004  "Foreign Born - US Parents ACS2010"
			label variable  B05001_005  "Foreign Born - Naturalized ACS2010"
			label variable  B05001_006  "Foreign Born - Not Naturalized ACS2010"
			label variable county_fbpop "County name listed in 2010 ACS file"
			label variable statfips "state fips code"
			label variable staticpsr "state icpsr code"
			label variable cntycode "county code"
			label variable County_hist "name of county in historical agricultural/demographic/cluster data"
			rename negtot blktot
			label variable blktot "total black population 1890"
			label variable whtot "total white population 1890"
			label variable acimp "Number of improved acres in farms 1890"
			label variable acunimp "Number of unimproved acres in farms 1890"
			label variable county_clust "county name listed in cluster data" 
			rename County County_general
			label variable County_general "county name listed in general election data"
			label variable TotVotes "Total votes in General" 
			label variable Trump "Total Trump votes in General"
			label variable Clinton "Total Clinton votes in General" 
			label variable statefips "state fips code"
			label variable pctTrump "Percent of total vote Trump won in the general"
			label variable r_T_C "Ratio of Trump to Clinton votes, general"
			label variable fulltoNovVote "Historical/ACS/Religious/Primary/victim data TO general election"
			label variable fullto1968 "historical/acs/religious/primary/victim/general to 68' election data"
			label variable NVote_Obama "N Votes for Obama 2012"
			label variable NVote_Romney "N Notes for Romney 2012"
			label variable County_2012 "County name listed in 2012 data" 
			label variable fullto2012 "all other data to 2012 data merge" 





		
/***************************************************************************
Pre-processing for collapse
****************************************************************************/
*Recode binary state variables based on all state variables
	replace Alabama=1 if (STATE=="AL" | State=="Alabama" )
	replace Arkansas=1 if (STATE== "AR" | State=="Arkansas" )
	replace Florida=1  if (STATE== "FL" | State=="Florida" )
	replace Georgia=1 if (STATE== "GA" | State=="Georgia" )
	replace Louisiana=1 if (STATE== "LA" | State=="Louisiana")
	replace Mississippi=1 if (STATE== "MS" | State=="Mississippi" )
	replace NCarolina=1 if (STATE== "NC" | State=="North Carolina" )
	replace SCarolina=1 if (STATE== "SC" | State=="South Carolina")
	replace Tennessee=1 if (STATE== "TN" | State=="Tenessee")
	replace Virginia=1 if (STATE== "VA" | State=="Virginia" )
	replace Kentucky=1 if (STATE=="KY" | State == "Kentucky")


				gen st=""
				replace st="AL" if (Alabama==1)
				replace st="AR" if (Arkansas==1)
				replace st="FL" if (Florida==1)
				replace st="GA" if (Georgia==1)
				replace st="LA" if (Louisiana==1)
				replace st="MS" if (Mississippi==1)
				replace st="NC" if (NCarolina==1)
				replace st="SC" if (SCarolina==1)
				replace st="TN" if (Tennessee==1)
				replace st="VA" if (Virginia==1)	
				replace st="KY" if (Kentucky==1)
				drop if st==""	

*Drop excess state, county and ID variables
drop  state State stfips sticpsr cnticpsr



*Coding missing values as zero for the outcome variables
replace nevents=0 if nevents==.
replace Naverted=0 if Naverted==. 
scatter pctTrump nblkvic_sum 

/*Creating a binary variable that tags all counties that have 0 averted events 
and 0 lynching events. We will run analysis seperate for a dataset that includes these 
and one that does not. This is because we thing the 0-0 counties might not actually be 
true zeros but missing data. so we will run these analyses twice */
gen Nevents=nevents_blk + Naverted 
gen tag00=.
replace tag00=1 if Nevents==0
drop if tag00==1

***looking at similar graphics for primary
gen primarytrump= (ntrump/nvotes)*100
histogram primarytrump, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump Vote Distribution Prior to Collapse")
graph save Graph "00Primary-Histogram of Trumpvote prior to collapse.gph", replace

twoway (scatter primarytrump nblkvic_sum), ytitle(Pct Trump(pre collapse)) xtitle(Number of Black Vic (pre collapse))title("Trump voting by violence (pre collapse)")
graph save Graph "00Primary-Trumpvotingbyviolenceprecollapse.gph",replace



/****************************************************************************
*Variables Used in Study						How the variable is calculated (after collapse)
****************************************************************************
*Calculated variables were calculated after collapsing by county


LOCAL DEMOGRAPHIC COMPOSITION
*Pct. Population Aged 65 and Older				    (NPop_65_74 + NPop_75_84 + NPop_85Plus)/Pop_AgeSex


*Pct. Population Aged Under 25						(NPop_U5 + NPop_5_9 + NPop_10_14 + NPop_15_19 + NPop_20_24)/Pop_AgeSex
*Percent Non-Hispanic White							NNHW_Hholds/NHholds
*Pct. Black											NBlk_Hholds/NHholds
*Pct. growth in foreign born						changepercentFRNBrn=(NFrnBorn/Pop_Nativity)-((B05001_004+B05001_005+B05001_006)/B05001_001)		
*Total Population 2017(in thousands)				Pop_Nativity


LABOR MARKET STRUCTURE
*Pct. Workers in Blue collar industries				(NEmpl_AgExtr + NEmpl_Constr + NEmpl_Manuf)/NCivEmpl
*Pct. Population Jobless							NUnemploy/NEmp_Stat

HOUSEHOLD ECONOMICS
*Pct. Households w/Income < $25,000					(NHH_LT10K + NHH_10_15K + NHH_15_25K)/NHouseholds
*Pct. Households Receiving SSI						NHH_SSI/NHouseholds

RELIGIOUS CHARACTARISTICS
*Percent of county that is evangelical protestant   county_evan_adh/totpop

HISTORICAL MEASURES /* AKB adds these */
* Percentage of farms owned 						farms/farmown * 100 /* 1890 measure of economic security */
* Percentage of population white					whtot/totpop1890 * 100 /* 1890 racial composiion */
* Percentage ag land in labor intensive crops		((tobacac + riceac + csugarac + cottonac)/acimp) * 100
* Percentage ag land in cotton						(cottonac/acimp) * 100

HISTORICAL MOB VIOLENCE
*Number of lynchings completed 1882-1930			nevents
*Number of lynchings threatened						Naverted
*Number of all events								Nevents=nevents+Naverted
*Ratio of lynching vics to total vics				lynchratio=nevents/Nevents

STATES
Binary variables for States in study				Alabama
													Arkansas
													Florida
													Georgia
													Louisiana
													Mississippi
													NCarolina
													SCarolina
													Tennessee
													Virginia
													Kentucky


#METHODS, SPLINE: for spline you need.... X+(X-knot)*dummy
 1) dummy variable for x on each side of the spline  
						*Creating spline dummy
						gen splinedummy =.
						replace splinedummy=0 if Nevents < 1  
						replace splinedummy=1 if Nevents >=1
	X varaible subtracted from the knot
						*creating spline X variables
						gen EventsSP=Nevents-1
						gen AvertedSP=Naverted-1
						gen LynchSP=nevents-1

OUTCOME VARIABLES
*Percent Trump										ntrump/nvotes


*/

/*For the variables listed above, all the values (except binary state code) are 
summed by cluster code. There are two cluster variables clust1 and clust2. The first
includes an additional 10 years in the cluster range. To change the clusters used
change the stclust1 or stclust2 used in the following command*/



*Creating a clusterID variable, currently clusters are unique within state. This creates a cluster variable that's unique across state.
tostring clust1 clust2, replace
gen stclust1=st+"."+clust1 /* AKB: Using stclust1 reduces cases to N=479 */
gen stclust2=st+"."+clust2 /* AKB: */

*Variable MedInc_BHH contains some dashes "-" these are removed prior to collapse
		replace MedInc_BHH="" if MedInc_BHH=="-"
		replace MedInc_BHH="2500" if MedInc_BHH=="2,500-"

 destring Alabama     					///
				Arkansas						///
				Florida							///
				Georgia							///
				Louisiana						///
				Mississippi						///
				NCarolina						///
				SCarolina						///
				Tennessee						///
				Virginia 						///
				Kentucky                        ///
				tag00             ///
				NCivEmpl 			///
				NEmpl_AgExtr  			///
				NEmpl_Constr  			///
				NEmpl_Manuf  			///
				NEmpl_Whlsl  			///
				NEmpl_Retail  			///
				NEmpl_Transport  			///
				Nempl_Info  			///
				Nempl_FIRE  			///
				Nempl_Prof  			///
				Nempl_EdHlth  			///
				Nempl_ArtRec  			///
				Nempl_OthSvc  			///
				NEmpl_PubAdm  			///
				Pop_Nativity  			///
				NNtvBorn  			///
				NFrnBorn  			///
				PctFrnBrn  			///
				NHholds  			///
				NBlk_Hholds  			///
				MedInc_BHH  			///
				NLat_Hholds  			///
				NNHW_Hholds  			///
				MedInc_NHWHH  			///
				pct_NHWhite  			///
				pct_Lat  			///
				pct_Black  			///
				NEmp_Stat  			///
				NLFP  			///
				NEmploy  			///
				NUnemploy  			///
				NMilitary  			///
				NNot_in_LF  			///
				NHouseholds  			///
				NHH_LT10K  			///
				NHH_10_15K  			///
				NHH_15_25K  			///
				NHH_100_150K  			///
				NHH_150_200K  			///
				NHH_GT200K  			///
				MedHHInc  			///
				MeanHHInc  			///
				NHH_SocSec  			///
				NHH_SSI  			///
				NHH_TANF  			///
				NHH_SNAP  			/// 			
				NFam_Inc  			///
				NFam_LT10K  			///
				NFam_10_15K  			///
				NFam_15_25K  			/// 			
				NFam_100_150K  			///
				NFam_150_200K  			/// 		
				NFam_GT200K  			///
				MedFamInc  			///
				MeanFamInc  			///
				MedWrkEarn  			///
				BasePop_HlthIns  			///
				NPop_HlthIns  			///
				PctFamPov  			///
				Pov_Rate  			///
				Pop_AgeSex  			///
				NPop_U5  			///
				NPop_5_9  			///
				NPop_10_14  			///
				NPop_15_19  			///
				NPop_20_24  			///
				NPop_65_74  			///
				NPop_75_84  			///
				NPop_85Plus  			/// 			
				Median_Age  			///
				NPop_24U  			///
				PctPop_24U  			///
				NPop_65Plus  			///
				PctPop_65Plus  			///
				totpop  			///
				county_evan  			///
				county_mainlineprot  			/// 			
				county_cath  			///
				county_other  			///
				county_orth  			///
				county_blkprot  			///
				county_evan_adh  			///
				county_mainlineprot_adh  			///
				county_cath_adh  			///
				county_other_adh  			///
				county_orth_adh  			///
				county_blkprot_adh  			///
				county_evan_cong  			///
				county_mainlineprot_cong  			///
				county_cath_cong  			///
				county_other_cong  			///
				county_orth_cong  			///
				county_blkprot_cong  			///
				nevents_blk  			///
				VicNum  			///
				NWhite  			///
				Nwht_eth  			///
				NBlack  			///
				NPOC  			///
				Naverted  			///
				nblkvic_sum  			///
				nfemvic_sum  			///
				nmalvic_sum  			///
				nothvic_sum  			///
				ntotvic_sum  			///
				nwhtvic_sum  			///
				mixedmob_sum  			///
				blackmob_sum  			///
				wht_sup_mob_sum  			///
				whitemob_sum  			///
				ntrump  			///
				nvotes  			///
				B05001_001  			///
				B05001_002  			///
				B05001_003  			///
				B05001_004  			///
				B05001_005  			///
				B05001_006  			///
				totpop1890  			///
				urb890  			/// 			
				blktot  			///
				whtot  			///
				farms  			///
				farmown  			///
				farmten  			/// 			
				farmsc  			///
				acimp  			///
				acunimp  			///
				cottonac  			///
				cotton  			///
				csugarac  			///
				riceac  			///
				tobacac  			///
				Trump  			///
				Clinton  			///
				TotVotes  			///
				pctTrump  			///
				r_T_C  			///
				NVote_Dem  			///
				NVote_Rep  			///
				NVote_Wallace  			///
				NVote_Other  			///
				NVote_Total2012  			///
				NVote_Total1968  			///
				NVote_Obama  			///
				NVote_Romney  			///
				totalurbanclusters  ///
				totalinsideurbanizedareas  ///
				totalurban  ///
				total_urbanrural  ///
				totalrural  ///
				Nevents, replace	


				
				
/*In the collapsing command below variables that are summed are ones that will
go into a calculated variable after collapse, else the variable is collapsed
by 'mean' or using 'first' which keeps the value. Outcome variables, calculated 
above, are recalculated after collapse. This is to prevent county values of small
counties to carry as much weight as larger counties. 



*/
				
collapse (first)Alabama     					///
				Arkansas						///
				Florida							///
				Georgia							///
				Louisiana						///
				Mississippi						///
				NCarolina						///
				SCarolina						///
				Tennessee						///
				Virginia 						///
				Kentucky                        ///
		   (sum)tag00             ///
		  (mean)NCivEmpl 			///
				NEmpl_AgExtr  			///
				NEmpl_Constr  			///
				NEmpl_Manuf  			///
				NEmpl_Whlsl  			///
				NEmpl_Retail  			///
				NEmpl_Transport  			///
				Nempl_Info  			///
				Nempl_FIRE  			///
				Nempl_Prof  			///
				Nempl_EdHlth  			///
				Nempl_ArtRec  			///
				Nempl_OthSvc  			///
				NEmpl_PubAdm  			///
				Pop_Nativity  			///
				NNtvBorn  			///
				NFrnBorn  			///
				PctFrnBrn  			///
				NHholds  			///
				NBlk_Hholds  			///
				MedInc_BHH  			///
				NLat_Hholds  			///
				NNHW_Hholds  			///
				MedInc_NHWHH  			///
				pct_NHWhite  			///
				pct_Lat  			///
				pct_Black  			///
				NEmp_Stat  			///
				NLFP  			///
				NEmploy  			///
				NUnemploy  			///
				NMilitary  			///
				NNot_in_LF  			///
				NHouseholds  			///
				NHH_LT10K  			///
				NHH_10_15K  			///
				NHH_15_25K  			///
				NHH_100_150K  			///
				NHH_150_200K  			///
				NHH_GT200K  			///
				MedHHInc  			///
				MeanHHInc  			///
				NHH_SocSec  			///
				NHH_SSI  			///
				NHH_TANF  			///
				NHH_SNAP  			/// 			
				NFam_Inc  			///
				NFam_LT10K  			///
				NFam_10_15K  			///
				NFam_15_25K  			/// 			
				NFam_100_150K  			///
				NFam_150_200K  			/// 		
				NFam_GT200K  			///
				MedFamInc  			///
				MeanFamInc  			///
				MedWrkEarn  			///
				BasePop_HlthIns  			///
				NPop_HlthIns  			///
				PctFamPov  			///
				Pov_Rate  			///
				Pop_AgeSex  			///
				NPop_U5  			///
				NPop_5_9  			///
				NPop_10_14  			///
				NPop_15_19  			///
				NPop_20_24  			///
				NPop_65_74  			///
				NPop_75_84  			///
				NPop_85Plus  			/// 			
				Median_Age  			///
				NPop_24U  			///
				PctPop_24U  			///
				NPop_65Plus  			///
				PctPop_65Plus  			///
				totpop  			///
				county_evan  			///
				county_mainlineprot  			/// 			
				county_cath  			///
				county_other  			///
				county_orth  			///
				county_blkprot  			///
				county_evan_adh  			///
				county_mainlineprot_adh  			///
				county_cath_adh  			///
				county_other_adh  			///
				county_orth_adh  			///
				county_blkprot_adh  			///
				county_evan_cong  			///
				county_mainlineprot_cong  			///
				county_cath_cong  			///
				county_other_cong  			///
				county_orth_cong  			///
				county_blkprot_cong  			///
				nevents_blk  			///
				VicNum  			///
				NWhite  			///
				Nwht_eth  			///
				NBlack  			///
				NPOC  			///
				Naverted  			///
				nblkvic_sum  			///
				nfemvic_sum  			///
				nmalvic_sum  			///
				nothvic_sum  			///
				ntotvic_sum  			///
				nwhtvic_sum  			///
				mixedmob_sum  			///
				blackmob_sum  			///
				wht_sup_mob_sum  			///
				whitemob_sum  			///
				ntrump  			///
				nvotes  			///
				B05001_001  			///
				B05001_002  			///
				B05001_003  			///
				B05001_004  			///
				B05001_005  			///
				B05001_006  			///
				totpop1890  			///
				urb890  			/// 			
				blktot  			///
				whtot  			///
				farms  			///
				farmown  			///
				farmten  			/// 			
				farmsc  			///
				acimp  			///
				acunimp  			///
				cottonac  			///
				cotton  			///
				csugarac  			///
				riceac  			///
				tobacac  			///
				Trump  			///
				Clinton  			///
				TotVotes  			///
				pctTrump  			///
				r_T_C  			///
				NVote_Dem  			///
				NVote_Rep  			///
				NVote_Wallace  			///
				NVote_Other  			///
				NVote_Total2012  			///
				NVote_Total1968			///
				NVote_Obama  			///
				NVote_Romney  			///
				totalurbanclusters  ///
				totalinsideurbanizedareas  ///
				totalurban  ///
				total_urbanrural  ///
				totalrural  ///
				Nevents,by(stclust2)
				
				
/********************************************************
EVERY THING BELOW THIS LINE IS GROUPED BY CLUSTER
*********************************************************/	
							
		/*****************************************************************
		CREATING CALCULATED VARIABLES
		*****************************************************************/							
			*Creating Calculated Control Variables
			rename PctPop_65Plus PctPop65plus
			gen PctPop25orunder		=((NPop_U5 + NPop_5_9 + NPop_10_14 + NPop_15_19 + NPop_20_24)/Pop_AgeSex) * 100
			gen PcthhNonhispwhite	=(NNHW_Hholds/NHholds) * 100
			gen PcthhBlk			=(NBlk_Hholds/NHholds) * 100
			gen PctWorkingclass		=((NEmpl_AgExtr + NEmpl_Constr + NEmpl_Manuf)/NCivEmpl) * 100
			gen PctUnemploy			=(NUnemploy/NEmp_Stat) * 100
			gen Pcthhlessthan25k	=((NHH_LT10K + NHH_10_15K + NHH_15_25K)/NHouseholds) * 100
			gen PcthhSSI			=(NHH_SSI/NHouseholds) * 100
			gen	Pctevangel			=(county_evan_adh/totpop) * 100
			gen changepercentFRNBrn         =(NFrnBorn/Pop_Nativity)-((B05001_004+B05001_005+B05001_006)/B05001_001)	
			gen Pcturban= (totalurban/total_urbanrural ) *100
			gen Pctprimary_republican= (nvotes/Pop_Nativity)*100

			
			gen st=.
				replace st=1 if (Alabama==1)
				replace st=2 if (Arkansas==1)
				replace st=3 if (Florida==1)
				replace st=4 if (Georgia==1)
				replace st=5 if (Louisiana==1)
				replace st=6 if (Mississippi==1)
				replace st=7 if (NCarolina==1)
				replace st=8 if (SCarolina==1)
				replace st=9 if (Tennessee==1)
				replace st=10 if (Virginia==1)	
				replace st=11 if (Kentucky==1)
			
			label define state 1"AL" 2"AR" 3"FL" 4"GA" 5"LA" 6"MS" 7"NC" 8"SC" 9"TN" 10"VA" 11"KY"
			label values st state
			
			
			*Calculated lynching variables
				*Generate a varaible that's number of total events
				*generate lynch ratio
				gen lynchratio=nevents/Nevents

			*Calculated outcome
			gen GeneralPcttrump=(Trump/TotVotes)*100
			gen PctRomney= (NVote_Romney/NVote_Total2012) * 100
			gen Trumpgain= GeneralPcttrump - PctRomney
			gen PctWallace= (NVote_Wallace/NVote_Total1968) * 100
			gen PrimaryPcttrump=(ntrump/nvotes) *100

			
			histogram PrimaryPcttrump, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump Primary Vote Distribution Post-Collapse")
			graph save Graph "00Histogram of Trumpvote in Primary post-collapse.gph", replace

			histogram GeneralPcttrump, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump General Vote Distribution Post-Collapse")
			graph save Graph "00Histogram of Trumpvote in General post-collapse.gph", replace


			*Calculating historical black%
			gen histblk=blktot/totpop1890
		
			* calculating ag variables
			gen pfarmown = farmown/farms 
			gen pcotton = cottonac/acimp
			gen plabcrop = (cottonac + csugarac + riceac + tobacac)/acimp 

			la var pfarmown "Pct. all farms owned (vs. rented / sharecropped)"
			la var pcotton "Pct. imrpvoed ag. acreage in cotton"
			la var plabcrop "Pct. Imp. ag land in cotton, cane, rice or tobacco"



replace lynchratio = 0 if lynchratio == .

gen noevents = 0
replace noevents = 1 if Nevents == 0

corr changepercentFRNBrn PrimaryPcttrump histblk pfarmown pcotton plabcrop totpop totpop1890 ///
	whtot ntotvic_sum nvotes Naverted nevents_blk blktot PctPop65plus PctPop25orunder ///
	PcthhNonhispwhite PcthhBlk PctWorkingclass PctUnemploy Pcthhlessthan25k PcthhSSI ///
	Pctevangel

* save analysis.dta, replace

save 00analysis_collapse.dta, replace

clear all
