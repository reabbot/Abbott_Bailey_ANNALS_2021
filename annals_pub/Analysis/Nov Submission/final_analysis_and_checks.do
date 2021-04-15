/*This is the do file that runs the final analyses and regression checks for 
publication., the analyses run here are as follows


1)Nested regression predicting trump's sucess in primaries using controls, and
lynchratio, as well as a test for the appropriateness of adding lynchratio. This
will be run with %repub primary votes as a control for "republican-ness". 



2)Nested regression predicting trump's success in general election, and lynchratio
as well as a test for the appropriateness of adding lynchratio. This will be run
with trumpgain as a controll for republican-ness. 


3)Regression predicting Romney's success in the general using lynchratio and 
trumpgain as controll for republican-ness. 


each regression is followed by the following tests. 





*/ 
set more off
capture log close
clear all
use analysis_collapse.dta


	
*NOTE: I tried these but we had a big problem with missing values.

		/*gen ncandi = .
		replace ncandi = 6 if state == "South Carolina"
		replace ncandi = 12 if state == "Alabama" | state == "North Carolina"
		replace ncandi = 13 if state == "Arkansas" | state == "Florida" | state == "Georgia" | ///
			state == "Mississippi" | state == "Virginia"
		replace ncandi = 14 if state == "Louisiana" | state == "Tennessee"*/


		gen ncandi = .
		replace ncandi = 6 if SCarolina == 1
		replace ncandi = 12 if Alabama == 1 | NCarolina == 1
		replace ncandi = 13 if Arkansas  == 1 | Florida == 1 | Georgia == 1 | ///
			Mississippi == 1 | Virginia == 1
		replace ncandi = 14 if Louisiana == 1 | Tennessee == 1



		/*gen ncandi = .
		replace ncandi = 6 if statfips == 45
		replace ncandi = 12 if statfips == 1 | statfips == 37
		replace ncandi = 13 if statfips  == 5 | statfips == 12 | statfips == 13 | ///
			statfips == 28 | statfips == 51
		replace ncandi = 14 if statfips == 22 | statfips == 47*/

/* Note: We still have 150 missing, but these are from Kentucky, which did not 
have a primary election because they held a caucus, so is not in the analyses
of primary elections. */


		gen primdate = 1 /* South Carolina: February 19. */
		replace primdate = 12 /* March 1 (2016 was a Leap Year) */ ///
			if Alabama == 1 | Arkansas == 1 | Georgia == 1 | ///
			Tennessee == 1 | Virginia == 1
		replace primdate = 16 /* March 5 */ if Louisiana == 1
		replace primdate = 19 /* March 8 */ if Mississippi == 1
		replace primdate = 26 /* March 15 */ if Florida == 1 | ///
			NCarolina == 1

/*
		gen primdate = 1 /* South Carolina: February 19. */
		replace primdate = 12 /* March 1 (2016 was a Leap Year) */ ///
			if statfips == 1 | statfips == 5 | statfips == 13 | ///
			statfips == 47 | statfips == 51
		replace primdate = 16 /* March 5 */ if statfips == 22
		replace primdate = 19 /* March 8 */ if statfips == 28
		replace primdate = 26 /* March 15 */ if statfips == 12 | ///
			statfips == 37
		replace primdate = . if Kentucky == 1*/


drop if missing(pfarmown, Pcturban, PcthhNonhispwhite, PctPop65plus, PctWorkingclass, PctUnemploy, Pcthhlessthan25k, Pctevangel, changepercentFRNBrn)


log using final_analysis_and_checks, replace

/**********************************************
1) Nested regression for primaries
************************************************/

		*Primary trump predicted by controls including primary republican-ness
		reg PrimaryPcttrump Pctprimary_republican pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
		est sto model1

