/* This file begun October 2020 by AKB. It reads in Tennessee data from the 2012 
general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Tennessee_Results

import excel using November2012.xlsx

/* Restricting to only observations that record votes in the Presidential race. */
keep if H == "United States President" /* 2104 observations remaining */
keep A M P S V Y AB AE /* Only columns with counts for votes by candidate */

rename A County
rename P Obama
rename M Romney
rename AB Johnson
rename S Goode
rename V Stein
rename Y Anderson
rename AE Miller

save TN_2012_Precinct_Candidate.dta, replace

clear



