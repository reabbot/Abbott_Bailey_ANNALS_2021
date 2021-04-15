/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Tennessee. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105tn0005001.txt

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
	 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 ///
	 104 105 106 107 )
	 
keep if OK

/* 3414 observations deleted. 95 remaining. */

gen County = ""
replace County = 	"Anderson"	if LOGRECNO == 	0000013
replace County = 	"Bedford"	if LOGRECNO == 	0000014
replace County = 	"Benton"	if LOGRECNO == 	0000015
replace County = 	"Bledsoe"	if LOGRECNO == 	0000016
replace County = 	"Blount"	if LOGRECNO == 	0000017
replace County = 	"Bradley"	if LOGRECNO == 	0000018
replace County = 	"Campbell"	if LOGRECNO == 	0000019
replace County = 	"Cannon"	if LOGRECNO == 	0000020
replace County = 	"Carroll"	if LOGRECNO == 	0000021
replace County = 	"Carter"	if LOGRECNO == 	0000022
replace County = 	"Cheatham"	if LOGRECNO == 	0000023
replace County = 	"Chester"	if LOGRECNO == 	0000024
replace County = 	"Claiborne"	if LOGRECNO == 	0000025
replace County = 	"Clay"	if LOGRECNO == 	0000026
replace County = 	"Cocke"	if LOGRECNO == 	0000027
replace County = 	"Coffee"	if LOGRECNO == 	0000028
replace County = 	"Crockett"	if LOGRECNO == 	0000029
replace County = 	"Cumberland"	if LOGRECNO == 	0000030
replace County = 	"Davidson"	if LOGRECNO == 	0000031
replace County = 	"Decatur"	if LOGRECNO == 	0000032
replace County = 	"DeKalb"	if LOGRECNO == 	0000033
replace County = 	"Dickson"	if LOGRECNO == 	0000034
replace County = 	"Dyer"	if LOGRECNO == 	0000035
replace County = 	"Fayette"	if LOGRECNO == 	0000036
replace County = 	"Fentress"	if LOGRECNO == 	0000037
replace County = 	"Franklin"	if LOGRECNO == 	0000038
replace County = 	"Gibson"	if LOGRECNO == 	0000039
replace County = 	"Giles"	if LOGRECNO == 	0000040
replace County = 	"Grainger"	if LOGRECNO == 	0000041
replace County = 	"Greene"	if LOGRECNO == 	0000042
replace County = 	"Grundy"	if LOGRECNO == 	0000043
replace County = 	"Hamblen"	if LOGRECNO == 	0000044
replace County = 	"Hamilton"	if LOGRECNO == 	0000045
replace County = 	"Hancock"	if LOGRECNO == 	0000046
replace County = 	"Hardeman"	if LOGRECNO == 	0000047
replace County = 	"Hardin"	if LOGRECNO == 	0000048
replace County = 	"Hawkins"	if LOGRECNO == 	0000049
replace County = 	"Haywood"	if LOGRECNO == 	0000050
replace County = 	"Henderson"	if LOGRECNO == 	0000051
replace County = 	"Henry"	if LOGRECNO == 	0000052
replace County = 	"Hickman"	if LOGRECNO == 	0000053
replace County = 	"Houston"	if LOGRECNO == 	0000054
replace County = 	"Humphreys"	if LOGRECNO == 	0000055
replace County = 	"Jackson"	if LOGRECNO == 	0000056
replace County = 	"Jefferson"	if LOGRECNO == 	0000057
replace County = 	"Johnson"	if LOGRECNO == 	0000058
replace County = 	"Knox"	if LOGRECNO == 	0000059
replace County = 	"Lake"	if LOGRECNO == 	0000060
replace County = 	"Lauderdale"	if LOGRECNO == 	0000061
replace County = 	"Lawrence"	if LOGRECNO == 	0000062
replace County = 	"Lewis"	if LOGRECNO == 	0000063
replace County = 	"Lincoln"	if LOGRECNO == 	0000064
replace County = 	"Loudon"	if LOGRECNO == 	0000065
replace County = 	"McMinn"	if LOGRECNO == 	0000066
replace County = 	"McNairy"	if LOGRECNO == 	0000067
replace County = 	"Macon"	if LOGRECNO == 	0000068
replace County = 	"Madison"	if LOGRECNO == 	0000069
replace County = 	"Marion"	if LOGRECNO == 	0000070
replace County = 	"Marshall"	if LOGRECNO == 	0000071
replace County = 	"Maury"	if LOGRECNO == 	0000072
replace County = 	"Meigs"	if LOGRECNO == 	0000073
replace County = 	"Monroe"	if LOGRECNO == 	0000074
replace County = 	"Montgomery"	if LOGRECNO == 	0000075
replace County = 	"Moore"	if LOGRECNO == 	0000076
replace County = 	"Morgan"	if LOGRECNO == 	0000077
replace County = 	"Obion"	if LOGRECNO == 	0000078
replace County = 	"Overton"	if LOGRECNO == 	0000079
replace County = 	"Perry"	if LOGRECNO == 	0000080
replace County = 	"Pickett"	if LOGRECNO == 	0000081
replace County = 	"Polk"	if LOGRECNO == 	0000082
replace County = 	"Putnam"	if LOGRECNO == 	0000083
replace County = 	"Rhea"	if LOGRECNO == 	0000084
replace County = 	"Roane"	if LOGRECNO == 	0000085
replace County = 	"Robertson"	if LOGRECNO == 	0000086
replace County = 	"Rutherford"	if LOGRECNO == 	0000087
replace County = 	"Scott"	if LOGRECNO == 	0000088
replace County = 	"Sequatchie"	if LOGRECNO == 	0000089
replace County = 	"Sevier"	if LOGRECNO == 	0000090
replace County = 	"Shelby"	if LOGRECNO == 	0000091
replace County = 	"Smith"	if LOGRECNO == 	0000092
replace County = 	"Stewart"	if LOGRECNO == 	0000093
replace County = 	"Sullivan"	if LOGRECNO == 	0000094
replace County = 	"Sumner"	if LOGRECNO == 	0000095
replace County = 	"Tipton"	if LOGRECNO == 	0000096
replace County = 	"Trousdale"	if LOGRECNO == 	0000097
replace County = 	"Unicoi"	if LOGRECNO == 	0000098
replace County = 	"Union"	if LOGRECNO == 	0000099
replace County = 	"Van Buren"	if LOGRECNO == 	0000100
replace County = 	"Warren"	if LOGRECNO == 	0000101
replace County = 	"Washington"	if LOGRECNO == 	0000102
replace County = 	"Wayne"	if LOGRECNO == 	0000103
replace County = 	"Weakley"	if LOGRECNO == 	0000104
replace County = 	"White"	if LOGRECNO == 	0000105
replace County = 	"Williamson"	if LOGRECNO == 	0000106
replace County = 	"Wilson"	if LOGRECNO == 	0000107

