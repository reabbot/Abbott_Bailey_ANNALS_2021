/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Arkansas. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105ar0005001.txt

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
	 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 ///
	 80 81 82 83 84 85 86 87)
	 
keep if OK
/* We lose 2391 observations here. 75 remain. */

gen County = ""			
replace County = 	"Arkansas"	if LOGRECNO == 	0000013
replace County = 	"Ashley"	if LOGRECNO == 	0000014
replace County = 	"Baxter"	if LOGRECNO == 	0000015
replace County = 	"Benton"	if LOGRECNO == 	0000016
replace County = 	"Boone"	if LOGRECNO == 	0000017
replace County = 	"Bradley"	if LOGRECNO == 	0000018
replace County = 	"Calhoun"	if LOGRECNO == 	0000019
replace County = 	"Carroll"	if LOGRECNO == 	0000020
replace County = 	"Chicot"	if LOGRECNO == 	0000021
replace County = 	"Clark"	if LOGRECNO == 	0000022
replace County = 	"Clay"	if LOGRECNO == 	0000023
replace County = 	"Cleburne"	if LOGRECNO == 	0000024
replace County = 	"Cleveland"	if LOGRECNO == 	0000025
replace County = 	"Columbia"	if LOGRECNO == 	0000026
replace County = 	"Conway"	if LOGRECNO == 	0000027
replace County = 	"Craighead"	if LOGRECNO == 	0000028
replace County = 	"Crawford"	if LOGRECNO == 	0000029
replace County = 	"Crittenden"	if LOGRECNO == 	0000030
replace County = 	"Cross"	if LOGRECNO == 	0000031
replace County = 	"Dallas"	if LOGRECNO == 	0000032
replace County = 	"Desha"	if LOGRECNO == 	0000033
replace County = 	"Drew"	if LOGRECNO == 	0000034
replace County = 	"Faulkner"	if LOGRECNO == 	0000035
replace County = 	"Franklin"	if LOGRECNO == 	0000036
replace County = 	"Fulton"	if LOGRECNO == 	0000037
replace County = 	"Garland"	if LOGRECNO == 	0000038
replace County = 	"Grant"	if LOGRECNO == 	0000039
replace County = 	"Greene"	if LOGRECNO == 	0000040
replace County = 	"Hempstead"	if LOGRECNO == 	0000041
replace County = 	"Hot Spring"	if LOGRECNO == 	0000042
replace County = 	"Howard"	if LOGRECNO == 	0000043
replace County = 	"Independence"	if LOGRECNO == 	0000044
replace County = 	"Izard"	if LOGRECNO == 	0000045
replace County = 	"Jackson"	if LOGRECNO == 	0000046
replace County = 	"Jefferson"	if LOGRECNO == 	0000047
replace County = 	"Johnson"	if LOGRECNO == 	0000048
replace County = 	"Lafayette"	if LOGRECNO == 	0000049
replace County = 	"Lawrence"	if LOGRECNO == 	0000050
replace County = 	"Lee"	if LOGRECNO == 	0000051
replace County = 	"Lincoln"	if LOGRECNO == 	0000052
replace County = 	"Little River"	if LOGRECNO == 	0000053
replace County = 	"Logan"	if LOGRECNO == 	0000054
replace County = 	"Lonoke"	if LOGRECNO == 	0000055
replace County = 	"Madison"	if LOGRECNO == 	0000056
replace County = 	"Marion"	if LOGRECNO == 	0000057
replace County = 	"Miller"	if LOGRECNO == 	0000058
replace County = 	"Mississippi"	if LOGRECNO == 	0000059
replace County = 	"Monroe"	if LOGRECNO == 	0000060
replace County = 	"Montgomery"	if LOGRECNO == 	0000061
replace County = 	"Nevada"	if LOGRECNO == 	0000062
replace County = 	"Newton"	if LOGRECNO == 	0000063
replace County = 	"Ouachita"	if LOGRECNO == 	0000064
replace County = 	"Perry"	if LOGRECNO == 	0000065
replace County = 	"Phillips"	if LOGRECNO == 	0000066
replace County = 	"Pike"	if LOGRECNO == 	0000067
replace County = 	"Poinsett"	if LOGRECNO == 	0000068
replace County = 	"Polk"	if LOGRECNO == 	0000069
replace County = 	"Pope"	if LOGRECNO == 	0000070
replace County = 	"Prairie"	if LOGRECNO == 	0000071
replace County = 	"Pulaski"	if LOGRECNO == 	0000072
replace County = 	"Randolph"	if LOGRECNO == 	0000073
replace County = 	"St. Francis"	if LOGRECNO == 	0000074
replace County = 	"Saline"	if LOGRECNO == 	0000075
replace County = 	"Scott"	if LOGRECNO == 	0000076
replace County = 	"Searcy"	if LOGRECNO == 	0000077
replace County = 	"Sebastian"	if LOGRECNO == 	0000078
replace County = 	"Sevier"	if LOGRECNO == 	0000079
replace County = 	"Sharp"	if LOGRECNO == 	0000080
replace County = 	"Stone"	if LOGRECNO == 	0000081
replace County = 	"Union"	if LOGRECNO == 	0000082
replace County = 	"Van Buren"	if LOGRECNO == 	0000083
replace County = 	"Washington"	if LOGRECNO == 	0000084
replace County = 	"White"	if LOGRECNO == 	0000085
replace County = 	"Woodruff"	if LOGRECNO == 	0000086
replace County = 	"Yell"	if LOGRECNO == 	0000087

