/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Florida. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105fl0005001.txt

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
	 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 )
	 
keep if OK

/* 6400 observations deleted. 67 observations remaining. */

gen County = ""			
replace County = 	"Alachua"	if LOGRECNO == 	0000013
replace County = 	"Baker"	if LOGRECNO == 	0000014
replace County = 	"Bay"	if LOGRECNO == 	0000015
replace County = 	"Bradford"	if LOGRECNO == 	0000016
replace County = 	"Brevard"	if LOGRECNO == 	0000017
replace County = 	"Broward"	if LOGRECNO == 	0000018
replace County = 	"Calhoun"	if LOGRECNO == 	0000019
replace County = 	"Charlotte"	if LOGRECNO == 	0000020
replace County = 	"Citrus"	if LOGRECNO == 	0000021
replace County = 	"Clay"	if LOGRECNO == 	0000022
replace County = 	"Collier"	if LOGRECNO == 	0000023
replace County = 	"Columbia"	if LOGRECNO == 	0000024
replace County = 	"DeSoto"	if LOGRECNO == 	0000025
replace County = 	"Dixie"	if LOGRECNO == 	0000026
replace County = 	"Duval"	if LOGRECNO == 	0000027
replace County = 	"Escambia"	if LOGRECNO == 	0000028
replace County = 	"Flagler"	if LOGRECNO == 	0000029
replace County = 	"Franklin"	if LOGRECNO == 	0000030
replace County = 	"Gadsden"	if LOGRECNO == 	0000031
replace County = 	"Gilchrist"	if LOGRECNO == 	0000032
replace County = 	"Glades"	if LOGRECNO == 	0000033
replace County = 	"Gulf"	if LOGRECNO == 	0000034
replace County = 	"Hamilton"	if LOGRECNO == 	0000035
replace County = 	"Hardee"	if LOGRECNO == 	0000036
replace County = 	"Hendry"	if LOGRECNO == 	0000037
replace County = 	"Hernando"	if LOGRECNO == 	0000038
replace County = 	"Highlands"	if LOGRECNO == 	0000039
replace County = 	"Hillsborough"	if LOGRECNO == 	0000040
replace County = 	"Holmes"	if LOGRECNO == 	0000041
replace County = 	"Indian River"	if LOGRECNO == 	0000042
replace County = 	"Jackson"	if LOGRECNO == 	0000043
replace County = 	"Jefferson"	if LOGRECNO == 	0000044
replace County = 	"Lafayette"	if LOGRECNO == 	0000045
replace County = 	"Lake"	if LOGRECNO == 	0000046
replace County = 	"Lee"	if LOGRECNO == 	0000047
replace County = 	"Leon"	if LOGRECNO == 	0000048
replace County = 	"Levy"	if LOGRECNO == 	0000049
replace County = 	"Liberty"	if LOGRECNO == 	0000050
replace County = 	"Madison"	if LOGRECNO == 	0000051
replace County = 	"Manatee"	if LOGRECNO == 	0000052
replace County = 	"Marion"	if LOGRECNO == 	0000053
replace County = 	"Martin"	if LOGRECNO == 	0000054
replace County = 	"Miami-Dade"	if LOGRECNO == 	0000055
replace County = 	"Monroe"	if LOGRECNO == 	0000056
replace County = 	"Nassau"	if LOGRECNO == 	0000057
replace County = 	"Okaloosa"	if LOGRECNO == 	0000058
replace County = 	"Okeechobee"	if LOGRECNO == 	0000059
replace County = 	"Orange"	if LOGRECNO == 	0000060
replace County = 	"Osceola"	if LOGRECNO == 	0000061
replace County = 	"Palm Beach"	if LOGRECNO == 	0000062
replace County = 	"Pasco"	if LOGRECNO == 	0000063
replace County = 	"Pinellas"	if LOGRECNO == 	0000064
replace County = 	"Polk"	if LOGRECNO == 	0000065
replace County = 	"Putnam"	if LOGRECNO == 	0000066
replace County = 	"St. Johns"	if LOGRECNO == 	0000067
replace County = 	"St. Lucie"	if LOGRECNO == 	0000068
replace County = 	"Santa Rosa"	if LOGRECNO == 	0000069
replace County = 	"Sarasota"	if LOGRECNO == 	0000070
replace County = 	"Seminole"	if LOGRECNO == 	0000071
replace County = 	"Sumter"	if LOGRECNO == 	0000072
replace County = 	"Suwannee"	if LOGRECNO == 	0000073
replace County = 	"Taylor"	if LOGRECNO == 	0000074
replace County = 	"Union"	if LOGRECNO == 	0000075
replace County = 	"Volusia"	if LOGRECNO == 	0000076
replace County = 	"Wakulla"	if LOGRECNO == 	0000077
replace County = 	"Walton"	if LOGRECNO == 	0000078
replace County = 	"Washington"	if LOGRECNO == 	0000079