gen cntycode = .
replace cntycode = 	10	if County == 	"Anderson"
replace cntycode = 	30	if County == 	"Bedford"
replace cntycode = 	50	if County == 	"Benton"
replace cntycode = 	70	if County == 	"Bledsoe"
replace cntycode = 	90	if County == 	"Blount"
replace cntycode = 	110	if County == 	"Bradley"
replace cntycode = 	130	if County == 	"Campbell"
replace cntycode = 	150	if County == 	"Cannon"
replace cntycode = 	170	if County == 	"Carroll"
replace cntycode = 	190	if County == 	"Carter"
replace cntycode = 	210	if County == 	"Cheatham"
replace cntycode = 	230	if County == 	"Chester"
replace cntycode = 	250	if County == 	"Claiborne"
replace cntycode = 	270	if County == 	"Clay"
replace cntycode = 	290	if County == 	"Cocke"
replace cntycode = 	310	if County == 	"Coffee"
replace cntycode = 	330	if County == 	"Crockett"
replace cntycode = 	350	if County == 	"Cumberland"
replace cntycode = 	370	if County == 	"Davidson"
replace cntycode = 	390	if County == 	"Decatur"
replace cntycode = 	410	if County == 	"DeKalb"
replace cntycode = 	430	if County == 	"Dickson"
replace cntycode = 	450	if County == 	"Dyer"
replace cntycode = 	470	if County == 	"Fayette"
replace cntycode = 	490	if County == 	"Fentress"
replace cntycode = 	510	if County == 	"Franklin"
replace cntycode = 	530	if County == 	"Gibson"
replace cntycode = 	550	if County == 	"Giles"
replace cntycode = 	570	if County == 	"Grainger"
replace cntycode = 	590	if County == 	"Greene"
replace cntycode = 	610	if County == 	"Grundy"
replace cntycode = 	630	if County == 	"Hamblen"
replace cntycode = 	650	if County == 	"Hamilton"
replace cntycode = 	670	if County == 	"Hancock"
replace cntycode = 	690	if County == 	"Hardeman"
replace cntycode = 	710	if County == 	"Hardin"
replace cntycode = 	730	if County == 	"Hawkins"
replace cntycode = 	750	if County == 	"Haywood"
replace cntycode = 	770	if County == 	"Henderson"
replace cntycode = 	790	if County == 	"Henry"
replace cntycode = 	810	if County == 	"Hickman"
replace cntycode = 	830	if County == 	"Houston"
replace cntycode = 	850	if County == 	"Humphreys"
replace cntycode = 	870	if County == 	"Jackson"
replace cntycode = 	890	if County == 	"Jefferson"
replace cntycode = 	910	if County == 	"Johnson"
replace cntycode = 	930	if County == 	"Knox"
replace cntycode = 	950	if County == 	"Lake"
replace cntycode = 	970	if County == 	"Lauderdale"
replace cntycode = 	990	if County == 	"Lawrence"
replace cntycode = 	1010	if County == 	"Lewis"
replace cntycode = 	1030	if County == 	"Lincoln"
replace cntycode = 	1050	if County == 	"Loudon"
replace cntycode = 	1070	if County == 	"McMinn"
replace cntycode = 	1090	if County == 	"McNairy"
replace cntycode = 	1110	if County == 	"Macon"
replace cntycode = 	1130	if County == 	"Madison"
replace cntycode = 	1150	if County == 	"Marion"
replace cntycode = 	1170	if County == 	"Marshall"
replace cntycode = 	1190	if County == 	"Maury"
replace cntycode = 	1210	if County == 	"Meigs"
replace cntycode = 	1230	if County == 	"Monroe"
replace cntycode = 	1250	if County == 	"Montgomery"
replace cntycode = 	1270	if County == 	"Moore"
replace cntycode = 	1290	if County == 	"Morgan"
replace cntycode = 	1310	if County == 	"Obion"
replace cntycode = 	1330	if County == 	"Overton"
replace cntycode = 	1350	if County == 	"Perry"
replace cntycode = 	1370	if County == 	"Pickett"
replace cntycode = 	1390	if County == 	"Polk"
replace cntycode = 	1410	if County == 	"Putnam"
replace cntycode = 	1430	if County == 	"Rhea"
replace cntycode = 	1450	if County == 	"Roane"
replace cntycode = 	1470	if County == 	"Robertson"
replace cntycode = 	1490	if County == 	"Rutherford"
replace cntycode = 	1510	if County == 	"Scott"
replace cntycode = 	1530	if County == 	"Sequatchie"
replace cntycode = 	1550	if County == 	"Sevier"
replace cntycode = 	1570	if County == 	"Shelby"
replace cntycode = 	1590	if County == 	"Smith"
replace cntycode = 	1610	if County == 	"Stewart"
replace cntycode = 	1630	if County == 	"Sullivan"
replace cntycode = 	1650	if County == 	"Sumner"
replace cntycode = 	1670	if County == 	"Tipton"
replace cntycode = 	1690	if County == 	"Trousdale"
replace cntycode = 	1710	if County == 	"Unicoi"
replace cntycode = 	1730	if County == 	"Union"
replace cntycode = 	1750	if County == 	"Van Buren"
replace cntycode = 	1770	if County == 	"Warren"
replace cntycode = 	1790	if County == 	"Washington"
replace cntycode = 	1810	if County == 	"Wayne"
replace cntycode = 	1830	if County == 	"Weakley"
replace cntycode = 	1850	if County == 	"White"
replace cntycode = 	1870	if County == 	"Williamson"
replace cntycode = 	1890	if County == 	"Wilson"

gen statfips = 47
gen staticpsr = 54

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save TN_FBPop_2010.dta, replace

clear
