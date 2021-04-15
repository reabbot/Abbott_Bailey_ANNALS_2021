/* This file was created October 2020 by AKB, to create a single Stata data file 
with county-level votes for each candidate in the 2012 Presidential election. It 
is based on the .do file ALVotes, which read in results from the 2016 Alabama 
Republican primaries. This .do file reads in a separate Excel spreadsheet for 
each county (the 2016 primaries had all counties in a single spreadsheet) and
creates a single Stata data file for merging with the county-level results from
other states. This involves assigning ICPSR codes for the state, overall, and
for each county, as well as a unique geographic identifier.
*/

clear


use 2012General-PrecinctLevel_AL\AL_2012.dta


append using Arkansas_Results\AR_2012.dta


append using Florida_Results\FL_2012.dta


append using Georgia_Results\GA_2012.dta


append using Kentucky_Results\KY_2012.dta


append using Louisiana_Results\LA_2012.dta


append using Mississippi_Results\MS_2012.dta


append using NCarolina_Results\NC_2012.dta


append using SCarolina_Results\SC_2012.dta


append using Tennessee_Results\TN_2012.dta


append using Virginia_Results\VA_2012.dta


replace uniqfips=uniqfips/10
replace uniqicpsr=uniqicpsr/10
rename County County_2012

keep NVote_Obama NVote_Romney NVote_Total County_2012 cnticpsr State sticpsr  ///
stfips uniqicpsr uniqfips

rename NVote_Total NVote_Total2012


save Vote2012.dta, replace

clear
