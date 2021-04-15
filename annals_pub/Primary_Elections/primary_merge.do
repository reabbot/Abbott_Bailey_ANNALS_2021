/*R.A. 6-19-2020, this do file merges primary voting data */

clear all


use "AL_2016_Primary.dta"
drop state
drop stcode
append using "AR_2016_Primary.dta"
append using "FL_2016_Primary.dta"
append using "GA_2016_Primary.dta"
append using "LA_2016_Primary.dta"
append using "MS_2016_Primary.dta"
*Ponotoc MS does not have id codes necessary for merging 
drop if County =="Ponotoc"
append using "NC_2016_Primary.dta"
append using "SC_2016_Primary.dta"
append using "TN_2016_Primary.dta"
append using "VA_2016_Primary.dta"

rename *, lower
rename county county_primaries
replace uniqfips= uniqfips/10
replace uniqicpsr= uniqicpsr/10
save primary_merged.dta, replace
clear
