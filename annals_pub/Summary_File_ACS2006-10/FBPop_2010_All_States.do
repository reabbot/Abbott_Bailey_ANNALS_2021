/* This file begun July 2020 by AKB. It is designed to append state-level files 
counting the 2010 foreign-born population by county using 2006 - 2010 ACS data. 
There is a separate .do file for each state, which creates a distinct .dta file. 
The current file appends to create a larger data file. */

*updated file paths 7.8.20 RA
clear all

cd Alabama
do AL_FBPop_2010.do
cd ..
cd Arkansas
do AR_FBPop_2010.do
cd ..
cd Florida
do FL_FBPop_2010.do
cd ..
cd Georgia
do GA_FBPop_2010.do
cd ..
cd Louisiana
do LA_FBPop_2010.do
cd ..
cd Mississippi
do MS_FBPop_2010.do
cd ..
cd North_Carolina
do NC_FBPop_2010.do
cd ..
cd South_Carolina
do SC_FBPop_2010.do
cd ..
cd Tennessee
do TN_FBPop_2010.do
cd ..
cd Kentucky
do KY_FBPop_2010.do
cd ..
cd Virginia
do VA_FBPop_2010.do
cd ..




use Alabama\AL_FBPop_2010.dta

append using Arkansas\AR_FBPop_2010.dta


append using Florida\FL_FBPop_2010.dta


append using Georgia\GA_FBPop_2010.dta


append using Louisiana\LA_FBPop_2010.dta


append using Mississippi\MS_FBPop_2010.dta


append using North_Carolina\NC_FBPop_2010.dta


append using South_Carolina\SC_FBPop_2010.dta


append using Tennessee\TN_FBPop_2010.dta

*Updated 10.17 to include KY
append using Kentucky\KY_FBPop_2010.dta


*updated 7.8. by RA to include VA
append using Virginia\VA_FBPop_2010.dta

gen STATE=upper(State)

drop State FILEID FILETYPE CHARITER SEQUENCE LOGRECNO OK
rename County county_fbpop
replace uniqfips= uniqfips/10
replace uniqicpsr= uniqicpsr/10

save FBPop_2010_All_States.dta, replace

clear all
