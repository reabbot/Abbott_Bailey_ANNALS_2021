/* This file begun October 2020 by AKB. It reads in Noth Carolina data from the 
2012 general election for President (Obama vs. Romney). */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\NCarolina_Results

import excel using NC_2012_Precinct_Candidate.xlsx

keep if F == "PRESIDENT AND VICE PRESIDENT OF THE UNITED STATES"

drop B C D E F H I J K L M O

rename A County
rename G Candidate
rename N NVotes

save NC_2012_Precinct_Candidate.dta, replace

