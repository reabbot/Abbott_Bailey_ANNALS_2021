/*
Analysis Code for "Historical Mob Violence and the 2016 Presidential Election"
Bailey, Abbott

*/


*add variables to collapse section
*create calcultaed foreing born
*replace outcome variables below
*re create spline variables
capture log close
clear all
 cd ..
 cd ..
 
use "FullMerge.dta"

cd "Analysis"
cd "First Submission Regressions"

/***************************************************************************
Pre-processing
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


			/*There were 16 uniqfips that didn't have state lables, these were present in the cluster data but not other data and were manually dropped
				uniqfips	State	County
				6660	Louisiana	CARROLL
				516060	va	Martinsville city
				470875	Tennessee	JAMES
				510535	Virginia	ELIZABETHCITY
				515150	Virginia	BEDFORDCITY
				517800	Virginia	SOUTHBOSTON
				132030	Georgia		MILTON
				511715	Virginia	NORFOLKCOUNTY
				511785	Virginia	SNORFOLKCITY
				511535	Virginia	PRINCESSANN
				220235	Louisiana	CARROLL
				511215	Virginia	NANSEMOND
				511135	Virginia	MANCHESTER
				515600	Virginia	CLIFTOORGECITY
				470871	Tennessee	JAMES
				511875	Virginia	WARWICK
				511877	Virginia	WARWICKCITY
				*/
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
	drop  state State stfips sticpsr cnticpsr County

*Examining outcome variable pre-collapse by cluster
gen Ytest=ntrump/nvotes
replace Ytest=Ytest*100
sum Ytest, detail
histogram Ytest, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump Vote Distribution Prior to Collapse")
graph save Graph "Histogram of Trumpvote prior to collapse.gph", replace


*Coding missing values as zero for the outcome variables

replace nevents=0 if nevents==.
replace Naverted=0 if Naverted==. 
scatter Ytest nblkvic_sum 

twoway (scatter Ytest nblkvic_sum), ytitle(Pct Trump(pre collapse)) xtitle(Number of Black Vic (pre collapse))title("Trump voting by violence (pre collapse)")

graph save Graph "Trumpvotingbyviolenceprecollapse.gph",replace

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
				Kentucky                        ///
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
* 				totpop1890						///
/* AKB adds */	whtot /*whtpop1890 */           /// 
/* AKB adds */	farms /* total N farms */		///
/* AKB adds */	farmown /* N farms owned */		///
/* AKB adds */	acimp /* acr improved ag land*/	///
/* AKB adds */	cottonac /* acr plant cotton */ ///
/* AKB adds */	csugarac  /* acr plant sugar */ ///
/* AKB adds */	riceac /* acr planted rice */	///
/* AKB adds */	tobacac /* acr planted tobac */	///
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
				totpop1890						///
				Trump							///
				TotVotes, replace	

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
/* AKB adds */	whtot /*whtpop1890 */           /// 
/* AKB adds */	farms /* total N farms */		///
/* AKB adds */	farmown /* N farms owned */		///
/* AKB adds */	acimp /* acr improved ag land*/	///
/* AKB adds */	cottonac /* acr plant cotton */ ///
/* AKB adds */	csugarac  /* acr plant sugar */ ///
/* AKB adds */	riceac /* acr planted rice */	///
/* AKB adds */	tobacac /* acr planted tobac */	///
				ntotvic_sum						///
				ntrump							///
				nvotes							///
				B05001_001						///
				B05001_004						///
				B05001_005						///
				B05001_006						///
				Naverted						///
				nevents							///
				Trump							///
				TotVotes						///
/* AKB */		negtot, by(stclust2)			/* We retain 558 using this cluster. */
/* 				negtot, by(stclust1) */			/* Only 479 clusters if we use this cluster */

			/********************************************************
			EVERY THING BELOW THIS LINE IS GROUPED BY CLUSTER
			*********************************************************/	
				
