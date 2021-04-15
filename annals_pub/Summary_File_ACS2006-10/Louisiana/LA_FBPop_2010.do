/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Louisiana. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105la0005001.txt

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
	 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 )
	 
keep if OK

/* 2778 observations deleted; we retain 64.*/

gen County = ""
replace County = 	"Acadia"	if LOGRECNO == 	0000013
replace County = 	"Allen"	if LOGRECNO == 	0000014
replace County = 	"Ascension"	if LOGRECNO == 	0000015
replace County = 	"Assumption"	if LOGRECNO == 	0000016
replace County = 	"Avoyelles"	if LOGRECNO == 	0000017
replace County = 	"Beauregard"	if LOGRECNO == 	0000018
replace County = 	"Bienville"	if LOGRECNO == 	0000019
replace County = 	"Bossier"	if LOGRECNO == 	0000020
replace County = 	"Caddo"	if LOGRECNO == 	0000021
replace County = 	"Calcasieu"	if LOGRECNO == 	0000022
replace County = 	"Caldwell"	if LOGRECNO == 	0000023
replace County = 	"Cameron"	if LOGRECNO == 	0000024
replace County = 	"Catahoula"	if LOGRECNO == 	0000025
replace County = 	"Claiborne"	if LOGRECNO == 	0000026
replace County = 	"Concordia"	if LOGRECNO == 	0000027
replace County = 	"De Soto"	if LOGRECNO == 	0000028
replace County = 	"East Baton Rouge"	if LOGRECNO == 	0000029
replace County = 	"East Carroll"	if LOGRECNO == 	0000030
replace County = 	"East Feliciana"	if LOGRECNO == 	0000031
replace County = 	"Evangeline"	if LOGRECNO == 	0000032
replace County = 	"Franklin"	if LOGRECNO == 	0000033
replace County = 	"Grant"	if LOGRECNO == 	0000034
replace County = 	"Iberia"	if LOGRECNO == 	0000035
replace County = 	"Iberville"	if LOGRECNO == 	0000036
replace County = 	"Jackson"	if LOGRECNO == 	0000037
replace County = 	"Jefferson"	if LOGRECNO == 	0000038
replace County = 	"Jefferson Davis"	if LOGRECNO == 	0000039
replace County = 	"Lafayette"	if LOGRECNO == 	0000040
replace County = 	"Lafourche"	if LOGRECNO == 	0000041
replace County = 	"La Salle"	if LOGRECNO == 	0000042
replace County = 	"Lincoln"	if LOGRECNO == 	0000043
replace County = 	"Livingston"	if LOGRECNO == 	0000044
replace County = 	"Madison"	if LOGRECNO == 	0000045
replace County = 	"Morehouse"	if LOGRECNO == 	0000046
replace County = 	"Natchitoches"	if LOGRECNO == 	0000047
replace County = 	"Orleans"	if LOGRECNO == 	0000048
replace County = 	"Ouachita"	if LOGRECNO == 	0000049
replace County = 	"Plaquemines"	if LOGRECNO == 	0000050
replace County = 	"Pointe Coupee"	if LOGRECNO == 	0000051
replace County = 	"Rapides"	if LOGRECNO == 	0000052
replace County = 	"Red River"	if LOGRECNO == 	0000053
replace County = 	"Richland"	if LOGRECNO == 	0000054
replace County = 	"Sabine"	if LOGRECNO == 	0000055
replace County = 	"St. Bernard"	if LOGRECNO == 	0000056
replace County = 	"St. Charles"	if LOGRECNO == 	0000057
replace County = 	"St. Helena"	if LOGRECNO == 	0000058
replace County = 	"St. James"	if LOGRECNO == 	0000059
replace County = 	"St. John the Baptist"	if LOGRECNO == 	0000060
replace County = 	"St. Landry"	if LOGRECNO == 	0000061
replace County = 	"St. Martin"	if LOGRECNO == 	0000062
replace County = 	"St. Mary"	if LOGRECNO == 	0000063
replace County = 	"St. Tammany"	if LOGRECNO == 	0000064
replace County = 	"Tangipahoa"	if LOGRECNO == 	0000065
replace County = 	"Tensas"	if LOGRECNO == 	0000066
replace County = 	"Terrebonne"	if LOGRECNO == 	0000067
replace County = 	"Union"	if LOGRECNO == 	0000068
replace County = 	"Vermilion"	if LOGRECNO == 	0000069
replace County = 	"Vernon"	if LOGRECNO == 	0000070
replace County = 	"Washington"	if LOGRECNO == 	0000071
replace County = 	"Webster"	if LOGRECNO == 	0000072
replace County = 	"West Baton Rouge"	if LOGRECNO == 	0000073
replace County = 	"West Carroll"	if LOGRECNO == 	0000074
replace County = 	"West Feliciana"	if LOGRECNO == 	0000075
replace County = 	"Winn"	if LOGRECNO == 	0000076

