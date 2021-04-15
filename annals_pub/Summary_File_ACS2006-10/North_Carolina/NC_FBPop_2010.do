/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for North Carolina. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105nc0005001.txt

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
	 104 105 106 107 108 109 110 111 112 )
	 
keep if OK

/* 4782 observations dropped. 100 observations retained. */

gen County = ""
replace County = 	"Alamance"	if LOGRECNO == 	0000013
replace County = 	"Alexander"	if LOGRECNO == 	0000014
replace County = 	"Alleghany"	if LOGRECNO == 	0000015
replace County = 	"Anson"	if LOGRECNO == 	0000016
replace County = 	"Ashe"	if LOGRECNO == 	0000017
replace County = 	"Avery"	if LOGRECNO == 	0000018
replace County = 	"Beaufort"	if LOGRECNO == 	0000019
replace County = 	"Bertie"	if LOGRECNO == 	0000020
replace County = 	"Bladen"	if LOGRECNO == 	0000021
replace County = 	"Brunswick"	if LOGRECNO == 	0000022
replace County = 	"Buncombe"	if LOGRECNO == 	0000023
replace County = 	"Burke"	if LOGRECNO == 	0000024
replace County = 	"Cabarrus"	if LOGRECNO == 	0000025
replace County = 	"Caldwell"	if LOGRECNO == 	0000026
replace County = 	"Camden"	if LOGRECNO == 	0000027
replace County = 	"Carteret"	if LOGRECNO == 	0000028
replace County = 	"Caswell"	if LOGRECNO == 	0000029
replace County = 	"Catawba"	if LOGRECNO == 	0000030
replace County = 	"Chatham"	if LOGRECNO == 	0000031
replace County = 	"Cherokee"	if LOGRECNO == 	0000032
replace County = 	"Chowan"	if LOGRECNO == 	0000033
replace County = 	"Clay"	if LOGRECNO == 	0000034
replace County = 	"Cleveland"	if LOGRECNO == 	0000035
replace County = 	"Columbus"	if LOGRECNO == 	0000036
replace County = 	"Craven"	if LOGRECNO == 	0000037
replace County = 	"Cumberland"	if LOGRECNO == 	0000038
replace County = 	"Currituck"	if LOGRECNO == 	0000039
replace County = 	"Dare"	if LOGRECNO == 	0000040
replace County = 	"Davidson"	if LOGRECNO == 	0000041
replace County = 	"Davie"	if LOGRECNO == 	0000042
replace County = 	"Duplin"	if LOGRECNO == 	0000043
replace County = 	"Durham"	if LOGRECNO == 	0000044
replace County = 	"Edgecombe"	if LOGRECNO == 	0000045
replace County = 	"Forsyth"	if LOGRECNO == 	0000046
replace County = 	"Franklin"	if LOGRECNO == 	0000047
replace County = 	"Gaston"	if LOGRECNO == 	0000048
replace County = 	"Gates"	if LOGRECNO == 	0000049
replace County = 	"Graham"	if LOGRECNO == 	0000050
replace County = 	"Granville"	if LOGRECNO == 	0000051
replace County = 	"Greene"	if LOGRECNO == 	0000052
replace County = 	"Guilford"	if LOGRECNO == 	0000053
replace County = 	"Halifax"	if LOGRECNO == 	0000054
replace County = 	"Harnett"	if LOGRECNO == 	0000055
replace County = 	"Haywood"	if LOGRECNO == 	0000056
replace County = 	"Henderson"	if LOGRECNO == 	0000057
replace County = 	"Hertford"	if LOGRECNO == 	0000058
replace County = 	"Hoke"	if LOGRECNO == 	0000059
replace County = 	"Hyde"	if LOGRECNO == 	0000060
replace County = 	"Iredell"	if LOGRECNO == 	0000061
replace County = 	"Jackson"	if LOGRECNO == 	0000062
replace County = 	"Johnston"	if LOGRECNO == 	0000063
replace County = 	"Jones"	if LOGRECNO == 	0000064
replace County = 	"Lee"	if LOGRECNO == 	0000065
replace County = 	"Lenoir"	if LOGRECNO == 	0000066
replace County = 	"Lincoln"	if LOGRECNO == 	0000067
replace County = 	"McDowell"	if LOGRECNO == 	0000068
replace County = 	"Macon"	if LOGRECNO == 	0000069
replace County = 	"Madison"	if LOGRECNO == 	0000070
replace County = 	"Martin"	if LOGRECNO == 	0000071
replace County = 	"Mecklenburg"	if LOGRECNO == 	0000072
replace County = 	"Mitchell"	if LOGRECNO == 	0000073
replace County = 	"Montgomery"	if LOGRECNO == 	0000074
replace County = 	"Moore"	if LOGRECNO == 	0000075
replace County = 	"Nash"	if LOGRECNO == 	0000076
replace County = 	"New Hanover"	if LOGRECNO == 	0000077
replace County = 	"Northampton"	if LOGRECNO == 	0000078
replace County = 	"Onslow"	if LOGRECNO == 	0000079
replace County = 	"Orange"	if LOGRECNO == 	0000080
replace County = 	"Pamlico"	if LOGRECNO == 	0000081
replace County = 	"Pasquotank"	if LOGRECNO == 	0000082
replace County = 	"Pender"	if LOGRECNO == 	0000083
replace County = 	"Perquimans"	if LOGRECNO == 	0000084
replace County = 	"Person"	if LOGRECNO == 	0000085
replace County = 	"Pitt"	if LOGRECNO == 	0000086
replace County = 	"Polk"	if LOGRECNO == 	0000087
replace County = 	"Randolph"	if LOGRECNO == 	0000088
replace County = 	"Richmond"	if LOGRECNO == 	0000089
replace County = 	"Robeson"	if LOGRECNO == 	0000090
replace County = 	"Rockingham"	if LOGRECNO == 	0000091
replace County = 	"Rowan"	if LOGRECNO == 	0000092
replace County = 	"Rutherford"	if LOGRECNO == 	0000093
replace County = 	"Sampson"	if LOGRECNO == 	0000094
replace County = 	"Scotland"	if LOGRECNO == 	0000095
replace County = 	"Stanly"	if LOGRECNO == 	0000096
replace County = 	"Stokes"	if LOGRECNO == 	0000097
replace County = 	"Surry"	if LOGRECNO == 	0000098
replace County = 	"Swain"	if LOGRECNO == 	0000099
replace County = 	"Transylvania"	if LOGRECNO == 	0000100
replace County = 	"Tyrrell"	if LOGRECNO == 	0000101
replace County = 	"Union"	if LOGRECNO == 	0000102
replace County = 	"Vance"	if LOGRECNO == 	0000103
replace County = 	"Wake"	if LOGRECNO == 	0000104
replace County = 	"Warren"	if LOGRECNO == 	0000105
replace County = 	"Washington"	if LOGRECNO == 	0000106
replace County = 	"Watauga"	if LOGRECNO == 	0000107
replace County = 	"Wayne"	if LOGRECNO == 	0000108
replace County = 	"Wilkes"	if LOGRECNO == 	0000109
replace County = 	"Wilson"	if LOGRECNO == 	0000110
replace County = 	"Yadkin"	if LOGRECNO == 	0000111
replace County = 	"Yancey"	if LOGRECNO == 	0000112