/*****************************************************************
CREATING CALCULATED VARIABLES
*****************************************************************/							
*Creating Calculated Control Variables
gen PctPop65plus		=(NPop_65_74 + NPop_75_84 + NPop_85Plus)/Pop_AgeSex
gen PctPop25orunder		=(NPop_U5 + NPop_5_9 + NPop_10_14 + NPop_15_19 + NPop_20_24)/Pop_AgeSex
gen PcthhNonhispwhite	=NNHW_Hholds/NHholds
gen PcthhBlk			=NBlk_Hholds/NHholds
gen PctWorkingclass		=(NEmpl_AgExtr + NEmpl_Constr + NEmpl_Manuf)/NCivEmpl
gen PctUnemploy			=NUnemploy/NEmp_Stat
gen Pcthhlessthan25k	=(NHH_LT10K + NHH_10_15K + NHH_15_25K)/NHouseholds
gen PcthhSSI			=NHH_SSI/NHouseholds
gen	Pctevangel			=county_evan_adh/totpop
gen changepercentFRNBrn         =(NFrnBorn/Pop_Nativity)-((B05001_004+B05001_005+B05001_006)/B05001_001)	

*Calculated lynching variables
	*Generate a varaible that's number of total events
	gen Nevents=nevents_blk + Naverted 
	*generate lynch ratio
	gen lynchratio=nevents/Nevents

*Calculated outcome
gen Pcttrump=ntrump/nvotes
histogram Pcttrump, frequency ytitle(Frequency) xtitle(Percent Trump Vote) title("Trump Vote Distribution Post-Collapse")
graph save Graph "Histogram of Trumpvote post-collapse.gph", replace

*Calculating historical black%
gen histblk=negtot/totpop1890

/* AKB adds below */
* calculating ag variables
gen pfarmown = farmown/farms 
gen pcotton = cottonac/acimp
gen plabcrop = (cottonac + csugarac + riceac + tobacac)/acimp 

la var pfarmown "Pct. all farms owned (vs. rented / sharecropped)"
la var pcotton "Pct. imrpvoed ag. acreage in cotton"
la var plabcrop "Pct. Imp. ag land in cotton, cane, rice or tobacco"



**********SPLINE VARIABLES ****************************************************

		*creating spline X variables for LINEAR x variables
		mkspline all_events0 1 all_events1 = Nevents	
		mkspline Averted0 1 Averted1=Naverted
		mkspline Lynch0 1 Lynch1=nevents
		mkspline Lynchratio0 .01 Lynchratio1=lynchratio

		*creating log version of outcomes (adding 1 to varaibles to avoid issues with logging)
		gen Neventsln = log(Nevents + 1)
		gen neventsln = log(nevents_blk + 1)
		gen Navertedln= log(Naverted+1)
		gen lynchratioln= log(lynchratio+.000000000001)
		
		*creating spline X variables for LOGGED x variables
		mkspline log_all_events0 .6931472 log_all_events1=Neventsln
		mkspline log_Averted0 .6931472 log_Averted1=Navertedln
		mkspline log_lynch0 .6931472 log_lynch1=neventsln
		mkspline log_lynchratio0 -26.937874 log_lynchratio1=lynchratio

* save analysis.dta, replace

save analysis_collapse.dta, replace


replace lynchratio = 0 if lynchratio == .

gen noevents = 0
replace noevents = 1 if Nevents == 0

corr changepercentFRNBrn Pcttrump histblk pfarmown pcotton plabcrop totpop totpop1890 ///
	whtot ntotvic_sum nvotes Naverted nevents_blk negtot PctPop65plus PctPop25orunder ///
	PcthhNonhispwhite PcthhBlk PctWorkingclass PctUnemploy Pcthhlessthan25k PcthhSSI ///
	Pctevangel




**************************************************************************
*Setting our variables- replace theses x and y variables with our variables
**************************************************************************
global xhistorical histblk			///
/* AKB */		   pfarmown			///
/* AKB */		   pcotton			///
/* AKB */		   plabcrop			///