*************************************************
*MODEL 1 in Publication
***************************************************
*Primary trump predicted by lynchratio and controls including primary republican-ness
reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
est sto model2
lrtest model1 model2

		***checks for reviewers added 3-14-21
					reg PrimaryPcttrump Pctprimary_republican primdate pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
					est sto model1checkdate

					reg PrimaryPcttrump Pctprimary_republican primdate lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
					est sto model2checkdate
					lrtest model1checkdate model2checkdate

					reg PrimaryPcttrump Pctprimary_republican ncandi pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
					est sto model1checkcandi

					reg PrimaryPcttrump Pctprimary_republican ncandi lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
					est sto model2checkcandi
					lrtest model1checkcandi model2checkcandi

					*checking to make sure ncandi and primdate should be added seperately
					reg PrimaryPcttrump Pctprimary_republican c.ncandi##c.primdate lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
		***end of checks added for reviewers

		*Testing for influence
				qui reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

				predict DFBETAS, dfbeta(lynchratio)
				generate DFBETASabs= (abs(DFBETAS))
				generate DFBETASHi= (DFBETASabs)> (2/sqrt(551))
				/*DFBETASHi is a dummy variable that marks observations that have a hight influence
				on our regression line */
				tab DFBETASHi

				*running regressions seperately for high and lo influence cases
				reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
				reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

				
				*summarizing all variables for high influence cases and non-high influence cases to see if they come from disparate populations
				sum PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
				sum PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

				drop DFBETAS
				drop DFBETASabs
				drop DFBETASHi
		*Test for homoskedasticity
				reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, vce(hc3)

		*Test for inflation
				qui reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				vif
				
		*Plot residuals 
				qui reg PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				predict yhat, residuals
				scatter yhat lynchratio
						
		*looking for nonlinearities
				graph matrix PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

		*predicted values of primary voting on lynchratio
		qui regress PrimaryPcttrump Pctprimary_republican lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		
		mgen, at(lynchratio=(0(.1)1)) atmeans stub(regpred)
		desc regpred*
		list regpred* in 1/20

		graph twoway (scatter PrimaryPcttrump lynchratio if PrimaryPcttrump>=30 & PrimaryPcttrump<=60 , msymbol(o))  (connected regpredxb regpredlynchratio, msize(small small)  ///		  
						mcolor(black)  ///
						lcolor(black)   ///
						ytitle("Percentage of Primary Trump Voting ", height(5))  ///
						ylabel(30(10)60)   ///
						ytick(30(05)60)   ///
						yscale(r(30 60))     ///
						xtitle("Proportion of Violent Events That Were Lynchings", height(5))  ///
						xlabel(0(.1)1)   ///
						xtick(0(.05)1)   ///
						graphregion(color(white)) ),  ///
						legend( cols(1) size(small)  ///
						label(1 "County Cluster")  ///
						label(2 "Predicted Trump Winnings Holding Controls at Means"))
						graph export primary_lynchratio_with_controls.png, replace
						
		drop regpred*
		drop yhat*

/**********************************************
2) Nested regression for general 2016
************************************************/

		*General trump predicted by lynch ratio and controls 
		reg General lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
		est sto model1

		

*************************************************
*MODEL 2 in Publication
***************************************************		
*General trump predicted by lynchratio and controls including trumpgain
reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
est sto model2
lrtest model1 model2



		*Testing for influence
				qui reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

				predict DFBETAS, dfbeta(lynchratio)
				generate DFBETASabs= (abs(DFBETAS))
				generate DFBETASHi= (DFBETASabs)> (2/sqrt(551))
				/*DFBETASHi is a dummy variable that marks observations that have a hight influence
				on our regression line */
				tab DFBETASHi

				*running regressions seperately for high and lo influence cases
				reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
				reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

				
				*summarizing all variables for high influence cases and non-high influence cases to see if they come from disparate populations
				sum General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
				sum General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

				drop DFBETAS
				drop DFBETASabs
				drop DFBETASHi
		*Test for homoskedasticity
				reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn,vce(hc3)

		*Test for inflation
				qui reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				vif
				
		*Plot residuals 
				qui reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				predict yhat, residuals
				scatter yhat lynchratio
						
		*looking for nonlinearities
				graph matrix General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn


		*predicted values of primary voting on lynchratio
				qui reg General Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		
		mgen, at(lynchratio=(0(.1)1)) atmeans stub(regpred)
		desc regpred*
		list regpred* in 1/20

		graph twoway (scatter General lynchratio if General>=45 & General<=75 , msymbol(o))  (connected regpredxb regpredlynchratio, msize(small small)  ///		  
						mcolor(black)  ///
						lcolor(black)   ///
						ytitle("Percentage of General Trump Voting ", height(5))  ///
						ylabel(45(10)75)   ///
						ytick(45(05)75)   ///
						yscale(r(45 75))     ///
						xtitle("Proportion of Violent Events That Were Lynchings", height(5))  ///
						xlabel(0(.1)1)   ///
						xtick(0(.05)1)   ///
						graphregion(color(white)) ),  ///
						legend( cols(1) size(small)  ///
						label(1 "County Cluster")  ///
						label(2 "Predicted Trump Winnings Holding Controls at Means"))
						graph export general_lynchratio_with_controls.png, replace
						
		drop regpred*
		drop yhat