gen cntycode = .
replace cntycode = 	10	if County == 	"Acadia"
replace cntycode = 	30	if County == 	"Allen"
replace cntycode = 	50	if County == 	"Ascension"
replace cntycode = 	70	if County == 	"Assumption"
replace cntycode = 	90	if County == 	"Avoyelles"
replace cntycode = 	110	if County == 	"Beauregard"
replace cntycode = 	130	if County == 	"Bienville"
replace cntycode = 	150	if County == 	"Bossier"
replace cntycode = 	170	if County == 	"Caddo"
replace cntycode = 	190	if County == 	"Calcasieu"
replace cntycode = 	210	if County == 	"Caldwell"
replace cntycode = 	230	if County == 	"Cameron"
replace cntycode = 	250	if County == 	"Catahoula"
replace cntycode = 	270	if County == 	"Claiborne"
replace cntycode = 	290	if County == 	"Concordia"
replace cntycode = 	310	if County == 	"De Soto"
replace cntycode = 	330	if County == 	"East Baton Rouge"
replace cntycode = 	350	if County == 	"East Carroll"
replace cntycode = 	370	if County == 	"East Feliciana"
replace cntycode = 	390	if County == 	"Evangeline"
replace cntycode = 	410	if County == 	"Franklin"
replace cntycode = 	430	if County == 	"Grant"
replace cntycode = 	450	if County == 	"Iberia"
replace cntycode = 	470	if County == 	"Iberville"
replace cntycode = 	490	if County == 	"Jackson"
replace cntycode = 	510	if County == 	"Jefferson"
replace cntycode = 	530	if County == 	"Jefferson Davis"
replace cntycode = 	550	if County == 	"Lafayette"
replace cntycode = 	570	if County == 	"Lafourche"
replace cntycode = 	590	if County == 	"La Salle"
replace cntycode = 	610	if County == 	"Lincoln"
replace cntycode = 	630	if County == 	"Livingston"
replace cntycode = 	650	if County == 	"Madison"
replace cntycode = 	670	if County == 	"Morehouse"
replace cntycode = 	690	if County == 	"Natchitoches"
replace cntycode = 	710	if County == 	"Orleans"
replace cntycode = 	730	if County == 	"Ouachita"
replace cntycode = 	750	if County == 	"Plaquemines"
replace cntycode = 	770	if County == 	"Pointe Coupee"
replace cntycode = 	790	if County == 	"Rapides"
replace cntycode = 	810	if County == 	"Red River"
replace cntycode = 	830	if County == 	"Richland"
replace cntycode = 	850	if County == 	"Sabine"
replace cntycode = 	870	if County == 	"St. Bernard"
replace cntycode = 	890	if County == 	"St. Charles"
replace cntycode = 	910	if County == 	"St. Helena"
replace cntycode = 	930	if County == 	"St. James"
replace cntycode = 	950	if County == 	"St. John the Baptist"
replace cntycode = 	970	if County == 	"St. Landry"
replace cntycode = 	990	if County == 	"St. Martin"
replace cntycode = 	1010	if County == 	"St. Mary"
replace cntycode = 	1030	if County == 	"St. Tammany"
replace cntycode = 	1050	if County == 	"Tangipahoa"
replace cntycode = 	1070	if County == 	"Tensas"
replace cntycode = 	1090	if County == 	"Terrebonne"
replace cntycode = 	1110	if County == 	"Union"
replace cntycode = 	1130	if County == 	"Vermilion"
replace cntycode = 	1150	if County == 	"Vernon"
replace cntycode = 	1170	if County == 	"Washington"
replace cntycode = 	1190	if County == 	"Webster"
replace cntycode = 	1210	if County == 	"West Baton Rouge"
replace cntycode = 	1230	if County == 	"West Carroll"
replace cntycode = 	1250	if County == 	"West Feliciana"
replace cntycode = 	1270	if County == 	"Winn"

*modified 7.8.20 by RA to statefips=22 instead of 21
gen statfips = 22
gen staticpsr = 51

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save LA_FBPop_2010.dta, replace

clear