global xcontrols PctPop65plus		///
				PcthhNonhispwhite	///	
				changepercentFRNBrn ///		
				PctWorkingclass		///		
				PctUnemploy			///
				Pcthhlessthan25k	///
				PcthhSSI			///
				Alabama				///
				Arkansas			///
				Florida				///
				Georgia				///
				Louisiana			///
				Mississippi			///
				NCarolina			///
				SCarolina			///
				Tennessee			///
				Kentucky            ///
				Virginia			///
				Pop_Nativity		///
				PctPop25orunder		///	
				PcthhBlk			///	
				Pctevangel		
				

	
		
				
global xfocal  Nevents 			///
			   Naverted			///
			   nevents_blk      ///
			   splinedummyall	///
			   splinedummyL		///
			   splinedummyAV	///
			   splinedummyratio	///
			   lynchratio		///
			   EventsSPlin		///
			   AvertedSPlin		///	
			   LynchSPlin		///
			   LynchratioSPlin	

			    
global y 	   Pcttrump



***************************************************************************
*Descriptive Statistics
***************************************************************************
/*corr $xcontrols
corr $xcontrols $xfocal  $y

/* AKB note: correlations too high:
PctPop65plus & PctPop25or~r r=-0.7948
PctPop25or~r & PcthhBlk r=-0.9686
Pcthhles~25k & PcthhSSI r = 0.7798
*/


describe $y $xcontrols
summarize $y $xfocal $xcontrols
list $y $xfocal $xcontrols

*Compare descriptives for xfocal =0 and xfocal>0 this will give evidence for spline
summarize $y $xcontrols if splinedummyall==0
summarize $y $xcontrols if splinedummyall>=1

*testing for non-linearity 
twoway (scatter $y Nevents) (lfit $y Nevents) (lowess $y Nevents)
twoway (scatter $y Naverted) (lfit $y Naverted) (lowess $y Naverted)
twoway (scatter $y lynchratio) (lfit $y lynchratio) (lowess $y lynchratio)
twoway (scatter $y nevents_blk) (lfit $y nevents_blk) (lowess $y nevents_blk)
*/

***************************************************************************
*Analysis
***************************************************************************
/*MODEL CONSIDERATIONS: One thing we should consider when running this model and writing,
is that when using a proportion as our outcome, our model is bound between 0 and 1.
Generally when modeling something that has bounds, we need to use a non-linear model
inorder to have the model assumptions line up with the shape of the data. We could use
a model built for proportions such as beta regression (paper here: https://www.ime.usp.br/~sferrari/beta.pdf).
However these models have the downside of not being as interpretable as linear regression.
Taking a look at our outcome variable Pcttrump (prior to collapse by cluster).
The distribution seems to be normally shaped with the bulk of the observations 
falling between .3 and .6. In this case I recommend we stick with a linear regression
since most of our data falls in the linear region of non-linear models. We will 
just have to be wary of directly interpreting the the extreme regions of the 
distribution (Pcttrump below .2 or above .8). If we keep our discussion to outcomes 
between .2-.8 I don't think a reviewer will fault us for using a linear model.
We should also look at this distribution after collapse to see if it follows the
same shape. 

histogram of the distribution is saved as Pcttrump_hist_priortocollapse.gph


. sum Ytest, detail

                            Ytest
-------------------------------------------------------------
      Percentiles      Smallest
 1%     .2302169       .1566879
 5%      .309099       .1678773
10%     .3388081       .1725476       Obs                 900
25%     .3964895       .1883098       Sum of Wgt.         900

50%     .4541486                      Mean           .4470252
                        Largest       Std. Dev.      .0816426
75%     .5038981        .658201
90%     .5450811       .6882353       Variance       .0066655
95%     .5669398       .6971027       Skewness      -.3949506
99%     .6046513       .6971027       Kurtosis       3.286145

. hist Ytest
(bin=29, start=.1566879, width=.01863499)

****Distribution of percent trump post collapse by cluster.

. sum Pcttrump, detail

                          Pcttrump
-------------------------------------------------------------
      Percentiles      Smallest
 1%     .2941318       .2724269
 5%     .3219108       .2941318
10%     .3375446       .2955545       Obs                 162
25%     .3789524        .310501       Sum of Wgt.         162

50%     .4390417                      Mean           .4319123
                        Largest       Std. Dev.      .0653668
75%     .4812302       .5573161
90%     .5134632       .5590008       Variance       .0042728
95%     .5367187       .5590551       Skewness      -.1818955
99%     .5590551       .5723684       Kurtosis       2.366749

. 

*/

