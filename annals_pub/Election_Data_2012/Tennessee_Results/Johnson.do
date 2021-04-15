/* This file begun October 2020 by AKB. It reads in Tennessee data from the 2012 
general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Tennessee_Results

use TN_2012_Precinct_Candidate.dta

keep County Johnson

destring Johnson, replace

collapse (sum) NVote_Johnson=Johnson, by (County)

save Johnson.dta, replace

clear
