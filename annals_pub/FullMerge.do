/*
Author: R.Abbott
Last Updated: 7.8.20
This do file merges together the following datasets for analysis

	ACS_Merged-												2017 ACS data
	religious_data-											data on county religious characteristics
	Averted_Data-											data on averted lynching events
	Lynch_Counts_All OR Lynch_Counts_atleast1black-			data on lynching events (either all OR events with at least 1 black vic)
	primary_merged-											primary election data
	Demog_Ag_1890-											combined demographics and agricultural data from 1890
	FBPop_2010_All_States-									2010 ACS data
*/

/*Note: We don't have data for primary elections for KY (primary_merge.do) no data file included
		We don't have general election data for ky (2020.07.20.General_Election.do) no data file included
		We don't have KY in D.C.'s data. 
 */



clear all


*****************************************************************************
* UPDATING ALL DATA FILES BY RE-RUNNING DO FILES THAT CREATED THEM
*Note: the religious data created by "Religious Data\religioius_data.do" is not
*re-run here because it is a very slow running do file. 
****************************************************************************
			cd ACS_Data
			do ACS_Merge.do
			cd ..

			cd Victim_Data
			do 7.8.Averted_Cleaning_RA.do
			do 7.8.Lynch_Counts_RA.do
			cd ..

			cd Primary_Elections
			do primary_merge.do
			cd ..

			cd Summary_File_ACS2006-10
			do FBPop_2010_All_States.do
			cd ..

			cd Cluster_demog_ag
			do Merge_1890_Clust.do
			cd ..

			cd General_election
			do AllStates.do
			cd ..
		
			cd "1968 data"
			do 1968.do
			cd ..
			
			cd "Election_Data_2012"
			do Vote2012.do
			cd ..

			cd "urban_rural"
			do urban_rural.do
			cd ..
********************************************************************************
*CONTEMPORARY ACS DEMOGRAPHIC DATA
********************************************************************************
*Get contemporary demographic data from ACS
		cd "ACS_Data"
		use ACS_Merged.dta

********************************************************************************
*RELIGIOUS DATA
********************************************************************************
*Merge ACS and religious data
		cd ..
		cd "Religious Data"
		merge m:m uniqfips Alabama Arkansas Florida Georgia Kentucky Louisiana ///
		Mississippi NCarolina SCarolina Tennessee Virginia using religious_data.dta
		rename _merge ACS_TO_Relig
		la var ACS_TO_Relig "Merge ACS 2017 to religious data"

		
********************************************************************************
*LYNCH VICTIM DATA: BY DEFAULT USES ONLY CASES WITH AT LEAST 1 BLACK VICTIM
********************************************************************************

*Get victim data
		/*Lynch data is not unique by county, the data is collapsed by county
		for merging purposes*/
		cd ..
		cd "Victim_Data"
		save fulldata_temp.dta,replace
		clear

		
		*Collapsing averted lynching data
		*Note in Lynch_Counts.dta FIPSCnty was recoded to FIPSLynch for merging

		use Averted_Data.dta
		
		replace nblkvic = "2" if nblkvic=="Multiple"
		replace nmalvic = "2" if nmalvic=="Multiple"
		
		*updated 7.8.20, removed mob variables from destring command
		destring nblkvic nfemvic nmalvic nothvic nwhtvic,replace
		
/*WARNING: If using victim data Lynch_Counts_atleast1black, then run line 78
else, comment it out. The Lynch_Counts_atleast1black is all events
with at least one black victim collapsed by county. If using this then all events 
without at least one black vic, should be dropped from Averted_Data.dta before collapse
Line 69 drops 698 cases. 
*/
		keep if nblkvic!=0

		gen avertedevents=1
		
		collapse (first) State County (sum) Naverted=avertedevents nblkvic_sum=nblkvic nfemvic_sum=nfemvic 		///
		nmalvic_sum=nmalvic nothvic_sum=nothvic  ntotvic_sum=ntotvic nwhtvic_sum=nwhtvic mixedmob_sum=mixedmob  ///
		blackmob_sum=blackmob wht_sup_mob_sum=wht_sup_mob whitemob_sum=whitemob  			///
		, by(FIPSLynch) 
		

		
		save Averted_Data_collapsed.dta, replace
		clear all
	