/*Adding a spline into our model: Since the focal dependant variable is heavily 
skewed, with a large amount of observations at zero, we are adding a spline with
a knot at 1. Values below 1 will be allowed to have a seperate regression line from
values at or above 1. Our model assumes the observed relationships will behave 
differently for counties that reported zero lynchings or threatened lynchings and
prevents the rest of the regression from being affected by the large ammount of 
obeservations at zero. To interpret the spline in a regression, interpret the 
coefficients seperately for each side of the knot. We will interpret the "zero counties"
seperately from the rest of the counties. */

	
log using regressions, replace
****Just violence
*Just linear
		reg Pcttrump  Nevents 
		reg Pcttrump  nevents_blk 
		reg Pcttrump  Naverted 
		reg Pcttrump  lynchratio 

	
*Linear spline
		reg Pcttrump  all_events0  all_events1 
		reg Pcttrump  Averted0 Averted1
		reg Pcttrump  Lynch0 Lynch1
		reg Pcttrump  Lynchratio0  Lynchratio1
*Logged
		reg Pcttrump  Neventsln 
		reg Pcttrump  neventsln 
		reg Pcttrump  Navertedln
		reg Pcttrump  lynchratioln

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1
		reg Pcttrump  log_Averted0  log_Averted1
		reg Pcttrump  log_lynch0  log_lynch1
		reg Pcttrump  log_lynchratio0  log_lynchratio1
log close
		
		
log using regressions_histblk, replace
********Violence and hist black	
*Just linear
		reg Pcttrump  Nevents histblk 
		reg Pcttrump  nevents_blk histblk 
		reg Pcttrump  Naverted histblk 
		reg Pcttrump  lynchratio histblk 

*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk
		reg Pcttrump  Averted0 Averted1 histblk
		reg Pcttrump  Lynch0 Lynch1 histblk 
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk
*Logged
		reg Pcttrump  Neventsln histblk
		reg Pcttrump  neventsln histblk
		reg Pcttrump  Navertedln histblk
		reg Pcttrump  lynchratioln histblk

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk
		reg Pcttrump  log_Averted0  log_Averted1 histblk
		reg Pcttrump  log_lynch0  log_lynch1 histblk
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk
log close
		
log using regressions_histblk_pop, replace
********Violence, hist black and totpop
*Just linear
		reg Pcttrump  Nevents histblk totpop 
		reg Pcttrump  nevents_blk histblk totpop 
		reg Pcttrump  Naverted histblk totpop 
		reg Pcttrump  lynchratio histblk totpop 
*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk totpop
		reg Pcttrump  Averted0  Averted1 histblk totpop
		reg Pcttrump  Lynch0 Lynch1 histblk totpop
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk totpop
*Logged
		reg Pcttrump  Neventsln histblk totpop
		reg Pcttrump  neventsln histblk totpop
		reg Pcttrump  Navertedln histblk totpop
		reg Pcttrump  lynchratioln histblk totpop

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk totpop
		reg Pcttrump  log_Averted0  log_Averted1 histblk totpop
		reg Pcttrump  log_lynch0  log_lynch1 histblk totpop
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk totpop
log close	
	
log using regressions_histblk_pop_even, replace
********Violence, hist black, totpop, and evan

*Just linear
		reg Pcttrump  Nevents histblk totpop county_evan_adh 
		reg Pcttrump  nevents_blk histblk totpop county_evan_adh 
		reg Pcttrump  Naverted histblk totpop county_evan_adh 
		reg Pcttrump  lynchratio histblk totpop county_evan_adh 