/**********************************************
3) Nested regression for Romney General
************************************************/

			*General Romney predicted by controls 
			reg PctR  pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
			est sto model1

*************************************************
*MODEL 3 in Publication
***************************************************
*General Romney predicted by lynchratio and controls 
reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
est sto model2
lrtest model1 model2




		*Testing for influence
				qui reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				predict DFBETAS, dfbeta(lynchratio)
				generate DFBETASabs= (abs(DFBETAS))
				generate DFBETASHi= (DFBETASabs)> (2/sqrt(551))
				/*DFBETASHi is a dummy variable that marks observations that have a hight influence
				on our regression line */
				tab DFBETASHi

				*running regressions seperately for high and lo influence cases
				reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
				reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

				
				*summarizing all variables for high influence cases and non-high influence cases to see if they come from disparate populations
				sum PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==0
				sum PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn if DFBETASHi==1

				drop DFBETAS
				drop DFBETASabs
				drop DFBETASHi
		*Test for homoskedasticity
				reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn,vce(hc3)

		*Test for inflation
				qui reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				vif
				
		*Plot residuals 
				qui reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
				predict yhat, residuals
				scatter yhat lynchratio
						
		*looking for nonlinearities
				graph matrix PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn


		*predicted values of primary voting on lynchratio
				qui reg PctR  lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
		
		mgen, at(lynchratio=(0(.1)1)) atmeans stub(regpred)
		desc regpred*
		list regpred* in 1/20

		graph twoway (scatter PctR lynchratio if PctR>=45 & PctR<=75 , msymbol(o))  (connected regpredxb regpredlynchratio, msize(small small)  ///		  
						mcolor(black)  ///
						lcolor(black)   ///
						ytitle("Percentage of General Romney Voting ", height(5))  ///
						ylabel(45(10)75)   ///
						ytick(45(05)75)   ///
						yscale(r(45 75))     ///
						xtitle("Proportion of Violent Events That Were Lynchings", height(5))  ///
						xlabel(0(.1)1)   ///
						xtick(0(.05)1)   ///
						graphregion(color(white))  ),  ///
						legend( cols(1) size(small)  ///
						label(1 "County Cluster")  ///
						label(2 "Predicted Romney Winnings Holding Controls at Means"))
						graph export Romney_lynchratio_with_controls.png, replace
						
		drop regpred*
		drop yhat

*REGRESSIONS FOR APPENDIX
******************************************
*Wallace vote as outcome 
*******************************************

reg PctWallace lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
reg PrimaryPcttrump Pctprimary_republican primdate lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
reg General Trumpgain nevents_blk pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
reg General Trumpgain Naverted pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
reg PrimaryPcttrump Trumpgain nevents_blk pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta
reg PrimaryPcttrump Trumpgain Naverted pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn, beta

		
		
**************************************************************************
*Moderation graph
****************************************************************************		
gen nolyn=.
replace nolyn =1 if nevents_blk==0
replace nolyn =0 if nevents_blk>=1		
		
reg PrimaryPcttrump Pctprimary_republican  pfarmown Pcturban i.nolyn##c.PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
mgen, at(PcthhNonhispwhite=(0(10)100) nolyn=(0 1)) atmeans stub(Graph2) 
des Graph2*

	graph twoway 	( line Graph2xb Graph2PcthhNonhispwhite 							///
					if Graph2nolyn == 0,				 					///
					lpattern(dash) 									 		/// 
					lwidth(medthick)											///
					lcolor(maroon) 										 	///
					ytitle("Percent of Vote Won by Trump in Primary", height(5))	 		///
					ylabel(30(05)60) 								 		///
					ytick(30(02)60) 										 	///
					xtitle("Percent NonHispanic White", height(5))		///
					xlabel(0(10)100) 									 	///
					xtick(0(05)100)   									 	///
					graphregion(color(white)) 							 	///
					bgcolor(white) 										 	///
					) 														///
					( line Graph2xb Graph2PcthhNonhispwhite							///
					if Graph2nolyn == 1,				 					///
					lpattern(solid) 									 	/// 
					lcolor(navyblue) 										 	///
					lwidth(medthick)											///
					ytitle("Percent of Vote Won by Trump in Primary", height(5))	 		///
					ylabel(30(05)60) 								 		///
					ytick(30(02)60) 										 	///
					xtitle("Percent NonHispanic White", height(5))		///
					xlabel(0(10)100) 									 	///
					xtick(0(05)100)   									 	///
					graphregion(color(white)) 							 	///
					bgcolor(white) 										 	///
					)												 		///
					 , legend( size(small) label(1 " Lynching Events") label(2 " No Lynching Events"))
				   graph export moderation_nolyn_pctwht_primaries.png, replace

	
	
	
    drop Graph*
	
	
	