/*WARNING: If using Lynch_Counts_atleast1black run line 78 and 98, else skip 78 and change line 98 to "use Lynch_Counts_All.dta"*/
		use Lynch_Counts_atleast1black.dta
		rename uniqfips FIPSLynch
		
		*Merging Lynching and averted lynching data
		merge m:m FIPSLynch using Averted_Data_collapsed.dta
		

		rename _merge Lynch_TO_Averted
		la var Lynch_TO_Averted "Merge Lynching data to averted lynching data"
	
		rename State STATE
		rename County County_victim
		rename FIPSLynch uniqfips
		
		save Averted_and_Lynched_collapsed_combined.dta,replace
		clear all
		
		*Merging collapsed and combined victim data with the current data
		use fulldata_temp.dta
		
		merge m:m uniqfips using Averted_and_Lynched_collapsed_combined.dta

		rename _merge ACSRelig_TO_Victim
		la var ACSRelig_TO_Victim "Merging ACS-religious data to victim data"
****************************************************************************************
*PRIMARY ELECTIONS
****************************************************************************************
	/*
	Note Manassas Park City, Prince William County and Manassas City have the
	the same uniqfips and uniqicpsr codes (511530 401530) respectively
	Poguoson City and York County have the same uniqfips and uniqicspsr codes (511990 401990) 
	They have different vote counts so they aren't true duplicates. 
	*/
		cd ..
		cd "Primary_Elections"

		*fips code in voting data is labeled uniqfips and has trailing zeros,
		*updating full data id to match. 
		
		merge m:m uniqfips using primary_merged.dta
		
		
		rename _merge ACSReligVictim_TO_Primary
		la var ACSReligVictim_TO_Primary "ACS-religious-victim data merged to election data"
		cd ..
**********************************************************************************
*Foreign born 2010
*********************************************************************************
		*ACS-Foreign born 2010 is stored in a seperate datafile, to calculate change in 
		*in foreign born we merge 2017 foreign born (above) and 2010 below
				cd Summary_File_ACS2006-10
				merge m:m uniqfips using FBPop_2010_All_States.dta

				rename _merge ACSReligVictimPrimary_TO_ACS2010
				la var ACSReligVictimPrimary_TO_ACS2010 "Merging 2017ACS-Religiousdata-Victimdata-Primary data to old 2010 ACS data"
				
**********************************************************************************	
*CLUSTER AND HISTORICAL DEMOGRAPHIC DATA
*********************************************************************************			
*Get cluster data which has already been merged with historical demographic and
*agricultural data
		cd ..
		cd "Cluster_demog_ag"

		*replace uniqfips= uniqfips
		merge m:m uniqfips using Demog_Ag_1890.dta

		rename _merge ACSallReligVicPrimary_TO_Cluster
		la var ACSallReligVicPrimary_TO_Cluster "Merging all data to the cluster data"
		cd ..
		


**********************************************************************************
*CONTEMPORARY VOTING
**********************************************************************************
**Merging contemporary voting dataset
		cd "General_election"

		merge m:m uniqfips using AllStates.dta
		rename _merge fulltoNovVote
		
		cd ..

		
********************************************************************************
*1968 Wallace data
********************************************************************************

		cd "1968 data"
		merge m:m uniqfips using 1968.dta
		rename _merge fullto1968
		cd ..
	
	
	
*********************************************************************************
*2012 voting data
********************************************************************************

		cd "Election_Data_2012"
		merge m:m uniqfips using Vote2012.dta
		rename _merge fullto2012
		cd ..


		
*****************************************************
*Urban Rual data
*******************************************************
		cd "urban_rural"
		merge m:m uniqfips using urban_rural.dta
		rename _merge fulltourbanrual
		rename county county_urbanrual
		rename total total_urbanrural
		
		
		cd ..
		save FullMerge.dta, replace
		
		
		
		
