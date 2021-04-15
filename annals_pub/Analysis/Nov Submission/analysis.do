
set more off
capture log close
use analysis_collapse.dta


pwcorr Trumpgain r_T_C PctRomney Primary General PctWall lynchratio ///
Nevents nevents_blk Naverted, star(.05)

save analysisA.dta,replace



clear all
capture log close 
use analysisA.dta
log using 1A, replace
*************************************************
*MODEL 1A
**************************************************
reg PrimaryPcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all



capture log close 
use analysisA.dta
log using 2A, replace
*************************************************
*MODEL 2A
**************************************************
reg r_T_C lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all


capture log close 
use analysisA.dta
log using 3A, replace
*************************************************
*MODEL 3A
**************************************************
reg Trumpgain lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all


capture log close 
use analysisA.dta
log using 4A, replace
*************************************************
*MODEL 4A
**************************************************
reg PctWallace lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all



capture log close 
use analysisA.dta
log using 5A, replace
*************************************************
*MODEL 5A
**************************************************
reg PrimaryPcttrump lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all



capture log close 
use analysisA.dta
log using 6A, replace
*************************************************
*MODEL 6A
**************************************************
reg r_T_C lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all




capture log close 
use analysisA.dta
log using 7A, replace
*************************************************
*MODEL 7A
**************************************************
reg Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
capture log close
clear all



capture log close 
use analysisA.dta
log using 8A, replace
*************************************************
*MODEL 8A
**************************************************
reg PctWallace lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
capture log close
clear all


capture log close 
use analysisA.dta
log using 9A, replace
*************************************************
*MODEL 9A
**************************************************
reg PrimaryPcttrump pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg PrimaryPcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all


capture log close 
use analysisA.dta
log using 10A, replace
*************************************************
*MODEL 10A
**************************************************
reg r_T_C pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg r_T_C lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all


capture log close 
use analysisA.dta
log using 11A, replace
*************************************************
*MODEL 11A
**************************************************
reg Trumpgain pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg Trumpgain lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all



capture log close 
use analysisA.dta
log using 12A, replace
*************************************************
*MODEL 12A
**************************************************
reg PctWa pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg PctWa lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all


capture log close 
use analysisA.dta
log using 13A, replace
*************************************************
*MODEL 13A
**************************************************
reg PrimaryPcttrump pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg PrimaryPcttrump lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg PrimaryPcttrump lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3

reg PrimaryPcttrump pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg PrimaryPcttrump lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg Primary lynchratio pfarmown Pcturban c.Pctevangel#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3

capture log close
clear all


capture log close 
use analysisA.dta
log using 14A, replace
*************************************************
*MODEL 14A
**************************************************
reg r_T_C pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg r_T_C lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg r_T_C lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3
capture log close
clear all



capture log close 
use analysisA.dta
log using 15A, replace
*************************************************
*MODEL 15A
**************************************************
reg Trumpgain pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg Trumpgain lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3
capture log close
clear all


capture log close 
use analysisA.dta
log using 16A, replace
*************************************************
*MODEL 16A
**************************************************
reg PctWa pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg PctWa lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg PctWa lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3
capture log close
clear all

****************************************************************************************************
*MODELS FOR 00 DATASET 
*****************************************************************************************************



capture log close
use 00analysis_collapse.dta


pwcorr Trumpgain PctRomney Primary General PctWall lynchratio ///
Nevents nevents_blk Naverted, star(.05)

save analysisB.dta,replace



clear all
capture log close 
use analysisB.dta
log using 1B, replace
*************************************************
*MODEL 1B
**************************************************
reg PrimaryPcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all



capture log close 
use analysisB.dta
log using 2B, replace
*************************************************
*MODEL 2B
**************************************************
reg r_T_C lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all


capture log close 
use analysisB.dta
log using 3B, replace
*************************************************
*MODEL 3B
**************************************************
reg Trumpgain lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all


capture log close 
use analysisB.dta
log using 4B, replace
*************************************************
*MODEL 4B
**************************************************
reg PctWallace lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all



capture log close 
use analysisB.dta
log using 5B, replace
*************************************************
*MODEL 5B
**************************************************
reg PrimaryPcttrump lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all



capture log close 
use analysisB.dta
log using 6B, replace
*************************************************
*MODEL 6B
**************************************************
reg r_T_C lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn

capture log close
clear all




capture log close 
use analysisB.dta
log using 7B, replace
*************************************************
*MODEL 7B
**************************************************
reg Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
capture log close
clear all



capture log close 
use analysisB.dta
log using 8B, replace
*************************************************
*MODEL 8B
**************************************************
reg PctWallace lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
capture log close
clear all


capture log close 
use analysisB.dta
log using 9B, replace
*************************************************
*MODEL 9B
**************************************************
reg PrimaryPcttrump pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg PrimaryPcttrump lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all


capture log close 
use analysisB.dta
log using 10B, replace
*************************************************
*MODEL 10B
**************************************************
reg r_T_C pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg r_T_C lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all


capture log close 
use analysisB.dta
log using 11B, replace
*************************************************
*MODEL 11B
**************************************************
reg Trumpgain pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg Trumpgain lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all



capture log close 
use analysisB.dta
log using 12B, replace
*************************************************
*MODEL 12B
**************************************************
reg PctWa pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model1
reg PctWa lynchratio pfarmown totpop PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
estimate store model2
lrtest model1 model2
capture log close
clear all


capture log close 
use analysisB.dta
log using 13B, replace
*************************************************
*MODEL 13B
**************************************************
reg PrimaryPcttrump pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg PrimaryPcttrump lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg PrimaryPcttrump lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3

capture log close
clear all


capture log close 
use analysisB.dta
log using 14B, replace
*************************************************
*MODEL 14B
**************************************************
reg r_T_C pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg r_T_C lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg r_T_C lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3
capture log close
clear all



capture log close 
use analysisB.dta
log using 15B, replace
*************************************************
*MODEL 15B
**************************************************
reg Trumpgain pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg Trumpgain lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg Trumpgain lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3
capture log close
clear all


capture log close 
use analysisB.dta
log using 16B, replace
*************************************************
*MODEL 16B
**************************************************
reg PctWa pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model1
reg PctWa lynchratio pfarmown Pcturban PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model2
reg PctWa lynchratio pfarmown Pcturban c.Pcturban#c.lynchratio PcthhNonhispwhite PctPop65plus PctWorkingclass PctUnemploy Pcthhlessthan25k Pctevangel changepercentFRNBrn
est sto model3
lrtest model1 model2
lrtest model1 model3
lrtest model2 model3
capture log close
clear all





























