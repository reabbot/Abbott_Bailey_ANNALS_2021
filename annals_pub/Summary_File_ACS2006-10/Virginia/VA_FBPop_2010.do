/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Virginia. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105va0005001.txt

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
	 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 ///
	 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 ///
	 142 143 144 145 146 )
	 
keep if OK

/* 3624 observations deleted. We retain 134. */

gen County = ""
replace County = 	"Accomack"	if LOGRECNO == 	0000013
replace County = 	"Albemarle"	if LOGRECNO == 	0000014
replace County = 	"Alleghany"	if LOGRECNO == 	0000015
replace County = 	"Amelia"	if LOGRECNO == 	0000016
replace County = 	"Amherst"	if LOGRECNO == 	0000017
replace County = 	"Appomattox"	if LOGRECNO == 	0000018
replace County = 	"Arlington"	if LOGRECNO == 	0000019
replace County = 	"Augusta"	if LOGRECNO == 	0000020
replace County = 	"Bath"	if LOGRECNO == 	0000021
replace County = 	"Bedford"	if LOGRECNO == 	0000022
replace County = 	"Bland"	if LOGRECNO == 	0000023
replace County = 	"Botetourt"	if LOGRECNO == 	0000024
replace County = 	"Brunswick"	if LOGRECNO == 	0000025
replace County = 	"Buchanan"	if LOGRECNO == 	0000026
replace County = 	"Buckingham"	if LOGRECNO == 	0000027
replace County = 	"Campbell"	if LOGRECNO == 	0000028
replace County = 	"Caroline"	if LOGRECNO == 	0000029
replace County = 	"Carroll"	if LOGRECNO == 	0000030
replace County = 	"Charles City (County)"	if LOGRECNO == 	0000031
replace County = 	"Charlotte"	if LOGRECNO == 	0000032
replace County = 	"Chesterfield"	if LOGRECNO == 	0000033
replace County = 	"Clarke"	if LOGRECNO == 	0000034
replace County = 	"Craig"	if LOGRECNO == 	0000035
replace County = 	"Culpeper"	if LOGRECNO == 	0000036
replace County = 	"Cumberland"	if LOGRECNO == 	0000037
replace County = 	"Dickenson"	if LOGRECNO == 	0000038
replace County = 	"Dinwiddie"	if LOGRECNO == 	0000039
replace County = 	"Essex"	if LOGRECNO == 	0000040
replace County = 	"Fairfax"	if LOGRECNO == 	0000041
replace County = 	"Fauquier"	if LOGRECNO == 	0000042
replace County = 	"Floyd"	if LOGRECNO == 	0000043
replace County = 	"Fluvanna"	if LOGRECNO == 	0000044
replace County = 	"Franklin"	if LOGRECNO == 	0000045
replace County = 	"Frederick"	if LOGRECNO == 	0000046
replace County = 	"Giles"	if LOGRECNO == 	0000047
replace County = 	"Gloucester"	if LOGRECNO == 	0000048
replace County = 	"Goochland"	if LOGRECNO == 	0000049
replace County = 	"Grayson"	if LOGRECNO == 	0000050
replace County = 	"Greene"	if LOGRECNO == 	0000051
replace County = 	"Greensville"	if LOGRECNO == 	0000052
replace County = 	"Halifax"	if LOGRECNO == 	0000053
replace County = 	"Hanover"	if LOGRECNO == 	0000054
replace County = 	"Henrico"	if LOGRECNO == 	0000055
replace County = 	"Henry"	if LOGRECNO == 	0000056
replace County = 	"Highland"	if LOGRECNO == 	0000057
replace County = 	"Isle of Wight"	if LOGRECNO == 	0000058
replace County = 	"James City (County)"	if LOGRECNO == 	0000059
replace County = 	"King and Queen"	if LOGRECNO == 	0000060
replace County = 	"King George"	if LOGRECNO == 	0000061
replace County = 	"King William"	if LOGRECNO == 	0000062
replace County = 	"Lancaster"	if LOGRECNO == 	0000063
replace County = 	"Lee"	if LOGRECNO == 	0000064
replace County = 	"Loudoun"	if LOGRECNO == 	0000065
replace County = 	"Louisa"	if LOGRECNO == 	0000066
replace County = 	"Lunenburg"	if LOGRECNO == 	0000067
replace County = 	"Madison"	if LOGRECNO == 	0000068
replace County = 	"Mathews"	if LOGRECNO == 	0000069
replace County = 	"Mecklenburg"	if LOGRECNO == 	0000070
replace County = 	"Middlesex"	if LOGRECNO == 	0000071
replace County = 	"Montgomery"	if LOGRECNO == 	0000072
replace County = 	"Nelson"	if LOGRECNO == 	0000073
replace County = 	"New Kent"	if LOGRECNO == 	0000074
replace County = 	"Northampton"	if LOGRECNO == 	0000075
replace County = 	"Northumberland"	if LOGRECNO == 	0000076
replace County = 	"Nottoway"	if LOGRECNO == 	0000077
replace County = 	"Orange"	if LOGRECNO == 	0000078
replace County = 	"Page"	if LOGRECNO == 	0000079
replace County = 	"Patrick"	if LOGRECNO == 	0000080
replace County = 	"Pittsylvania"	if LOGRECNO == 	0000081
replace County = 	"Powhatan"	if LOGRECNO == 	0000082
replace County = 	"Prince Edward"	if LOGRECNO == 	0000083
replace County = 	"Prince George"	if LOGRECNO == 	0000084
replace County = 	"Prince William"	if LOGRECNO == 	0000085
replace County = 	"Pulaski"	if LOGRECNO == 	0000086
replace County = 	"Rappahannock"	if LOGRECNO == 	0000087
replace County = 	"Richmond"	if LOGRECNO == 	0000088
replace County = 	"Roanoke"	if LOGRECNO == 	0000089
replace County = 	"Rockbridge"	if LOGRECNO == 	0000090
replace County = 	"Rockingham"	if LOGRECNO == 	0000091
replace County = 	"Russell"	if LOGRECNO == 	0000092
replace County = 	"Scott"	if LOGRECNO == 	0000093
replace County = 	"Shenandoah"	if LOGRECNO == 	0000094
replace County = 	"Smyth"	if LOGRECNO == 	0000095
replace County = 	"Southampton"	if LOGRECNO == 	0000096
replace County = 	"Spotsylvania"	if LOGRECNO == 	0000097
replace County = 	"Stafford"	if LOGRECNO == 	0000098
replace County = 	"Surry"	if LOGRECNO == 	0000099
replace County = 	"Sussex"	if LOGRECNO == 	0000100
replace County = 	"Tazewell"	if LOGRECNO == 	0000101
replace County = 	"Warren"	if LOGRECNO == 	0000102
replace County = 	"Washington"	if LOGRECNO == 	0000103
replace County = 	"Westmoreland"	if LOGRECNO == 	0000104
replace County = 	"Wise"	if LOGRECNO == 	0000105
replace County = 	"Wythe"	if LOGRECNO == 	0000106
replace County = 	"York"	if LOGRECNO == 	0000107
replace County = 	"Alexandria city"	if LOGRECNO == 	0000108
replace County = 	"Bedford city"	if LOGRECNO == 	0000109
replace County = 	"Bristol city"	if LOGRECNO == 	0000110
replace County = 	"Buena Vista city"	if LOGRECNO == 	0000111
replace County = 	"Charlottesville city"	if LOGRECNO == 	0000112
replace County = 	"Chesapeake city"	if LOGRECNO == 	0000113
replace County = 	"Colonial Heights city"	if LOGRECNO == 	0000114
replace County = 	"Covington city"	if LOGRECNO == 	0000115
replace County = 	"Danville city"	if LOGRECNO == 	0000116
replace County = 	"Emporia city"	if LOGRECNO == 	0000117
replace County = 	"Fairfax city"	if LOGRECNO == 	0000118
replace County = 	"Falls Church city"	if LOGRECNO == 	0000119
replace County = 	"Franklin city"	if LOGRECNO == 	0000120
replace County = 	"Fredericksburg city"	if LOGRECNO == 	0000121
replace County = 	"Galax city"	if LOGRECNO == 	0000122
replace County = 	"Hampton city"	if LOGRECNO == 	0000123
replace County = 	"Harrisonburg city"	if LOGRECNO == 	0000124
replace County = 	"Hopewell city"	if LOGRECNO == 	0000125
replace County = 	"Lexington city"	if LOGRECNO == 	0000126
replace County = 	"Lynchburg city"	if LOGRECNO == 	0000127
replace County = 	"Manassas city"	if LOGRECNO == 	0000128
replace County = 	"Manassas Park city"	if LOGRECNO == 	0000129
replace County = 	"Martinsville city"	if LOGRECNO == 	0000130
replace County = 	"Newport News city"	if LOGRECNO == 	0000131
replace County = 	"Norfolk city"	if LOGRECNO == 	0000132
replace County = 	"Norton city"	if LOGRECNO == 	0000133
replace County = 	"Petersburg city"	if LOGRECNO == 	0000134
replace County = 	"Poquoson city"	if LOGRECNO == 	0000135
replace County = 	"Portsmouth city"	if LOGRECNO == 	0000136
replace County = 	"Radford city"	if LOGRECNO == 	0000137
replace County = 	"Richmond city"	if LOGRECNO == 	0000138
replace County = 	"Roanoke city"	if LOGRECNO == 	0000139
replace County = 	"Salem city"	if LOGRECNO == 	0000140
replace County = 	"Staunton city"	if LOGRECNO == 	0000141
replace County = 	"Suffolk city"	if LOGRECNO == 	0000142
replace County = 	"Virginia Beach city"	if LOGRECNO == 	0000143
replace County = 	"Waynesboro city"	if LOGRECNO == 	0000144
replace County = 	"Williamsburg city"	if LOGRECNO == 	0000145
replace County = 	"Winchester city"	if LOGRECNO == 	0000146


