/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in Florida. There is a separate .txt file for each county, 
with results reported separated by polling station within the county. There is 
a separate record for each candidate in each polling station. so...I read in 
each county's file, and save an ongoing working file that appends each county's
record. Then, I create two cumulated files -- one with the total number of
votes for Trump in each ocunty, and one for the total number of votes cast in
each county. I merge these together and then create the other variables.
Ultimately, this process creates a small data file with counties (nonclustered) 
as cases and the following variables:
1) String variable with county name
2) String variable with "Florida" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cnticpsr)
4) Unique identifier (geocode)
5) N votes for Donald Trump in each county
6) N total votes cast in each county's Republican primary

*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections\Florida

import delimited using "ALA_PctResults20160315.txt" /* reading in raw data for each county. */

save FL_Working, replace /* This is the "scratch" file I keep adding to. */

clear


import delimited using "BAK_PctResults20160315.txt"

append using FL_Working, force /* and then iteratively adding data for the other counties */

save FL_Working, replace /* and re-saving the scratch file (now it has data for 2 counties...) */

clear


import delimited using "BAY_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "BRA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "BRE_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "BRO_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "CAL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "CHA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "CIT_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "CLA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "CLL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "CLM_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "DAD_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "DES_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "DIX_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "DUV_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "ESC_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "FLA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "FRA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "GAD_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "GIL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "GLA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "GUL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "HAM_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "HAR_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "HEN_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "HER_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "HIG_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "HIL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "HOL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "IND_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "JAC_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "JEF_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "LAF_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "LAK_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "LEE_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "LEO_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "LEV_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "LIB_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "MAD_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "MAN_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "MON_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "MRN_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "MRT_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "NAS_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "OKA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "OKE_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "ORA_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "OSC_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "PAL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "PAS_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "PIN_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "POL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "PUT_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "SAN_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "SAR_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "SEM_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "STJ_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "STL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "SUM_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "SUW_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "TAY_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "UNI_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "VOL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "WAK_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "WAL_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

clear


import delimited using "WAS_PctResults20160315.txt"

append using FL_Working, force

save FL_Working, replace

keep v2 v6 v15 v19 /* dropping everything except variables of interest. */
/* note: v13 has blank values */

rename v2 County /* renaming variables to be consistent w/ other states */
rename v6 Precinct
rename v15 Candidate
rename v19 NVotes

/* Note: In Florida, an overvote is recorded if more than one candidate is
marked. An undervote is recorded if no candidate is indicated for the office. 
Source: Florida Division of Elections 2019 */

/* dropping Democratic candidates -- including with type-os -- and garbage 
data points */
drop if Candidate == "Bernie Sanders" | Candidate == "Hillary Clinton" | ///
     Candidate == "Martin O'Malley" | Candidate == "OverVotes" | ///
	 Candidate == "UnderVotes" | Candidate == "Number of Precincts Reporting " | ///
	 Candidate == "YES " | Candidate == "Times Over Voted " | Candidate == "NO " | ///
	 Candidate == "Times Blank Voted " | Candidate == "Registered Voters " | ///
	 Candidate == "Over Votes" | Candidate == "Times Counted " | ///
	 Candidate == "Number of Under Votes " | Candidate == "Hillary Clinton " | ///
	 Candidate == "Number of Precincts for Race " | Candidate == "Bernie Sanders " | ///
	 Candidate == "WriteinVotes" | Candidate == "Under Votes" 
	 
/* fixing type-o in administrative data */
replace Candidate = "Donald J. Trump" if Candidate == "Donald J. Trump "

save, replace

/* creating first mini data set that counts up the N of votes cast for Trump
in each county. */

collapse (sum) NTrump=NVotes if Candidate == "Donald J. Trump", by(County)

/* resulting data file has two variables: NTrump and County */

save FL_Trump, replace /* note that I save it with a new file name */

clear

use FL_Working /* I go back and re-open the scratch data file */

/* now I create a mini data file that counts up total votes cast for Republicans
in each County during the primary */

collapse (sum) TotVotes=NVotes, by(County)

/* resulting data file has two variables: TotVotes and County */

save FL_Votes, replace /* DO NOT CLEAR! KEEP THIS IN WORKING MEMORY!!! */

merge 1:1 County using FL_Trump 

/* So now data file has 4 variables: County NTrump TotVotes & _merge */

drop _merge

rename TotVotes NVotes

destring NTrump NVotes, replace
la var NTrump "N Votes for Trump"
la var NVotes "Total votes cast"

gen State = "Florida"
gen sticpsr = 43
gen stfips = 12

