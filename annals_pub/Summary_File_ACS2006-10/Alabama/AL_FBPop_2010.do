/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Alabama. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105al0005001.txt

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
we want. These are those with a logical record number that matches up to [Note: identified 
appropriate LOGRECNO values using the geographic file for this state from 
https://www2.census.gov/acs2010_5yr/summaryfile/UserTools/Geography/
*/
egen OK = anymatch (LOGRECNO), values (13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 ///
     28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 ///
	 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79)
	 
keep if OK

/* deletes 2789 records; 67 retained */

gen County = ""			
replace County = 	"Autauga"	if LOGRECNO == 	0000013
replace County = 	"Baldwin"	if LOGRECNO == 	0000014
replace County = 	"Barbour"	if LOGRECNO == 	0000015
replace County = 	"Bibb"	if LOGRECNO == 	0000016
replace County = 	"Blount"	if LOGRECNO == 	0000017
replace County = 	"Bullock"	if LOGRECNO == 	0000018
replace County = 	"Butler"	if LOGRECNO == 	0000019
replace County = 	"Calhoun"	if LOGRECNO == 	0000020
replace County = 	"Chambers"	if LOGRECNO == 	0000021
replace County = 	"Cherokee"	if LOGRECNO == 	0000022
replace County = 	"Chilton"	if LOGRECNO == 	0000023
replace County = 	"Choctaw"	if LOGRECNO == 	0000024
replace County = 	"Clarke"	if LOGRECNO == 	0000025
replace County = 	"Clay"	if LOGRECNO == 	0000026
replace County = 	"Cleburne"	if LOGRECNO == 	0000027
replace County = 	"Coffee"	if LOGRECNO == 	0000028
replace County = 	"Colbert"	if LOGRECNO == 	0000029
replace County = 	"Conecuh"	if LOGRECNO == 	0000030
replace County = 	"Coosa"	if LOGRECNO == 	0000031
replace County = 	"Covington"	if LOGRECNO == 	0000032
replace County = 	"Crenshaw"	if LOGRECNO == 	0000033
replace County = 	"Cullman"	if LOGRECNO == 	0000034
replace County = 	"Dale"	if LOGRECNO == 	0000035
replace County = 	"Dallas"	if LOGRECNO == 	0000036
replace County = 	"DeKalb"	if LOGRECNO == 	0000037
replace County = 	"Elmore"	if LOGRECNO == 	0000038
replace County = 	"Escambia"	if LOGRECNO == 	0000039
replace County = 	"Etowah"	if LOGRECNO == 	0000040
replace County = 	"Fayette"	if LOGRECNO == 	0000041
replace County = 	"Franklin"	if LOGRECNO == 	0000042
replace County = 	"Geneva"	if LOGRECNO == 	0000043
replace County = 	"Greene"	if LOGRECNO == 	0000044
replace County = 	"Hale"	if LOGRECNO == 	0000045
replace County = 	"Henry"	if LOGRECNO == 	0000046
replace County = 	"Houston"	if LOGRECNO == 	0000047
replace County = 	"Jackson"	if LOGRECNO == 	0000048
replace County = 	"Jefferson"	if LOGRECNO == 	0000049
replace County = 	"Lamar"	if LOGRECNO == 	0000050
replace County = 	"Lauderdale"	if LOGRECNO == 	0000051
replace County = 	"Lawrence"	if LOGRECNO == 	0000052
replace County = 	"Lee"	if LOGRECNO == 	0000053
replace County = 	"Limestone"	if LOGRECNO == 	0000054
replace County = 	"Lowndes"	if LOGRECNO == 	0000055
replace County = 	"Macon"	if LOGRECNO == 	0000056
replace County = 	"Madison"	if LOGRECNO == 	0000057
replace County = 	"Marengo"	if LOGRECNO == 	0000058
replace County = 	"Marion"	if LOGRECNO == 	0000059
replace County = 	"Marshall"	if LOGRECNO == 	0000060
replace County = 	"Mobile"	if LOGRECNO == 	0000061
replace County = 	"Monroe"	if LOGRECNO == 	0000062
replace County = 	"Montgomery"	if LOGRECNO == 	0000063
replace County = 	"Morgan"	if LOGRECNO == 	0000064
replace County = 	"Perry"	if LOGRECNO == 	0000065
replace County = 	"Pickens"	if LOGRECNO == 	0000066
replace County = 	"Pike"	if LOGRECNO == 	0000067
replace County = 	"Randolph"	if LOGRECNO == 	0000068
replace County = 	"Russell"	if LOGRECNO == 	0000069
replace County = 	"St. Clair"	if LOGRECNO == 	0000070
replace County = 	"Shelby"	if LOGRECNO == 	0000071
replace County = 	"Sumter"	if LOGRECNO == 	0000072
replace County = 	"Talladega"	if LOGRECNO == 	0000073
replace County = 	"Tallapoosa"	if LOGRECNO == 	0000074
replace County = 	"Tuscaloosa"	if LOGRECNO == 	0000075
replace County = 	"Walker"	if LOGRECNO == 	0000076
replace County = 	"Washington"	if LOGRECNO == 	0000077
replace County = 	"Wilcox"	if LOGRECNO == 	0000078
replace County = 	"Winston"	if LOGRECNO == 	0000079

gen statfips = 01
gen staticpsr = 41

gen cntycode = .			
replace cntycode = 	10	if County == 	"Autauga"
replace cntycode = 	30	if County == 	"Baldwin"
replace cntycode = 	50	if County == 	"Barbour"
replace cntycode = 	70	if County == 	"Bibb"
replace cntycode = 	90	if County == 	"Blount"
replace cntycode = 	110	if County == 	"Bullock"
replace cntycode = 	130	if County == 	"Butler"
replace cntycode = 	150	if County == 	"Calhoun"
replace cntycode = 	170	if County == 	"Chambers"
replace cntycode = 	190	if County == 	"Cherokee"
replace cntycode = 	210	if County == 	"Chilton"
replace cntycode = 	230	if County == 	"Choctaw"
replace cntycode = 	250	if County == 	"Clarke"
replace cntycode = 	270	if County == 	"Clay"
replace cntycode = 	290	if County == 	"Cleburne"
replace cntycode = 	310	if County == 	"Coffee"
replace cntycode = 	330	if County == 	"Colbert"
replace cntycode = 	350	if County == 	"Conecuh"
replace cntycode = 	370	if County == 	"Coosa"
replace cntycode = 	390	if County == 	"Covington"
replace cntycode = 	410	if County == 	"Crenshaw"
replace cntycode = 	430	if County == 	"Cullman"
replace cntycode = 	450	if County == 	"Dale"
replace cntycode = 	470	if County == 	"Dallas"
replace cntycode = 	490	if County == 	"DeKalb"
replace cntycode = 	510	if County == 	"Elmore"
replace cntycode = 	530	if County == 	"Escambia"
replace cntycode = 	550	if County == 	"Etowah"
replace cntycode = 	570	if County == 	"Fayette"
replace cntycode = 	590	if County == 	"Franklin"
replace cntycode = 	610	if County == 	"Geneva"
replace cntycode = 	630	if County == 	"Greene"
replace cntycode = 	650	if County == 	"Hale"
replace cntycode = 	670	if County == 	"Henry"
replace cntycode = 	690	if County == 	"Houston"
replace cntycode = 	710	if County == 	"Jackson"
replace cntycode = 	730	if County == 	"Jefferson"
replace cntycode = 	750	if County == 	"Lamar"
replace cntycode = 	770	if County == 	"Lauderdale"
replace cntycode = 	790	if County == 	"Lawrence"
replace cntycode = 	810	if County == 	"Lee"
replace cntycode = 	830	if County == 	"Limestone"
replace cntycode = 	850	if County == 	"Lowndes"
replace cntycode = 	870	if County == 	"Macon"
replace cntycode = 	890	if County == 	"Madison"
replace cntycode = 	910	if County == 	"Marengo"
replace cntycode = 	930	if County == 	"Marion"
replace cntycode = 	950	if County == 	"Marshall"
replace cntycode = 	970	if County == 	"Mobile"
replace cntycode = 	990	if County == 	"Monroe"
replace cntycode = 	1010	if County == 	"Montgomery"
replace cntycode = 	1030	if County == 	"Morgan"
replace cntycode = 	1050	if County == 	"Perry"
replace cntycode = 	1070	if County == 	"Pickens"
replace cntycode = 	1090	if County == 	"Pike"
replace cntycode = 	1110	if County == 	"Randolph"
replace cntycode = 	1130	if County == 	"Russell"
replace cntycode = 	1150	if County == 	"St. Clair"
replace cntycode = 	1170	if County == 	"Shelby"
replace cntycode = 	1190	if County == 	"Sumter"
replace cntycode = 	1210	if County == 	"Talladega"
replace cntycode = 	1230	if County == 	"Tallapoosa"
replace cntycode = 	1250	if County == 	"Tuscaloosa"
replace cntycode = 	1270	if County == 	"Walker"
replace cntycode = 	1290	if County == 	"Washington"
replace cntycode = 	1310	if County == 	"Wilcox"
replace cntycode = 	1330	if County == 	"Winston"

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save AL_FBPop_2010.dta, replace

clear