gen cntycode = .
replace cntycode = 	10	if County == 	"Alamance"
replace cntycode = 	30	if County == 	"Alexander"
replace cntycode = 	50	if County == 	"Alleghany"
replace cntycode = 	70	if County == 	"Anson"
replace cntycode = 	90	if County == 	"Ashe"
replace cntycode = 	110	if County == 	"Avery"
replace cntycode = 	130	if County == 	"Beaufort"
replace cntycode = 	150	if County == 	"Bertie"
replace cntycode = 	170	if County == 	"Bladen"
replace cntycode = 	190	if County == 	"Brunswick"
replace cntycode = 	210	if County == 	"Buncombe"
replace cntycode = 	230	if County == 	"Burke"
replace cntycode = 	250	if County == 	"Cabarrus"
replace cntycode = 	270	if County == 	"Caldwell"
replace cntycode = 	290	if County == 	"Camden"
replace cntycode = 	310	if County == 	"Carteret"
replace cntycode = 	330	if County == 	"Caswell"
replace cntycode = 	350	if County == 	"Catawba"
replace cntycode = 	370	if County == 	"Chatham"
replace cntycode = 	390	if County == 	"Cherokee"
replace cntycode = 	410	if County == 	"Chowan"
replace cntycode = 	430	if County == 	"Clay"
replace cntycode = 	450	if County == 	"Cleveland"
replace cntycode = 	470	if County == 	"Columbus"
replace cntycode = 	490	if County == 	"Craven"
replace cntycode = 	510	if County == 	"Cumberland"
replace cntycode = 	530	if County == 	"Currituck"
replace cntycode = 	550	if County == 	"Dare"
replace cntycode = 	570	if County == 	"Davidson"
replace cntycode = 	590	if County == 	"Davie"
replace cntycode = 	610	if County == 	"Duplin"
replace cntycode = 	630	if County == 	"Durham"
replace cntycode = 	650	if County == 	"Edgecombe"
replace cntycode = 	670	if County == 	"Forsyth"
replace cntycode = 	690	if County == 	"Franklin"
replace cntycode = 	710	if County == 	"Gaston"
replace cntycode = 	730	if County == 	"Gates"
replace cntycode = 	750	if County == 	"Graham"
replace cntycode = 	770	if County == 	"Granville"
replace cntycode = 	790	if County == 	"Greene"
replace cntycode = 	810	if County == 	"Guilford"
replace cntycode = 	830	if County == 	"Halifax"
replace cntycode = 	850	if County == 	"Harnett"
replace cntycode = 	870	if County == 	"Haywood"
replace cntycode = 	890	if County == 	"Henderson"
replace cntycode = 	910	if County == 	"Hertford"
replace cntycode = 	930	if County == 	"Hoke"
replace cntycode = 	950	if County == 	"Hyde"
replace cntycode = 	970	if County == 	"Iredell"
replace cntycode = 	990	if County == 	"Jackson"
replace cntycode = 	1010	if County == 	"Johnston"
replace cntycode = 	1030	if County == 	"Jones"
replace cntycode = 	1050	if County == 	"Lee"
replace cntycode = 	1070	if County == 	"Lenoir"
replace cntycode = 	1090	if County == 	"Lincoln"
replace cntycode = 	1110	if County == 	"McDowell"
replace cntycode = 	1130	if County == 	"Macon"
replace cntycode = 	1150	if County == 	"Madison"
replace cntycode = 	1170	if County == 	"Martin"
replace cntycode = 	1190	if County == 	"Mecklenburg"
replace cntycode = 	1210	if County == 	"Mitchell"
replace cntycode = 	1230	if County == 	"Montgomery"
replace cntycode = 	1250	if County == 	"Moore"
replace cntycode = 	1270	if County == 	"Nash"
replace cntycode = 	1290	if County == 	"New Hanover"
replace cntycode = 	1310	if County == 	"Northampton"
replace cntycode = 	1330	if County == 	"Onslow"
replace cntycode = 	1350	if County == 	"Orange"
replace cntycode = 	1370	if County == 	"Pamlico"
replace cntycode = 	1390	if County == 	"Pasquotank"
replace cntycode = 	1410	if County == 	"Pender"
replace cntycode = 	1430	if County == 	"Perquimans"
replace cntycode = 	1450	if County == 	"Person"
replace cntycode = 	1470	if County == 	"Pitt"
replace cntycode = 	1490	if County == 	"Polk"
replace cntycode = 	1510	if County == 	"Randolph"
replace cntycode = 	1530	if County == 	"Richmond"
replace cntycode = 	1550	if County == 	"Robeson"
replace cntycode = 	1570	if County == 	"Rockingham"
replace cntycode = 	1590	if County == 	"Rowan"
replace cntycode = 	1610	if County == 	"Rutherford"
replace cntycode = 	1630	if County == 	"Sampson"
replace cntycode = 	1650	if County == 	"Scotland"
replace cntycode = 	1670	if County == 	"Stanly"
replace cntycode = 	1690	if County == 	"Stokes"
replace cntycode = 	1710	if County == 	"Surry"
replace cntycode = 	1730	if County == 	"Swain"
replace cntycode = 	1750	if County == 	"Transylvania"
replace cntycode = 	1770	if County == 	"Tyrrell"
replace cntycode = 	1790	if County == 	"Union"
replace cntycode = 	1810	if County == 	"Vance"
replace cntycode = 	1830	if County == 	"Wake"
replace cntycode = 	1850	if County == 	"Warren"
replace cntycode = 	1870	if County == 	"Washington"
replace cntycode = 	1890	if County == 	"Watauga"
replace cntycode = 	1910	if County == 	"Wayne"
replace cntycode = 	1930	if County == 	"Wilkes"
replace cntycode = 	1950	if County == 	"Wilson"
replace cntycode = 	1970	if County == 	"Yadkin"
replace cntycode = 	1990	if County == 	"Yancey"


gen statfips = 37
gen staticpsr = 47

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save NC_FBPop_2010.dta, replace

clear