gen cntycode = .			
replace cntycode = 	10	if County == 	"Arkansas"
replace cntycode = 	30	if County == 	"Ashley"
replace cntycode = 	50	if County == 	"Baxter"
replace cntycode = 	70	if County == 	"Benton"
replace cntycode = 	90	if County == 	"Boone"
replace cntycode = 	110	if County == 	"Bradley"
replace cntycode = 	130	if County == 	"Calhoun"
replace cntycode = 	150	if County == 	"Carroll"
replace cntycode = 	170	if County == 	"Chicot"
replace cntycode = 	190	if County == 	"Clark"
replace cntycode = 	210	if County == 	"Clay"
replace cntycode = 	230	if County == 	"Cleburne"
replace cntycode = 	250	if County == 	"Cleveland"
replace cntycode = 	270	if County == 	"Columbia"
replace cntycode = 	290	if County == 	"Conway"
replace cntycode = 	310	if County == 	"Craighead"
replace cntycode = 	330	if County == 	"Crawford"
replace cntycode = 	350	if County == 	"Crittenden"
replace cntycode = 	370	if County == 	"Cross"
replace cntycode = 	390	if County == 	"Dallas"
replace cntycode = 	410	if County == 	"Desha"
replace cntycode = 	430	if County == 	"Drew"
replace cntycode = 	450	if County == 	"Faulkner"
replace cntycode = 	470	if County == 	"Franklin"
replace cntycode = 	490	if County == 	"Fulton"
replace cntycode = 	510	if County == 	"Garland"
replace cntycode = 	530	if County == 	"Grant"
replace cntycode = 	550	if County == 	"Greene"
replace cntycode = 	570	if County == 	"Hempstead"
replace cntycode = 	590	if County == 	"Hot Spring"
replace cntycode = 	610	if County == 	"Howard"
replace cntycode = 	630	if County == 	"Independence"
replace cntycode = 	650	if County == 	"Izard"
replace cntycode = 	670	if County == 	"Jackson"
replace cntycode = 	690	if County == 	"Jefferson"
replace cntycode = 	710	if County == 	"Johnson"
replace cntycode = 	730	if County == 	"Lafayette"
replace cntycode = 	750	if County == 	"Lawrence"
replace cntycode = 	770	if County == 	"Lee"
replace cntycode = 	790	if County == 	"Lincoln"
replace cntycode = 	810	if County == 	"Little River"
replace cntycode = 	830	if County == 	"Logan"
replace cntycode = 	850	if County == 	"Lonoke"
replace cntycode = 	870	if County == 	"Madison"
replace cntycode = 	890	if County == 	"Marion"
replace cntycode = 	910	if County == 	"Miller"
replace cntycode = 	930	if County == 	"Mississippi"
replace cntycode = 	950	if County == 	"Monroe"
replace cntycode = 	970	if County == 	"Montgomery"
replace cntycode = 	990	if County == 	"Nevada"
replace cntycode = 	1010	if County == 	"Newton"
replace cntycode = 	1030	if County == 	"Ouachita"
replace cntycode = 	1050	if County == 	"Perry"
replace cntycode = 	1070	if County == 	"Phillips"
replace cntycode = 	1090	if County == 	"Pike"
replace cntycode = 	1110	if County == 	"Poinsett"
replace cntycode = 	1130	if County == 	"Polk"
replace cntycode = 	1150	if County == 	"Pope"
replace cntycode = 	1170	if County == 	"Prairie"
replace cntycode = 	1190	if County == 	"Pulaski"
replace cntycode = 	1210	if County == 	"Randolph"
replace cntycode = 	1230	if County == 	"St. Francis"
replace cntycode = 	1250	if County == 	"Saline"
replace cntycode = 	1270	if County == 	"Scott"
replace cntycode = 	1290	if County == 	"Searcy"
replace cntycode = 	1310	if County == 	"Sebastian"
replace cntycode = 	1330	if County == 	"Sevier"
replace cntycode = 	1350	if County == 	"Sharp"
replace cntycode = 	1370	if County == 	"Stone"
replace cntycode = 	1390	if County == 	"Union"
replace cntycode = 	1410	if County == 	"Van Buren"
replace cntycode = 	1430	if County == 	"Washington"
replace cntycode = 	1450	if County == 	"White"
replace cntycode = 	1470	if County == 	"Woodruff"
replace cntycode = 	1490	if County == 	"Yell"

gen statfips = 5
gen staticpsr = 42

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save AR_FBPop_2010.dta, replace

clear