/*****************************************************************************************		
*****************************************************************************************		
*****************************************************************************************		
****NOTE: here down merges and runs anova on DC data, this is not included in our analysis 
*and will not be available in our repository since David Cunningham owns the data the results 
of these tests will still be in the logfile in the DC_data folder
		
		
		
		cd "DC_Data"
		tostring stfips,replace
		gen tempid= County + stfips
		
		sort tempid
		by tempid: gen dup=_n
		sort dup
		drop if dup>1
		save FullMerge.dta, replace
		clear all
*Merging DC data 


usespss using "klan_presence.sav"


 gen stfips=.
 replace stfips=37 if State=="NC"
 replace stfips=45 if State=="SC"
 replace stfips=47 if State=="TN"
 replace stfips=28 if State=="MS"
 replace stfips=22 if State=="LA"
 replace stfips=13 if State=="GA"
 replace stfips=12 if State=="FL"
 replace stfips=5 if State=="AR"
 replace stfips=1 if State=="AL"
 replace stfips=51 if State=="VA"
 
 drop if State=="TX" 
 
 		tostring stfips,replace
		gen tempid= County + stfips
 save klan_presence.dta, replace
 
 merge 1:1 tempid using FullMerge.dta
 
tostring clust1 clust2, replace
gen stclust1=stfips+"."+clust1
gen stclust2=stfips+"."+clust2

destring        Alabama     					///
				Arkansas						///
				Florida							///
				Georgia							///
				Louisiana						///
				Mississippi						///
				NCarolina						///
				SCarolina						///
				Tennessee						///
				Virginia 						///
				NPop_65_74						///
				NPop_75_84						///
				NPop_85Plus						///
				Pop_AgeSex						///
				NPop_U5 						///
				NPop_5_9 						///
				NPop_10_14 						///
				NPop_15_19						///
				NPop_20_24						///
				NNHW_Hholds						///
				NHholds							///
				NBlk_Hholds						///
				NFrnBorn						///
				Pop_Nativity					///
				NEmpl_AgExtr 					///
				NEmpl_Constr					///
				NEmpl_Manuf						///
				NCivEmpl						///
				NUnemploy						///
				NEmp_Stat						///
				NHH_LT10K 						///
				NHH_10_15K						///
				NHH_15_25K						///
				NHouseholds						///
				NHH_SSI							///
				county_evan_adh					///
				totpop							///
				totpop1890						///
				ntotvic_sum						///
				ntrump							///
				nvotes							///
				B05001_001						///
				B05001_004						///
				B05001_005						///
				B05001_006						///
				Naverted						///
				nevents							///
				negtot 							///
				whtot 							///
				stfips							///
				KLAVERNS						///
				Trump							///
				TotVotes						///
				totpop1890, replace	

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
				stfips							///
		   (mean)NPop_65_74						///
				NPop_75_84						///
				NPop_85Plus						///
				Pop_AgeSex						///
				NPop_U5 						///
				NPop_5_9 						///
				NPop_10_14 						///
				NPop_15_19						///
				NPop_20_24						///
				NNHW_Hholds						///
				NHholds							///
				NBlk_Hholds						///
				NFrnBorn						///
				Pop_Nativity					///
				NEmpl_AgExtr 					///
				NEmpl_Constr					///
				NEmpl_Manuf						///
				NCivEmpl						///
				NUnemploy						///
				NEmp_Stat						///
				NHH_LT10K 						///
				NHH_10_15K						///
				NHH_15_25K						///
				NHouseholds						///
				NHH_SSI							///
				county_evan_adh					///
				totpop							///
				totpop1890						///
				ntotvic_sum						///
				ntrump							///
				nvotes							///
				B05001_001						///
				B05001_004						///
				B05001_005						///
				B05001_006						///
				Naverted						///
				nevents							///
				whtot 							///
				KLAVERNS						///
				Trump							///
				TotVotes						///
				negtot, by(stclust2)
	 
 
gen NovTrump= Trump/TotVotes 
 
log using KLAVERNS_tests, replace
/*Running anova for klan activity over pop. The following is an anova run on variables
meaned by cluster2 */

gen klavperwht= KLAVERNS/whtot*1000

oneway klavperwht stfips
pwmean klavperwht, over(stfips) mcompare(tukey) effects
 
save Full_Merge_with_DC_data.dta, replace
 
*/

log close

clear