*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk totpop county_evan_adh
		reg Pcttrump  Averted0  Averted1 histblk totpop county_evan_adh
		reg Pcttrump  Lynch0 Lynch1 histblk totpop county_evan_adh
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk totpop county_evan_adh
*Logged
		reg Pcttrump  Neventsln histblk totpop county_evan_adh
		reg Pcttrump  neventsln histblk totpop county_evan_adh
		reg Pcttrump  Navertedln histblk totpop county_evan_adh
		reg Pcttrump  lynchratioln histblk totpop county_evan_adh

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk totpop county_evan_adh
		reg Pcttrump  log_Averted0  log_Averted1 histblk totpop county_evan_adh
		reg Pcttrump  log_lynch0  log_lynch1 histblk totpop county_evan_adh
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk totpop county_evan_adh
log close
		
		
log using regressions_histblk_pop_even_65plus, replace
	********Violence, hist black, totpop,  evan, and popt 65plus
*Just linear
		reg Pcttrump  Nevents histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  nevents_blk histblk totpop county_evan_adh PctPop65plus 
		reg Pcttrump  Naverted histblk totpop county_evan_adh PctPop65plus 
		reg Pcttrump  lynchratio histblk totpop county_evan_adh PctPop65plus 

*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  Averted0  Averted1 histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  Lynch0 Lynch1 histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk totpop county_evan_adh PctPop65plus
*Logged
		reg Pcttrump  Neventsln histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  neventsln histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  Navertedln histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  lynchratioln histblk totpop county_evan_adh PctPop65plus

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  log_Averted0  log_Averted1 histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  log_lynch0  log_lynch1 histblk totpop county_evan_adh PctPop65plus
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk totpop county_evan_adh PctPop65plus
	
log close	
	
log using regressions_histblk_pop_even_65plus_non-hiswhite, replace
		
	********Violence, hist black, totpop,  evan, popt 65plus, percent non-his white
*Just linear
		reg Pcttrump  Nevents histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite 
		reg Pcttrump  nevents_blk histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  Naverted histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite 
		reg Pcttrump  lynchratio histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite 

*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  Averted0 Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  Lynch0 Lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
*Logged
		reg Pcttrump  Neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  Navertedln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  lynchratioln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  log_Averted0  log_Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  log_lynch0  log_lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite
log close	
	
	
log using regressions_histblk_pop_even_65plus_non-hiswhite_working, replace
			
	********Violence, hist black, totpop,  evan, popt 65plus,  non-his white, working class
*Just linear
		reg Pcttrump  Nevents histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass 
		reg Pcttrump  nevents_blk histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass 
		reg Pcttrump  Naverted histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass 
		reg Pcttrump  lynchratio histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass 

	
*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  Averted0  Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  Lynch0 Lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
*Logged
		reg Pcttrump  Neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  Navertedln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  lynchratioln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  log_Averted0  log_Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  log_lynch0  log_lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass
log close
		
		
log using regressions_histblk_pop_even_65plus_non-hiswhite_working_pfarmtown, replace
	********Violence, hist black, totpop,  evan, popt 65plus,  non-his white, working class, pfarmtown
*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  Averted0 Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  Lynch0 Lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
*Logged
		reg Pcttrump  Neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  Navertedln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  lynchratioln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  log_Averted0  log_Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  log_lynch0  log_lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pfarmown
	
log close

log using regressions_histblk_pop_even_65plus_non-hiswhite_working_pcotton, replace
	********Violence, hist black, totpop,  evan, popt 65plus,  non-his white, working class, pcotton
*Just linear
		reg Pcttrump  Nevents histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  nevents_blk histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  Naverted histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  lynchratio histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton

	
*Linear spline
		reg Pcttrump  all_events0  all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  Averted0 Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  Lynch0 Lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  Lynchratio0  Lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
*Logged
		reg Pcttrump  Neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  neventsln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  Navertedln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  lynchratioln histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton

*Logged spline
		reg Pcttrump  log_all_events0  log_all_events1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  log_Averted0  log_Averted1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  log_lynch0  log_lynch1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
		reg Pcttrump  log_lynchratio0  log_lynchratio1 histblk totpop county_evan_adh PctPop65plus PcthhNonhispwhite PctWorkingclass pcotton
	
			
	log close

