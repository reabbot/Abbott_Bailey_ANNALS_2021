/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Mississippi. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105ms0005001.txt

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
	 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 )
	 
keep if OK

/* 1916 observations dropped; we retain 84. */

gen County = ""
replace County = 	"Adams"	if LOGRECNO == 	0000013
replace County = 	"Alcorn"	if LOGRECNO == 	0000014
replace County = 	"Amite"	if LOGRECNO == 	0000015
replace County = 	"Attala"	if LOGRECNO == 	0000016
replace County = 	"Benton"	if LOGRECNO == 	0000017
replace County = 	"Bolivar"	if LOGRECNO == 	0000018
replace County = 	"Calhoun"	if LOGRECNO == 	0000019
replace County = 	"Carroll"	if LOGRECNO == 	0000020
replace County = 	"Chickasaw"	if LOGRECNO == 	0000021
replace County = 	"Choctaw"	if LOGRECNO == 	0000022
replace County = 	"Claiborne"	if LOGRECNO == 	0000023
replace County = 	"Clarke"	if LOGRECNO == 	0000024
replace County = 	"Clay"	if LOGRECNO == 	0000025
replace County = 	"Coahoma"	if LOGRECNO == 	0000026
replace County = 	"Copiah"	if LOGRECNO == 	0000027
replace County = 	"Covington"	if LOGRECNO == 	0000028
replace County = 	"DeSoto"	if LOGRECNO == 	0000029
replace County = 	"Forrest"	if LOGRECNO == 	0000030
replace County = 	"Franklin"	if LOGRECNO == 	0000031
replace County = 	"George"	if LOGRECNO == 	0000032
replace County = 	"Greene"	if LOGRECNO == 	0000033
replace County = 	"Grenada"	if LOGRECNO == 	0000034
replace County = 	"Hancock"	if LOGRECNO == 	0000035
replace County = 	"Harrison"	if LOGRECNO == 	0000036
replace County = 	"Hinds"	if LOGRECNO == 	0000037
replace County = 	"Holmes"	if LOGRECNO == 	0000038
replace County = 	"Humphreys"	if LOGRECNO == 	0000039
replace County = 	"Issaquena"	if LOGRECNO == 	0000040
replace County = 	"Itawamba"	if LOGRECNO == 	0000041
replace County = 	"Jackson"	if LOGRECNO == 	0000042
replace County = 	"Jasper"	if LOGRECNO == 	0000043
replace County = 	"Jefferson"	if LOGRECNO == 	0000044
replace County = 	"Jefferson Davis"	if LOGRECNO == 	0000045
replace County = 	"Jones"	if LOGRECNO == 	0000046
replace County = 	"Kemper"	if LOGRECNO == 	0000047
replace County = 	"Lafayette"	if LOGRECNO == 	0000048
replace County = 	"Lamar"	if LOGRECNO == 	0000049
replace County = 	"Lauderdale"	if LOGRECNO == 	0000050
replace County = 	"Lawrence"	if LOGRECNO == 	0000051
replace County = 	"Leake"	if LOGRECNO == 	0000052
replace County = 	"Lee"	if LOGRECNO == 	0000053
replace County = 	"Leflore"	if LOGRECNO == 	0000054
replace County = 	"Lincoln"	if LOGRECNO == 	0000055
replace County = 	"Lowndes"	if LOGRECNO == 	0000056
replace County = 	"Madison"	if LOGRECNO == 	0000057
replace County = 	"Marion"	if LOGRECNO == 	0000058
replace County = 	"Marshall"	if LOGRECNO == 	0000059
replace County = 	"Monroe"	if LOGRECNO == 	0000060
replace County = 	"Montgomery"	if LOGRECNO == 	0000061
replace County = 	"Neshoba"	if LOGRECNO == 	0000062
replace County = 	"Newton"	if LOGRECNO == 	0000063
replace County = 	"Noxubee"	if LOGRECNO == 	0000064
replace County = 	"Oktibbeha"	if LOGRECNO == 	0000065
replace County = 	"Panola"	if LOGRECNO == 	0000066
replace County = 	"Pearl River"	if LOGRECNO == 	0000067
replace County = 	"Perry"	if LOGRECNO == 	0000068
replace County = 	"Pike"	if LOGRECNO == 	0000069
replace County = 	"Pontotoc"	if LOGRECNO == 	0000070
replace County = 	"Prentiss"	if LOGRECNO == 	0000071
replace County = 	"Quitman"	if LOGRECNO == 	0000072
replace County = 	"Rankin"	if LOGRECNO == 	0000073
replace County = 	"Scott"	if LOGRECNO == 	0000074
replace County = 	"Sharkey"	if LOGRECNO == 	0000075
replace County = 	"Simpson"	if LOGRECNO == 	0000076
replace County = 	"Smith"	if LOGRECNO == 	0000077
replace County = 	"Stone"	if LOGRECNO == 	0000078
replace County = 	"Sunflower"	if LOGRECNO == 	0000079
replace County = 	"Tallahatchie"	if LOGRECNO == 	0000080
replace County = 	"Tate"	if LOGRECNO == 	0000081
replace County = 	"Tippah"	if LOGRECNO == 	0000082
replace County = 	"Tishomingo"	if LOGRECNO == 	0000083
replace County = 	"Tunica"	if LOGRECNO == 	0000084
replace County = 	"Union"	if LOGRECNO == 	0000085
replace County = 	"Walthall"	if LOGRECNO == 	0000086
replace County = 	"Warren"	if LOGRECNO == 	0000087
replace County = 	"Washington"	if LOGRECNO == 	0000088
replace County = 	"Wayne"	if LOGRECNO == 	0000089
replace County = 	"Webster"	if LOGRECNO == 	0000090
replace County = 	"Wilkinson"	if LOGRECNO == 	0000091
replace County = 	"Winston"	if LOGRECNO == 	0000092
replace County = 	"Yalobusha"	if LOGRECNO == 	0000093
replace County = 	"Yazoo"	if LOGRECNO == 	0000094

