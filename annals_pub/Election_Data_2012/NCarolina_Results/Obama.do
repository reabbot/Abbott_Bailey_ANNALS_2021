/* This file begun October 2020 by AKB. It reads in Noth Carolina data from the 
2012 general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\NCarolina_Results
use NC_2012_Precinct_Candidate.dta

keep if Candidate == "Obama/Biden"
* N = 3,054 observations

destring NVotes, replace

collapse (sum) NVote_Obama=NVotes, by (County)

save Obama.dta, replace

clear