gen cnticpsr = .
replace cnticpsr = 	10	 if County == 	"Alachua"
replace cnticpsr = 	30	 if County == 	"Baker"
replace cnticpsr = 	50	 if County == 	"Bay"
replace cnticpsr = 	70	 if County == 	"Bradford"
replace cnticpsr = 	90	 if County == 	"Brevard"
replace cnticpsr = 	110	 if County == 	"Broward"
replace cnticpsr = 	130	 if County == 	"Calhoun"
replace cnticpsr = 	150	 if County == 	"Charlotte"
replace cnticpsr = 	170	 if County == 	"Citrus"
replace cnticpsr = 	190	 if County == 	"Clay"
replace cnticpsr = 	210	 if County == 	"Collier"
replace cnticpsr = 	230	 if County == 	"Columbia"
replace cnticpsr = 	250	 if County == 	"Miami-Dade"
replace cnticpsr = 	270	 if County == 	"Desoto"
replace cnticpsr = 	290	 if County == 	"Dixie"
replace cnticpsr = 	310	 if County == 	"Duval"
replace cnticpsr = 	330	 if County == 	"Escambia"
replace cnticpsr = 	350	 if County == 	"Flagler"
replace cnticpsr = 	370	 if County == 	"Franklin"
replace cnticpsr = 	390	 if County == 	"Gadsden"
replace cnticpsr = 	410	 if County == 	"Gilchrist"
replace cnticpsr = 	430	 if County == 	"Glades"
replace cnticpsr = 	450	 if County == 	"Gulf"
replace cnticpsr = 	470	 if County == 	"Hamilton"
replace cnticpsr = 	490	 if County == 	"Hardee"
replace cnticpsr = 	510	 if County == 	"Hendry"
replace cnticpsr = 	530	 if County == 	"Hernando"
replace cnticpsr = 	550	 if County == 	"Highlands"
replace cnticpsr = 	570	 if County == 	"Hillsborough"
replace cnticpsr = 	590	 if County == 	"Holmes"
replace cnticpsr = 	610	 if County == 	"Indian River"
replace cnticpsr = 	630	 if County == 	"Jackson"
replace cnticpsr = 	650	 if County == 	"Jefferson"
replace cnticpsr = 	670	 if County == 	"Lafayette"
replace cnticpsr = 	690	 if County == 	"Lake"
replace cnticpsr = 	710	 if County == 	"Lee"
replace cnticpsr = 	730	 if County == 	"Leon"
replace cnticpsr = 	750	 if County == 	"Levy"
replace cnticpsr = 	770	 if County == 	"Liberty"
replace cnticpsr = 	790	 if County == 	"Madison"
replace cnticpsr = 	810	 if County == 	"Manatee"
replace cnticpsr = 	830	 if County == 	"Marion"
replace cnticpsr = 	850	 if County == 	"Martin"
replace cnticpsr = 	870	 if County == 	"Monroe"
replace cnticpsr = 	890	 if County == 	"Nassau"
replace cnticpsr = 	910	 if County == 	"Okaloosa"
replace cnticpsr = 	930	 if County == 	"Okeechobee"
replace cnticpsr = 	950	 if County == 	"Orange"
replace cnticpsr = 	970	 if County == 	"Osceola"
replace cnticpsr = 	990	 if County == 	"Palm Beach"
replace cnticpsr = 	1010	 if County == 	"Pasco"
replace cnticpsr = 	1030	 if County == 	"Pinellas"
replace cnticpsr = 	1050	 if County == 	"Polk"
replace cnticpsr = 	1070	 if County == 	"Putnam"
replace cnticpsr = 	1090	 if County == 	"St. Johns"
replace cnticpsr = 	1110	 if County == 	"St. Lucie"
replace cnticpsr = 	1130	 if County == 	"Santa Rosa"
replace cnticpsr = 	1150	 if County == 	"Sarasota"
replace cnticpsr = 	1170	 if County == 	"Seminole"
replace cnticpsr = 	1190	 if County == 	"Sumter"
replace cnticpsr = 	1210	 if County == 	"Suwannee"
replace cnticpsr = 	1230	 if County == 	"Taylor"
replace cnticpsr = 	1250	 if County == 	"Union"
replace cnticpsr = 	1270	 if County == 	"Volusia"
replace cnticpsr = 	1290	 if County == 	"Wakulla"
replace cnticpsr = 	1310	 if County == 	"Walton"
replace cnticpsr = 	1330	 if County == 	"Washington"

gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr


cd H:\Lynching\Trump_Lynch\Primary_Elections /* remember? We were in a sub-folder. */

save FL_2016_Primary, replace

clear