**********************************************************
*Regressions selected by Amy 7.18.20
**********************************************************
/* File from AKB. Showing new models with ratio values (missing = 0) used together
 with dichotomous variable where 1 = no averted or completed lynchings.
Also correlations between potential X variables.*/

 *** HISTORICAL ***
corr histblk pfarmown pcotton plabcrop

*** DEMOGRAPHIC (historical and current) ***
corr histblk changepercentFRNBrn PcthhBlk PcthhNonhispwhite PctPop25orunder PctPop65plus

*** TAKE-AWAYS:
*** 1) pfarmown seems to be pretty well correlated with other historical measures
	
*** 2) Historical percent black is highly correlated with current pct. black AND current pct. white

*** 3) Age variables (pct. >= 65 and pct. <= 25) highly correlated

*** ECONOMIC variables (current & historical) ***

corr PctWorkingclass PctUnemploy Pcthhlessthan25k PcthhSSI Pctevangel pfarmown pcotton

*** TAKE-AWAY:

*** 1) SSI highly correlated with low income households

*** PROPOSED MODEL CORRELATIONS
corr PctPop65plus PcthhNonhispwhite PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn pfarmown

*** All correlations check out. Highest r=0.5598 for pfarmown & Pcthhnonhwhite
reg Pcttrump Nevents pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

reg Pcttrump nevents_blk pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

reg Pcttrump Naverted pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

reg Pcttrump lynchratio noevents pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

* As a separate check (without dichotomous for no events)
reg Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

 *** Also note: model fit statistics (these basic ones) don't improve much with racial violence measures
 reg Pcttrump pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

*** So we have significant coefficient, but not much added explanatary power (using R2, so maybe you can re-restimate and use some more sophisticated measures?)

gen lnpop= ln(totpop)
gen nolyn=.
replace nolyn =1 if nevents_blk==0
replace nolyn =0 if nevents_blk>=1

*Creating contemporary voting outcome
gen NovTrump= Trump/TotVotes


***********************************************************
*Tests
************************************************************

*selected regression
reg Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn


		predict DFBETAS, dfbeta(lynchratio)
		generate DFBETASabs= (abs(DFBETAS))
		generate DFBETASHi= (DFBETASabs)> (2/sqrt(551))
		/*DFBETASHi is a dummy variable that marks observations that have a hight influence
		on our regression line */
		tab DFBETASHi


		*Run the regression for both values of dfbetas
		reg Pcttrump lynchratio pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
		reg Pcttrump lynchratio pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

		twoway scatter Pcttrump lynchratio
		twoway scatter Pcttrump lynchratio if DFBETASHi==1

		*compare results get summary statistics for both to see if they represent special populations
		summarize Pcttrump lynchratio pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
		summarize Pcttrump lynchratio pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

/*with nolyn variable
reg Pcttrump  nolyn pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

		predict DFBETASno, dfbeta(lynchratio)
		generate DFBETASabsno= (abs(DFBETASno))
		generate DFBETASHino= (DFBETASabsno)> (2/sqrt(551))
		/*DFBETASHi is a dummy variable that marks observations that have a hight influence
		on our regression line */
		tab DFBETASHino


		*Run the regression for both values of dfbetas
		reg Pcttrump lynchratio nolyn pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHino==0
		reg Pcttrump lynchratio nolyn pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHino==1

		twoway scatter Pcttrump nolyn
		twoway scatter Pcttrump nolyn if DFBETASHino==1

		*compare results get summary statistics for both to see if they represent special populations
		summarize Pcttrump nolyn pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHino==0
		summarize Pcttrump nolyn pfarmown totpop  PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHino==1

		*/
		
		
*selected regression with dummy
reg Pcttrump lynchratio noevents pfarmown totpop PcthhNonhispwhite  PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn



		predict DFBETASdum, dfbeta(lynchratio)
		generate DFBETASabsdum= (abs(DFBETASdum))
		generate DFBETASHidum= (DFBETASabsdum)> (2/sqrt(551))
		/*DFBETASHi is a dummy variable that marks observations that have a hight influence
		on our regression line */
		tab DFBETASHidum


		*Run the regression for both values of dfbetas
		reg Pcttrump lynchratio noevents pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHidum==0
		reg Pcttrump lynchratio noevents pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHidum==1

		twoway scatter Pcttrump lynchratio
		twoway scatter Pcttrump lynchratio if DFBETASHidum==1

		*compare results get summary statistics for both to see if they represent special populations
		summarize Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHidum==0
		summarize Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHidum==1