****************************************************************************
*3 Regression lines no controls 
*****************************************************************************

 twoway (lfit Primary lynchratio, lwidth(medthick) lpattern(solid) bgcolor(white)graphregion(color(white)) 	 )  ///
 (lfit General lynchratio, lwidth(medthick) lpattern(dash)) (lfit PctR  ///
  lynchratio, lwidth(medthick) lpattern(longdash)), ytitle(Percent of Votes Won by Candidate) xtitle(Ratio of Lynchings to Threatened Lynchings) legend(size(small)  label(1 "Trump Primary") label(2 "Trump General")  label(3 "Romney General"))  
     graph export votesbylynchratio.png, replace
	 
	 
	 
	 
*****************************************************************************
*3 Regression lines with controls
****************************************************************************	 


egen ZxR=std(lynchratio) if ~missing(PctR, lynchratio, pfarmown, Pcturban, PcthhNonhispwhite, PctPop65plus, PctWorkingclass, PctUnemploy, Pcthhlessthan25k, Pctevangel, changepercentFRNBrn)
egen Zrom=std(PctR) if ~missing(PctR, lynchratio, pfarmown, Pcturban, PcthhNonhispwhite, PctPop65plus, PctWorkingclass, PctUnemploy, Pcthhlessthan25k, Pctevangel, changepercentFRNBrn)

egen ZxG=std(lynchratio) if ~missing(General, lynchratio, pfarmown, Pcturban, PcthhNonhispwhite, PctPop65plus, PctWorkingclass, PctUnemploy, Pcthhlessthan25k, Pctevangel, changepercentFRNBrn)
egen Zgen=std(General) if ~missing(General, lynchratio, pfarmown, Pcturban, PcthhNonhispwhite, PctPop65plus, PctWorkingclass, PctUnemploy, Pcthhlessthan25k, Pctevangel, changepercentFRNBrn)

egen ZxP=std(lynchratio) if ~missing(Primar, lynchratio, pfarmown, Pcturban, PcthhNonhispwhite, PctPop65plus, PctWorkingclass, PctUnemploy, Pcthhlessthan25k, Pctevangel, changepercentFRNBrn)
egen Zprim=std(Primar) if ~missing(Primar, lynchratio, pfarmown, Pcturban, PcthhNonhispwhite, PctPop65plus, PctWorkingclass, PctUnemploy, Pcthhlessthan25k, Pctevangel, changepercentFRNBrn)




reg Zrom  ZxR pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
mgen,  at(ZxR=(-2(.20)2)) atmeans stub(ZR) 
des ZR*

reg Zgen  ZxG pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
mgen,  at(ZxG=(-2(.20)2)) atmeans stub(ZG) 
des ZG*

reg Zprim  ZxP pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
mgen,  at(ZxP=(-2(.20)2)) atmeans stub(ZP) 
des ZP*




	graph twoway 	( line ZRxb ZRZxR ,							///
					lpattern(longdash) 									 		/// 
					lwidth(medthick)											///
					lcolor(green) 										 	///
					xlabel(-2(.40)2) 									 	///
					xtick(-2(.20)2)   									 	///
					graphregion(color(white)) 							 	///
					bgcolor(white) 										 	///
					) 														///
					( line ZGxb ZGZxG ,							///
					lpattern(dash) 									 		/// 
					lwidth(medthick)											///
					lcolor(maroon) 										 	///
					graphregion(color(white)) 							 	///
					bgcolor(white) 										 	///
					) 														///
					( line ZPxb ZPZxP ,							///
					lpattern(solid) 									 		/// 
					lwidth(medthick)											///
					lcolor(navy) 										 	///
					ytitle("Standardized Percent of Votes Won by Candidate", height(5))	 		///
					xtitle("Standardized Ratio of Lynchings to Threatened Lynchings", height(5))		///
					graphregion(color(white)) 							 	///
					bgcolor(white) 										 	///
					) 					///									
					 , legend( size(small)  label(2 "Trump General") label(3 "Trump Primary") label(1 "Romney General")  )
				   graph export standardized_elections_with_controls.png, replace
		
	drop Z*						
	
capture log close
clear all