gen cntycode = .			

replace cntycode = 	10	 if County ==	"Alachua"
replace cntycode = 	30	 if County ==	"Baker"
replace cntycode = 	50	 if County ==	"Bay"
replace cntycode = 	70	 if County ==	"Bradford"
replace cntycode = 	90	 if County ==	"Brevard"
replace cntycode = 	110	 if County ==	"Broward"
replace cntycode = 	130	 if County ==	"Calhoun"
replace cntycode = 	150	 if County ==	"Charlotte"
replace cntycode = 	170	 if County ==	"Citrus"
replace cntycode = 	190	 if County ==	"Clay"
replace cntycode = 	210	 if County ==	"Collier"
replace cntycode = 	230	 if County ==	"Columbia"
replace cntycode = 	270	 if County ==	"DeSoto"
replace cntycode = 	290	 if County ==	"Dixie"
replace cntycode = 	310	 if County ==	"Duval"
replace cntycode = 	330	 if County ==	"Escambia"
replace cntycode = 	350  if County ==	"Flagler"
replace cntycode = 	370	 if County ==	"Franklin"
replace cntycode = 	390	 if County ==	"Gadsden"
replace cntycode = 	410	 if County ==	"Gilchrist"
replace cntycode = 	430	 if County ==	"Glades"
replace cntycode = 	450	 if County ==	"Gulf"
replace cntycode = 	470	 if County ==	"Hamilton"
replace cntycode = 	490	 if County ==	"Hardee"
replace cntycode = 	510	 if County ==	"Hendry"
replace cntycode = 	530	 if County ==	"Hernando"
replace cntycode = 	550	 if County ==	"Highlands"
replace cntycode = 	570	 if County ==	"Hillsborough"
replace cntycode = 	590	 if County ==	"Holmes"
replace cntycode = 	610	 if County ==	"Indian River"
replace cntycode = 	630	 if County ==	"Jackson"
replace cntycode = 	650	 if County ==	"Jefferson"
replace cntycode = 	670	 if County ==	"Lafayette"
replace cntycode = 	690	 if County ==	"Lake"
replace cntycode = 	710	 if County ==	"Lee"
replace cntycode = 	730	 if County ==	"Leon"
replace cntycode = 	750	 if County ==	"Levy"
replace cntycode = 	770	 if County ==	"Liberty"
replace cntycode = 	790	 if County ==	"Madison"
replace cntycode = 	810	 if County ==	"Manatee"
replace cntycode = 	830	 if County ==	"Marion"
replace cntycode = 	850	 if County ==	"Martin"
replace cntycode = 	860	 if County ==	"Miami-Dade"
replace cntycode = 	870	 if County ==	"Monroe"
replace cntycode = 	890	 if County ==	"Nassau"
replace cntycode = 	910	 if County ==	"Okaloosa"
replace cntycode = 	930	 if County ==	"Okeechobee"
replace cntycode = 	950	 if County ==	"Orange"
replace cntycode = 	970	 if County ==	"Osceola"
replace cntycode = 	990	 if County ==	"Palm Beach"
replace cntycode = 	1010	 if County =="Pasco"
replace cntycode = 	1030	 if County =="Pinellas"
replace cntycode = 	1050	 if County =="Polk"
replace cntycode = 	1070	 if County =="Putnam"
replace cntycode = 	1090	 if County =="St. Johns"
replace cntycode = 	1110	 if County =="St. Lucie"
replace cntycode = 	1130	 if County ==	"Santa Rosa"
replace cntycode = 	1150	 if County ==	"Sarasota"
replace cntycode = 	1170	 if County ==	"Seminole"
replace cntycode = 	1190	 if County ==	"Sumter"
replace cntycode = 	1210	 if County ==	"Suwannee"
replace cntycode = 	1230	 if County ==	"Taylor"
replace cntycode = 	1250	 if County ==	"Union"
replace cntycode = 	1270	 if County ==	"Volusia"
replace cntycode = 	1290	 if County ==	"Wakulla"
replace cntycode = 	1310	 if County ==	"Walton"
replace cntycode = 	1330	 if County ==	"Washington"



gen statfips = 12
gen staticpsr = 43

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save FL_FBPop_2010.dta, replace

clear