*test of influence if predictor was logged
reg Pcttrump lynchratioln pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

		predict DFBETASln, dfbeta(lynchratioln)
		generate DFBETASabsln= (abs(DFBETASln))
		generate DFBETASHiln= (DFBETASabsln)> (2/sqrt(551))
		/*DFBETASHi is a dummy variable that marks observations that have a hight influence
		on our regression line */
		tab DFBETASHiln


		*Run the regression for both values of dfbetas
		reg Pcttrump lynchratioln pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHiln==0
		reg Pcttrump lynchratioln pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHiln==1

		twoway scatter Pcttrump lynchratioln
		twoway scatter Pcttrump lynchratioln if DFBETASHiln==1

		*compare results get summary statistics for both to see if they represent special populations
		summarize Pcttrump lynchratioln pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHiln==0
		summarize Pcttrump lynchratioln pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHiln==1


*Test of homoskedasticity

		*use robust standard errors in output, compare models
		regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn , vce(hc3)
		regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn 
		
*Variance Inflaction Factor
		regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		estat vif



*Plot residuals 
		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		predict yhat, residuals
		scatter yhat lynchratio

		
*look for nonlinearities->http://campusguides.lib.utah.edu/c.php?g=160853&p=1054160
		graph matrix Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, half
		*any apparent non-normalities above may need transformation
		kdensity totpop,normal
		
		
		*After running the regression run the following command on every x
		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot lynchratio,lowess

		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot pfarmown,lowess

		
		regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot totpop,lowess
		
		*running again with nonlinear totpop
		regress Pcttrump lynchratio pfarmown lnpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot lnpop,lowess
		
		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot PcthhNonhispwhite,lowess

		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot PctPop65plus,lowess

		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot PctWorkingclass,lowess

		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot PctUnemploy,lowess

		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot Pcthhlessthan25k,lowess
		
		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot Pctevangel,lowess
		
		qui regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		acprplot changepercentFRNBrn,lowess

		
*Plot predicted values 


*predicted values of primary voting on lynchratio
		regress Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn	
		
		mgen, at(lynchratio=(0(.1)1)) atmeans stub(regpred)
		desc regpred*
		list regpred*

		graph twoway (scatter Pcttrump lynchratio, msymbol(o))  (connected regpredxb regpredlynchratio, msize(small small)  ///		  
						mcolor(black)  ///
						lcolor(black)   ///
						ytitle("Percentage of Primary Trump Voting ", height(5))  ///
						ylabel(.1(.1).7)   ///
						ytick(.1(.05).7)   ///
						xtitle("Percentage of Violent Events That Were Lynchings", height(5))  ///
						xlabel(0(.1)1)   ///
						xtick(0(.05)1)   ///
						graphregion(color(white))  ///
						title("Mean County Cluster Trump Voting Regressed on Racial Violence", size(medium)) ),  ///
						legend( cols(1) size(small)  ///
						label(1 "County Cluster")  ///
						label(2 "Predicted Trump Winnings Holding Controls at Means"))
						graph export lynchratio_with_controls.png, replace
						
**********************************************************************	
*Contemporary voting regressions and Primary voting Regressions
**********************************************************************				
log using Nov_vs_primary,replace
		reg NovTrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		reg NovTrump nolyn pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

		reg Pcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		reg Pcttrump nolyn pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

	log close
	
	
