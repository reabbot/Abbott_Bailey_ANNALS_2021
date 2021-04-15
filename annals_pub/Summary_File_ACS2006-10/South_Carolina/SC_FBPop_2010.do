/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for South Carolina. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105sc0005001.txt

rename v1 FILEID
rename v2 FILETYPE
rename v3 State	
rename v4 CHARITER	
rename v5 SEQUENCE	
rename v6 LOGRECNO

/* Table B05001 */
rename v7 B05001_001	
rename v8 B05001_002	
rename v9 B05001_003	
rename v10 B05001_004	
rename v11 B05001_005	
rename v12 B05001_006


la var B05001_001 "Total Population"	
la var B05001_002 "US Born"
la var B05001_003 "Born in territories"
la var B05001_004 "Foreign Born - US Parents"
la var B05001_005 "Foreign Born - Naturalized"
la var B05001_006 "Foreign Born - Not Naturalized"

keep FILEID - B05001_006 /* This keeps only the variables we will use */

/* 
The following step creates a dichotomous variable that tags the specific observations
we want to keep -- meaning counties. These are those with a logical record number 
that matches up to [Note: identified  appropriate LOGRECNO values using the geographic 
file for this state from https://www2.census.gov/acs2010_5yr/summaryfile/UserTools/Geography/
*/

egen OK = anymatch (LOGRECNO), values (13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 ///
     28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 ///
	 54 55 56 57 58 )
	 
keep if OK

/* 2293 observations are dropped here. We retain 46 cases. */

gen County = ""
replace County = 	"Abbeville"	if LOGRECNO == 	0000013
replace County = 	"Aiken"	if LOGRECNO == 	0000014
replace County = 	"Allendale"	if LOGRECNO == 	0000015
replace County = 	"Anderson"	if LOGRECNO == 	0000016
replace County = 	"Bamberg"	if LOGRECNO == 	0000017
replace County = 	"Barnwell"	if LOGRECNO == 	0000018
replace County = 	"Beaufort"	if LOGRECNO == 	0000019
replace County = 	"Berkeley"	if LOGRECNO == 	0000020
replace County = 	"Calhoun"	if LOGRECNO == 	0000021
replace County = 	"Charleston"	if LOGRECNO == 	0000022
replace County = 	"Cherokee"	if LOGRECNO == 	0000023
replace County = 	"Chester"	if LOGRECNO == 	0000024
replace County = 	"Chesterfield"	if LOGRECNO == 	0000025
replace County = 	"Clarendon"	if LOGRECNO == 	0000026
replace County = 	"Colleton"	if LOGRECNO == 	0000027
replace County = 	"Darlington"	if LOGRECNO == 	0000028
replace County = 	"Dillon"	if LOGRECNO == 	0000029
replace County = 	"Dorchester"	if LOGRECNO == 	0000030
replace County = 	"Edgefield"	if LOGRECNO == 	0000031
replace County = 	"Fairfield"	if LOGRECNO == 	0000032
replace County = 	"Florence"	if LOGRECNO == 	0000033
replace County = 	"Georgetown"	if LOGRECNO == 	0000034
replace County = 	"Greenville"	if LOGRECNO == 	0000035
replace County = 	"Greenwood"	if LOGRECNO == 	0000036
replace County = 	"Hampton"	if LOGRECNO == 	0000037
replace County = 	"Horry"	if LOGRECNO == 	0000038
replace County = 	"Jasper"	if LOGRECNO == 	0000039
replace County = 	"Kershaw"	if LOGRECNO == 	0000040
replace County = 	"Lancaster"	if LOGRECNO == 	0000041
replace County = 	"Laurens"	if LOGRECNO == 	0000042
replace County = 	"Lee"	if LOGRECNO == 	0000043
replace County = 	"Lexington"	if LOGRECNO == 	0000044
replace County = 	"McCormick"	if LOGRECNO == 	0000045
replace County = 	"Marion"	if LOGRECNO == 	0000046
replace County = 	"Marlboro"	if LOGRECNO == 	0000047
replace County = 	"Newberry"	if LOGRECNO == 	0000048
replace County = 	"Oconee"	if LOGRECNO == 	0000049
replace County = 	"Orangeburg"	if LOGRECNO == 	0000050
replace County = 	"Pickens"	if LOGRECNO == 	0000051
replace County = 	"Richland"	if LOGRECNO == 	0000052
replace County = 	"Saluda"	if LOGRECNO == 	0000053
replace County = 	"Spartanburg"	if LOGRECNO == 	0000054
replace County = 	"Sumter"	if LOGRECNO == 	0000055
replace County = 	"Union"	if LOGRECNO == 	0000056
replace County = 	"Williamsburg"	if LOGRECNO == 	0000057
replace County = 	"York"	if LOGRECNO == 	0000058


gen cntycode = .
replace cntycode = 	10	if County == 	"Abbeville"
replace cntycode = 	30	if County == 	"Aiken"
replace cntycode = 	50	if County == 	"Allendale"
replace cntycode = 	70	if County == 	"Anderson"
replace cntycode = 	90	if County == 	"Bamberg"
replace cntycode = 	110	if County == 	"Barnwell"
replace cntycode = 	130	if County == 	"Beaufort"
replace cntycode = 	150	if County == 	"Berkeley"
replace cntycode = 	170	if County == 	"Calhoun"
replace cntycode = 	190	if County == 	"Charleston"
replace cntycode = 	210	if County == 	"Cherokee"
replace cntycode = 	230	if County == 	"Chester"
replace cntycode = 	250	if County == 	"Chesterfield"
replace cntycode = 	270	if County == 	"Clarendon"
replace cntycode = 	290	if County == 	"Colleton"
replace cntycode = 	310	if County == 	"Darlington"
replace cntycode = 	330	if County == 	"Dillon"
replace cntycode = 	350	if County == 	"Dorchester"
replace cntycode = 	370	if County == 	"Edgefield"
replace cntycode = 	390	if County == 	"Fairfield"
replace cntycode = 	410	if County == 	"Florence"
replace cntycode = 	430	if County == 	"Georgetown"
replace cntycode = 	450	if County == 	"Greenville"
replace cntycode = 	470	if County == 	"Greenwood"
replace cntycode = 	490	if County == 	"Hampton"
replace cntycode = 	510	if County == 	"Horry"
replace cntycode = 	530	if County == 	"Jasper"
replace cntycode = 	550	if County == 	"Kershaw"
replace cntycode = 	570	if County == 	"Lancaster"
replace cntycode = 	590	if County == 	"Laurens"
replace cntycode = 	610	if County == 	"Lee"
replace cntycode = 	630	if County == 	"Lexington"
replace cntycode = 	650	if County == 	"McCormick"
replace cntycode = 	670	if County == 	"Marion"
replace cntycode = 	690	if County == 	"Marlboro"
replace cntycode = 	710	if County == 	"Newberry"
replace cntycode = 	730	if County == 	"Oconee"
replace cntycode = 	750	if County == 	"Orangeburg"
replace cntycode = 	770	if County == 	"Pickens"
replace cntycode = 	790	if County == 	"Richland"
replace cntycode = 	810	if County == 	"Saluda"
replace cntycode = 	830	if County == 	"Spartanburg"
replace cntycode = 	850	if County == 	"Sumter"
replace cntycode = 	870	if County == 	"Union"
replace cntycode = 	890	if County == 	"Williamsburg"
replace cntycode = 	910	if County == 	"York"


gen statfips = 45
gen staticpsr = 48

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save SC_FBPop_2010.dta, replace

clear