gen cntycode = .
replace cntycode = 	10	if County == 	"Adams"
replace cntycode = 	30	if County == 	"Alcorn"
replace cntycode = 	50	if County == 	"Amite"
replace cntycode = 	70	if County == 	"Attala"
replace cntycode = 	90	if County == 	"Benton"
replace cntycode = 	110	if County == 	"Bolivar"
replace cntycode = 	130	if County == 	"Calhoun"
replace cntycode = 	150	if County == 	"Carroll"
replace cntycode = 	170	if County == 	"Chickasaw"
replace cntycode = 	190	if County == 	"Choctaw"
replace cntycode = 	210	if County == 	"Claiborne"
replace cntycode = 	230	if County == 	"Clarke"
replace cntycode = 	250	if County == 	"Clay"
replace cntycode = 	270	if County == 	"Coahoma"
replace cntycode = 	290	if County == 	"Copiah"
replace cntycode = 	310	if County == 	"Covington"
replace cntycode = 	330	if County == 	"DeSoto"
replace cntycode = 	350	if County == 	"Forrest"
replace cntycode = 	370	if County == 	"Franklin"
replace cntycode = 	390	if County == 	"George"
replace cntycode = 	410	if County == 	"Greene"
replace cntycode = 	430	if County == 	"Grenada"
replace cntycode = 	450	if County == 	"Hancock"
replace cntycode = 	470	if County == 	"Harrison"
replace cntycode = 	490	if County == 	"Hinds"
replace cntycode = 	510	if County == 	"Holmes"
replace cntycode = 	530	if County == 	"Humphreys"
replace cntycode = 	550	if County == 	"Issaquena"
replace cntycode = 	570	if County == 	"Itawamba"
replace cntycode = 	590	if County == 	"Jackson"
replace cntycode = 	610	if County == 	"Jasper"
replace cntycode = 	630	if County == 	"Jefferson"
replace cntycode = 	650	if County == 	"Jefferson Davis"
replace cntycode = 	670	if County == 	"Jones"
replace cntycode = 	690	if County == 	"Kemper"
replace cntycode = 	710	if County == 	"Lafayette"
replace cntycode = 	730	if County == 	"Lamar"
replace cntycode = 	750	if County == 	"Lauderdale"
replace cntycode = 	770	if County == 	"Lawrence"
replace cntycode = 	790	if County == 	"Leake"
replace cntycode = 	810	if County == 	"Lee"
replace cntycode = 	830	if County == 	"Leflore"
replace cntycode = 	850	if County == 	"Lincoln"
replace cntycode = 	870	if County == 	"Lowndes"
replace cntycode = 	890	if County == 	"Madison"
replace cntycode = 	910	if County == 	"Marion"
replace cntycode = 	930	if County == 	"Marshall"
replace cntycode = 	950	if County == 	"Monroe"
replace cntycode = 	970	if County == 	"Montgomery"
replace cntycode = 	990	if County == 	"Neshoba"
replace cntycode = 	1010	if County == 	"Newton"
replace cntycode = 	1030	if County == 	"Noxubee"
replace cntycode = 	1050	if County == 	"Oktibbeha"
replace cntycode = 	1070	if County == 	"Panola"
replace cntycode = 	1090	if County == 	"Pearl River"
replace cntycode = 	1110	if County == 	"Perry"
replace cntycode = 	1130	if County == 	"Pike"
replace cntycode = 	1150	if County == 	"Pontotoc"
replace cntycode = 	1170	if County == 	"Prentiss"
replace cntycode = 	1190	if County == 	"Quitman"
replace cntycode = 	1210	if County == 	"Rankin"
replace cntycode = 	1230	if County == 	"Scott"
replace cntycode = 	1250	if County == 	"Sharkey"
replace cntycode = 	1270	if County == 	"Simpson"
replace cntycode = 	1290	if County == 	"Smith"
replace cntycode = 	1310	if County == 	"Stone"
replace cntycode = 	1330	if County == 	"Sunflower"
replace cntycode = 	1350	if County == 	"Tallahatchie"
replace cntycode = 	1370	if County == 	"Tate"
replace cntycode = 	1390	if County == 	"Tippah"
replace cntycode = 	1410	if County == 	"Tishomingo"
replace cntycode = 	1430	if County == 	"Tunica"
replace cntycode = 	1450	if County == 	"Union"
replace cntycode = 	1470	if County == 	"Walthall"
replace cntycode = 	1490	if County == 	"Warren"
replace cntycode = 	1510	if County == 	"Washington"
replace cntycode = 	1530	if County == 	"Wayne"
replace cntycode = 	1550	if County == 	"Webster"
replace cntycode = 	1570	if County == 	"Wilkinson"
replace cntycode = 	1590	if County == 	"Winston"
replace cntycode = 	1610	if County == 	"Yalobusha"
replace cntycode = 	1630	if County == 	"Yazoo"


gen statfips = 28
gen staticpsr = 46

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save MS_FBPop_2010.dta, replace

clear