gen cntycode = .
replace cntycode =  	10	if LOGRECNO ==	0000013
replace cntycode =  	30	if LOGRECNO ==	0000014
replace cntycode =  	50	if LOGRECNO ==	0000015
replace cntycode =  	70	if LOGRECNO ==	0000016
replace cntycode =  	90	if LOGRECNO ==	0000017
replace cntycode =  	110	if LOGRECNO ==	0000018
replace cntycode =  	130	if LOGRECNO ==	0000019
replace cntycode =  	150	if LOGRECNO ==	0000020
replace cntycode =  	170	if LOGRECNO ==	0000021
replace cntycode =  	190	if LOGRECNO ==	0000022
replace cntycode =  	210	if LOGRECNO ==	0000023
replace cntycode =  	230	if LOGRECNO ==	0000024
replace cntycode =  	250	if LOGRECNO ==	0000025
replace cntycode =  	270	if LOGRECNO ==	0000026
replace cntycode =  	290	if LOGRECNO ==	0000027
replace cntycode =  	310	if LOGRECNO ==	0000028
replace cntycode =  	330	if LOGRECNO ==	0000029
replace cntycode =  	350	if LOGRECNO ==	0000030
replace cntycode =  	360	if LOGRECNO ==	0000031
replace cntycode =  	370	if LOGRECNO ==	0000032
replace cntycode =  	410	if LOGRECNO ==	0000033
replace cntycode =  	430	if LOGRECNO ==	0000034
replace cntycode =  	450	if LOGRECNO ==	0000035
replace cntycode =  	470	if LOGRECNO ==	0000036
replace cntycode =  	490	if LOGRECNO ==	0000037
replace cntycode =  	510	if LOGRECNO ==	0000038
replace cntycode =  	530	if LOGRECNO ==	0000039
replace cntycode =  	570	if LOGRECNO ==	0000040
replace cntycode =  	590	if LOGRECNO ==	0000041
replace cntycode =  	610	if LOGRECNO ==	0000042
replace cntycode =  	630	if LOGRECNO ==	0000043
replace cntycode =  	650	if LOGRECNO ==	0000044
replace cntycode =  	670	if LOGRECNO ==	0000045
replace cntycode =  	690	if LOGRECNO ==	0000046
replace cntycode =  	710	if LOGRECNO ==	0000047
replace cntycode =  	730	if LOGRECNO ==	0000048
replace cntycode =  	750	if LOGRECNO ==	0000049
replace cntycode =  	770	if LOGRECNO ==	0000050
replace cntycode =  	790	if LOGRECNO ==	0000051
replace cntycode =  	810	if LOGRECNO ==	0000052
replace cntycode =  	830	if LOGRECNO ==	0000053
replace cntycode =  	850	if LOGRECNO ==	0000054
replace cntycode =  	870	if LOGRECNO ==	0000055
replace cntycode =  	890	if LOGRECNO ==	0000056
replace cntycode =  	910	if LOGRECNO ==	0000057
replace cntycode =  	930	if LOGRECNO ==	0000058
replace cntycode =  	950	if LOGRECNO ==	0000059
replace cntycode =  	970	if LOGRECNO ==	0000060
replace cntycode =  	990	if LOGRECNO ==	0000061
replace cntycode =  	1010	if LOGRECNO ==	0000062
replace cntycode =  	1030	if LOGRECNO ==	0000063
replace cntycode =  	1050	if LOGRECNO ==	0000064
replace cntycode =  	1070	if LOGRECNO ==	0000065
replace cntycode =  	1090	if LOGRECNO ==	0000066
replace cntycode =  	1110	if LOGRECNO ==	0000067
replace cntycode =  	1130	if LOGRECNO ==	0000068
replace cntycode =  	1150	if LOGRECNO ==	0000069
replace cntycode =  	1170	if LOGRECNO ==	0000070
replace cntycode =  	1190	if LOGRECNO ==	0000071
replace cntycode =  	1210	if LOGRECNO ==	0000072
replace cntycode =  	1250	if LOGRECNO ==	0000073
replace cntycode =  	1270	if LOGRECNO ==	0000074
replace cntycode =  	1310	if LOGRECNO ==	0000075
replace cntycode =  	1330	if LOGRECNO ==	0000076
replace cntycode =  	1350	if LOGRECNO ==	0000077
replace cntycode =  	1370	if LOGRECNO ==	0000078
replace cntycode =  	1390	if LOGRECNO ==	0000079
replace cntycode =  	1410	if LOGRECNO ==	0000080
replace cntycode =  	1430	if LOGRECNO ==	0000081
replace cntycode =  	1450	if LOGRECNO ==	0000082
replace cntycode =  	1470	if LOGRECNO ==	0000083
replace cntycode =  	1490	if LOGRECNO ==	0000084
replace cntycode =  	1530	if LOGRECNO ==	0000085
replace cntycode =  	1550	if LOGRECNO ==	0000086
replace cntycode =  	1570	if LOGRECNO ==	0000087
replace cntycode =  	1590	if LOGRECNO ==	0000088
replace cntycode =  	1610	if LOGRECNO ==	0000089
replace cntycode =  	1630	if LOGRECNO ==	0000090
replace cntycode =  	1650	if LOGRECNO ==	0000091
replace cntycode =  	1670	if LOGRECNO ==	0000092
replace cntycode =  	1690	if LOGRECNO ==	0000093
replace cntycode =  	1710	if LOGRECNO ==	0000094
replace cntycode =  	1730	if LOGRECNO ==	0000095
replace cntycode =  	1750	if LOGRECNO ==	0000096
replace cntycode =  	1770	if LOGRECNO ==	0000097
replace cntycode =  	1790	if LOGRECNO ==	0000098
replace cntycode =  	1810	if LOGRECNO ==	0000099
replace cntycode =  	1830	if LOGRECNO ==	0000100
replace cntycode =  	1850	if LOGRECNO ==	0000101
replace cntycode =  	1870	if LOGRECNO ==	0000102
replace cntycode =  	1910	if LOGRECNO ==	0000103
replace cntycode =  	1930	if LOGRECNO ==	0000104
replace cntycode =  	1950	if LOGRECNO ==	0000105
replace cntycode =  	1970	if LOGRECNO ==	0000106
replace cntycode =  	1990	if LOGRECNO ==	0000107
replace cntycode =  	5100	if LOGRECNO ==	0000108
replace cntycode =  	5150	if LOGRECNO ==	0000109
replace cntycode =  	5200	if LOGRECNO ==	0000110
replace cntycode =  	5300	if LOGRECNO ==	0000111
replace cntycode =  	5400	if LOGRECNO ==	0000112
replace cntycode =  	5500	if LOGRECNO ==	0000113
replace cntycode =  	5700	if LOGRECNO ==	0000114
replace cntycode =  	5800	if LOGRECNO ==	0000115
replace cntycode =  	5900	if LOGRECNO ==	0000116
replace cntycode =  	5950	if LOGRECNO ==	0000117
replace cntycode =  	6000	if LOGRECNO ==	0000118
replace cntycode =  	6100	if LOGRECNO ==	0000119
replace cntycode =  	6200	if LOGRECNO ==	0000120
replace cntycode =  	6300	if LOGRECNO ==	0000121
replace cntycode =  	6400	if LOGRECNO ==	0000122
replace cntycode =  	6500	if LOGRECNO ==	0000123
replace cntycode =  	6600	if LOGRECNO ==	0000124
replace cntycode =  	6700	if LOGRECNO ==	0000125
replace cntycode =  	6780	if LOGRECNO ==	0000126
replace cntycode =  	6800	if LOGRECNO ==	0000127
replace cntycode =  	6830	if LOGRECNO ==	0000128
replace cntycode =  	6850	if LOGRECNO ==	0000129
replace cntycode =  	6900	if LOGRECNO ==	0000130
replace cntycode =  	7000	if LOGRECNO ==	0000131
replace cntycode =  	7100	if LOGRECNO ==	0000132
replace cntycode =  	7200	if LOGRECNO ==	0000133
replace cntycode =  	7300	if LOGRECNO ==	0000134
replace cntycode =  	7350	if LOGRECNO ==	0000135
replace cntycode =  	7400	if LOGRECNO ==	0000136
replace cntycode =  	7500	if LOGRECNO ==	0000137
replace cntycode =  	7600	if LOGRECNO ==	0000138
replace cntycode =  	7700	if LOGRECNO ==	0000139
replace cntycode =  	7750	if LOGRECNO ==	0000140
replace cntycode =  	7900	if LOGRECNO ==	0000141
replace cntycode =  	8000	if LOGRECNO ==	0000142
replace cntycode =  	8100	if LOGRECNO ==	0000143
replace cntycode =  	8200	if LOGRECNO ==	0000144
replace cntycode =  	8300	if LOGRECNO ==	0000145
replace cntycode =  	8400	if LOGRECNO ==	0000146

gen statfips = 51
gen staticpsr = 40

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save VA_FBPop_2010.dta, replace

clear