****************************************************************
*Graphing averted and lynching events
***************************************************************
replace nevents_blk= nevents_blk/28
replace Naverted= Naverted/19



		regress Pcttrump nevents_blk pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn	
		mgen, at(nevents_blk=(0(.1)1)) atmeans stub(violent)
		desc violent*
		list violent*
		
		regress Pcttrump Naverted pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn	
		mgen, at(Naverted=(0(.1)1)) atmeans stub(avoided)
		desc avoided*
		list avoided*

		graph twoway (scatter Pcttrump lynchratio, msymbol(o))  (connected violentxb violentnevents_blk, msize(small small)  ///		  
						mcolor(black)  ///
						lcolor(black)   ///
						ytitle("Percentage of Primary Trump Voting ", height(5))  ///
						ylabel(.1(.1).7)   ///
						ytick(.1(.05).7)   ///
						xtitle("Number of Events Scaled from Zero to One", height(5))  ///
						xlabel(0(.1)1)   ///
						xtick(0(.05)1)   ///
						graphregion(color(white))  ///
						title("Regressions of Trump Voting on Lynching and Averted Lynching Events ", size(medium)) ) ///
						(connected avoidedxb avoidedNaverted, mcolor(green) lcolor(green) msize(small small)),     ///
						legend( cols(1) size(small)  ///
						label(1 "Observed Trump Voting by Ratio of Lynching Events to All Events")  ///
						label(2 "Predicted Trump Voting by Lynching Events")  ///
						label(3 "Predicted Trump Voting by Averted Lynching Events"))
						graph export events_and_averted_with_controls.png, replace
	

**********************************************************************
*Graphing nolyn interactions
**********************************************************************
reg Pcttrump PctWorkingclass pfarmown totpop i.nolyn##c.PcthhNonhispwhite PctPop65plus  PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
mgen, at(PcthhNonhispwhite=(0(.1)1) nolyn=(0 1)) atmeans stub(Graph2) 
des Graph2*

	graph twoway 	( line Graph2xb Graph2PcthhNonhispwhite 							///
					if Graph2nolyn == 0,				 					///
					lpattern(dash) 									 		/// 
					lwidth(medthick)											///
					lcolor(maroon) 										 	///
					ytitle("Percent of Vote Won by Trump", height(5))	 		///
					ylabel(.3(.05).6) 								 		///
					ytick(.3(.02).6) 										 	///
					xtitle("Percent NonHispanic White", height(5))		///
					xlabel(0(.1)1) 									 	///
					xtick(0(.05)1)   									 	///
					graphregion(color(white)) 							 	///
					bgcolor(white) 										 	///
					title("Moderation of Histories of Lynching Events on Percent White and Trump Voting", size(medsmall))  ///
					) 														///
					( line Graph2xb Graph2PcthhNonhispwhite							///
					if Graph2nolyn == 1,				 					///
					lpattern(solid) 									 	/// 
					lcolor(navyblue) 										 	///
					lwidth(medthick)											///
					ytitle("Percent of Vote Won by Trump", height(5))	 		///
					ylabel(.3(.05).6) 								 		///
					ytick(.3(.02).6) 										 	///
					xtitle("Percent NonHispanic White", height(5))		///
					xlabel(0(.1)1) 									 	///
					xtick(0(.05)1)   									 	///
					graphregion(color(white)) 							 	///
					title("Moderation of Histories of Lynching Events on Percent White and Trump Voting", size(medsmall)) ///
					bgcolor(white) 										 	///
					)												 		///
					 , legend( size(small) label(1 " Lynching Events") label(2 " No Lynching Events"))
				   graph export moderation_nolyn_pctwht_primaries.png, replace

	
	
	
	
	
	
	
	
	
	
	
	
	
		reg Pcttrump nolyn pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn


		graph twoway (lpolyci nevents_blk  Pcttrump, kernel(gaussian)) (lpolyci Naverted Pcttrump, kernel(gaussian)) 
		
		graph twoway (lpolyci nevents_blk  Pcttrump, lcolor(black)) (lpolyci Naverted Pcttrump, lcolor(green)   )

		graph twoway (lfitci nevents_blk Pcttrump) (lfitci Naverted Pcttrump) 
		
		graph twoway lfit nevents_blk Pcttrump
		
		
		hist nevents_blk , frequency kdensity
		hist Naverted , frequency kdensity

		
		sort Pcttrump

		
		

