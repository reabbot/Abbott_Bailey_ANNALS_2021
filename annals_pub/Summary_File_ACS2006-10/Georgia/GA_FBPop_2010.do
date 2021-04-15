/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Georgia. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105ga0005001.txt

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
	 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 ///
	 161 162 163 164 165 166 167 168 169 170 171 )
	 
keep if OK
/* We lose 4047 observations. There are 159 remaining. */

gen County = ""
replace County = 	"Appling"	if LOGRECNO == 	0000013
replace County = 	"Atkinson"	if LOGRECNO == 	0000014
replace County = 	"Bacon"	if LOGRECNO == 	0000015
replace County = 	"Baker"	if LOGRECNO == 	0000016
replace County = 	"Baldwin"	if LOGRECNO == 	0000017
replace County = 	"Banks"	if LOGRECNO == 	0000018
replace County = 	"Barrow"	if LOGRECNO == 	0000019
replace County = 	"Bartow"	if LOGRECNO == 	0000020
replace County = 	"Ben Hill"	if LOGRECNO == 	0000021
replace County = 	"Berrien"	if LOGRECNO == 	0000022
replace County = 	"Bibb"	if LOGRECNO == 	0000023
replace County = 	"Bleckley"	if LOGRECNO == 	0000024
replace County = 	"Brantley"	if LOGRECNO == 	0000025
replace County = 	"Brooks"	if LOGRECNO == 	0000026
replace County = 	"Bryan"	if LOGRECNO == 	0000027
replace County = 	"Bulloch"	if LOGRECNO == 	0000028
replace County = 	"Burke"	if LOGRECNO == 	0000029
replace County = 	"Butts"	if LOGRECNO == 	0000030
replace County = 	"Calhoun"	if LOGRECNO == 	0000031
replace County = 	"Camden"	if LOGRECNO == 	0000032
replace County = 	"Candler"	if LOGRECNO == 	0000033
replace County = 	"Carroll"	if LOGRECNO == 	0000034
replace County = 	"Catoosa"	if LOGRECNO == 	0000035
replace County = 	"Charlton"	if LOGRECNO == 	0000036
replace County = 	"Chatham"	if LOGRECNO == 	0000037
replace County = 	"Chattahoochee"	if LOGRECNO == 	0000038
replace County = 	"Chattooga"	if LOGRECNO == 	0000039
replace County = 	"Cherokee"	if LOGRECNO == 	0000040
replace County = 	"Clarke"	if LOGRECNO == 	0000041
replace County = 	"Clay"	if LOGRECNO == 	0000042
replace County = 	"Clayton"	if LOGRECNO == 	0000043
replace County = 	"Clinch"	if LOGRECNO == 	0000044
replace County = 	"Cobb"	if LOGRECNO == 	0000045
replace County = 	"Coffee"	if LOGRECNO == 	0000046
replace County = 	"Colquitt"	if LOGRECNO == 	0000047
replace County = 	"Columbia"	if LOGRECNO == 	0000048
replace County = 	"Cook"	if LOGRECNO == 	0000049
replace County = 	"Coweta"	if LOGRECNO == 	0000050
replace County = 	"Crawford"	if LOGRECNO == 	0000051
replace County = 	"Crisp"	if LOGRECNO == 	0000052
replace County = 	"Dade"	if LOGRECNO == 	0000053
replace County = 	"Dawson"	if LOGRECNO == 	0000054
replace County = 	"Decatur"	if LOGRECNO == 	0000055
replace County = 	"DeKalb"	if LOGRECNO == 	0000056
replace County = 	"Dodge"	if LOGRECNO == 	0000057
replace County = 	"Dooly"	if LOGRECNO == 	0000058
replace County = 	"Dougherty"	if LOGRECNO == 	0000059
replace County = 	"Douglas"	if LOGRECNO == 	0000060
replace County = 	"Early"	if LOGRECNO == 	0000061
replace County = 	"Echols"	if LOGRECNO == 	0000062
replace County = 	"Effingham"	if LOGRECNO == 	0000063
replace County = 	"Elbert"	if LOGRECNO == 	0000064
replace County = 	"Emanuel"	if LOGRECNO == 	0000065
replace County = 	"Evans"	if LOGRECNO == 	0000066
replace County = 	"Fannin"	if LOGRECNO == 	0000067
replace County = 	"Fayette"	if LOGRECNO == 	0000068
replace County = 	"Floyd"	if LOGRECNO == 	0000069
replace County = 	"Forsyth"	if LOGRECNO == 	0000070
replace County = 	"Franklin"	if LOGRECNO == 	0000071
replace County = 	"Fulton"	if LOGRECNO == 	0000072
replace County = 	"Gilmer"	if LOGRECNO == 	0000073
replace County = 	"Glascock"	if LOGRECNO == 	0000074
replace County = 	"Glynn"	if LOGRECNO == 	0000075
replace County = 	"Gordon"	if LOGRECNO == 	0000076
replace County = 	"Grady"	if LOGRECNO == 	0000077
replace County = 	"Greene"	if LOGRECNO == 	0000078
replace County = 	"Gwinnett"	if LOGRECNO == 	0000079
replace County = 	"Habersham"	if LOGRECNO == 	0000080
replace County = 	"Hall"	if LOGRECNO == 	0000081
replace County = 	"Hancock"	if LOGRECNO == 	0000082
replace County = 	"Haralson"	if LOGRECNO == 	0000083
replace County = 	"Harris"	if LOGRECNO == 	0000084
replace County = 	"Hart"	if LOGRECNO == 	0000085
replace County = 	"Heard"	if LOGRECNO == 	0000086
replace County = 	"Henry"	if LOGRECNO == 	0000087
replace County = 	"Houston"	if LOGRECNO == 	0000088
replace County = 	"Irwin"	if LOGRECNO == 	0000089
replace County = 	"Jackson"	if LOGRECNO == 	0000090
replace County = 	"Jasper"	if LOGRECNO == 	0000091
replace County = 	"Jeff Davis"	if LOGRECNO == 	0000092
replace County = 	"Jefferson"	if LOGRECNO == 	0000093
replace County = 	"Jenkins"	if LOGRECNO == 	0000094
replace County = 	"Johnson"	if LOGRECNO == 	0000095
replace County = 	"Jones"	if LOGRECNO == 	0000096
replace County = 	"Lamar"	if LOGRECNO == 	0000097
replace County = 	"Lanier"	if LOGRECNO == 	0000098
replace County = 	"Laurens"	if LOGRECNO == 	0000099
replace County = 	"Lee"	if LOGRECNO == 	0000100
replace County = 	"Liberty"	if LOGRECNO == 	0000101
replace County = 	"Lincoln"	if LOGRECNO == 	0000102
replace County = 	"Long"	if LOGRECNO == 	0000103
replace County = 	"Lowndes"	if LOGRECNO == 	0000104
replace County = 	"Lumpkin"	if LOGRECNO == 	0000105
replace County = 	"McDuffie"	if LOGRECNO == 	0000106
replace County = 	"McIntosh"	if LOGRECNO == 	0000107
replace County = 	"Macon"	if LOGRECNO == 	0000108
replace County = 	"Madison"	if LOGRECNO == 	0000109
replace County = 	"Marion"	if LOGRECNO == 	0000110
replace County = 	"Meriwether"	if LOGRECNO == 	0000111
replace County = 	"Miller"	if LOGRECNO == 	0000112
replace County = 	"Mitchell"	if LOGRECNO == 	0000113
replace County = 	"Monroe"	if LOGRECNO == 	0000114
replace County = 	"Montgomery"	if LOGRECNO == 	0000115
replace County = 	"Morgan"	if LOGRECNO == 	0000116
replace County = 	"Murray"	if LOGRECNO == 	0000117
replace County = 	"Muscogee"	if LOGRECNO == 	0000118
replace County = 	"Newton"	if LOGRECNO == 	0000119
replace County = 	"Oconee"	if LOGRECNO == 	0000120
replace County = 	"Oglethorpe"	if LOGRECNO == 	0000121
replace County = 	"Paulding"	if LOGRECNO == 	0000122
replace County = 	"Peach"	if LOGRECNO == 	0000123
replace County = 	"Pickens"	if LOGRECNO == 	0000124
replace County = 	"Pierce"	if LOGRECNO == 	0000125
replace County = 	"Pike"	if LOGRECNO == 	0000126
replace County = 	"Polk"	if LOGRECNO == 	0000127
replace County = 	"Pulaski"	if LOGRECNO == 	0000128
replace County = 	"Putnam"	if LOGRECNO == 	0000129
replace County = 	"Quitman"	if LOGRECNO == 	0000130
replace County = 	"Rabun"	if LOGRECNO == 	0000131
replace County = 	"Randolph"	if LOGRECNO == 	0000132
replace County = 	"Richmond"	if LOGRECNO == 	0000133
replace County = 	"Rockdale"	if LOGRECNO == 	0000134
replace County = 	"Schley"	if LOGRECNO == 	0000135
replace County = 	"Screven"	if LOGRECNO == 	0000136
replace County = 	"Seminole"	if LOGRECNO == 	0000137
replace County = 	"Spalding"	if LOGRECNO == 	0000138
replace County = 	"Stephens"	if LOGRECNO == 	0000139
replace County = 	"Stewart"	if LOGRECNO == 	0000140
replace County = 	"Sumter"	if LOGRECNO == 	0000141
replace County = 	"Talbot"	if LOGRECNO == 	0000142
replace County = 	"Taliaferro"	if LOGRECNO == 	0000143
replace County = 	"Tattnall"	if LOGRECNO == 	0000144
replace County = 	"Taylor"	if LOGRECNO == 	0000145
replace County = 	"Telfair"	if LOGRECNO == 	0000146
replace County = 	"Terrell"	if LOGRECNO == 	0000147
replace County = 	"Thomas"	if LOGRECNO == 	0000148
replace County = 	"Tift"	if LOGRECNO == 	0000149
replace County = 	"Toombs"	if LOGRECNO == 	0000150
replace County = 	"Towns"	if LOGRECNO == 	0000151
replace County = 	"Treutlen"	if LOGRECNO == 	0000152
replace County = 	"Troup"	if LOGRECNO == 	0000153
replace County = 	"Turner"	if LOGRECNO == 	0000154
replace County = 	"Twiggs"	if LOGRECNO == 	0000155
replace County = 	"Union"	if LOGRECNO == 	0000156
replace County = 	"Upson"	if LOGRECNO == 	0000157
replace County = 	"Walker"	if LOGRECNO == 	0000158
replace County = 	"Walton"	if LOGRECNO == 	0000159
replace County = 	"Ware"	if LOGRECNO == 	0000160
replace County = 	"Warren"	if LOGRECNO == 	0000161
replace County = 	"Washington"	if LOGRECNO == 	0000162
replace County = 	"Wayne"	if LOGRECNO == 	0000163
replace County = 	"Webster"	if LOGRECNO == 	0000164
replace County = 	"Wheeler"	if LOGRECNO == 	0000165
replace County = 	"White"	if LOGRECNO == 	0000166
replace County = 	"Whitfield"	if LOGRECNO == 	0000167
replace County = 	"Wilcox"	if LOGRECNO == 	0000168
replace County = 	"Wilkes"	if LOGRECNO == 	0000169
replace County = 	"Wilkinson"	if LOGRECNO == 	0000170
replace County = 	"Worth"	if LOGRECNO == 	0000171

gen cntycode = .
replace cntycode = 	10	if County == 	"Appling"
replace cntycode = 	30	if County == 	"Atkinson"
replace cntycode = 	50	if County == 	"Bacon"
replace cntycode = 	70	if County == 	"Baker"
replace cntycode = 	90	if County == 	"Baldwin"
replace cntycode = 	110	if County == 	"Banks"
replace cntycode = 	130	if County == 	"Barrow"
replace cntycode = 	150	if County == 	"Bartow"
replace cntycode = 	170	if County == 	"Ben Hill"
replace cntycode = 	190	if County == 	"Berrien"
replace cntycode = 	210	if County == 	"Bibb"
replace cntycode = 	230	if County == 	"Bleckley"
replace cntycode = 	250	if County == 	"Brantley"	
replace cntycode = 	270	if County == 	"Brooks"
replace cntycode = 	290	if County == 	"Bryan"
replace cntycode = 	310	if County == 	"Bulloch"	
replace cntycode = 	330	if County == 	"Burke"
replace cntycode = 	350	if County == 	"Butts"
replace cntycode = 	370	if County == 	"Calhoun"	
replace cntycode = 	390	if County == 	"Camden"
replace cntycode = 	430	if County == 	"Candler"
replace cntycode = 	450	if County == 	"Carroll"	
replace cntycode = 	470	if County == 	"Catoosa"
replace cntycode = 	490	if County == 	"Charlton"
replace cntycode = 	510	if County == 	"Chatham"
replace cntycode = 	530	if County == 	"Chattahoochee"
replace cntycode = 	550	if County == 	"Chattooga"
replace cntycode = 	570	if County == 	"Cherokee"
replace cntycode = 	590	if County == 	"Clarke"
replace cntycode = 	610	if County == 	"Clay"
replace cntycode = 	630	if County == 	"Clayton"
replace cntycode = 	650	if County == 	"Clinch"
replace cntycode = 	670	if County == 	"Cobb"
replace cntycode = 	690	if County == 	"Coffee"
replace cntycode = 	710	if County == 	"Colquitt"
replace cntycode = 	730	if County == 	"Columbia"
replace cntycode = 	750	if County == 	"Cook"
replace cntycode = 	770	if County == 	"Coweta"
replace cntycode = 	790	if County == 	"Crawford"
replace cntycode = 	810	if County == 	"Crisp"
replace cntycode = 	830	if County == 	"Dade"
replace cntycode = 	850	if County == 	"Dawson"
replace cntycode = 	870	if County == 	"Decatur"
replace cntycode = 	890	if County == 	"DeKalb"
replace cntycode = 	910	if County == 	"Dodge"
replace cntycode = 	930	if County == 	"Dooly"
replace cntycode = 	950	if County == 	"Dougherty"
replace cntycode = 	970	if County == 	"Douglas"
replace cntycode = 	990	if County == 	"Early"
replace cntycode = 	1010	if County == 	"Echols"
replace cntycode = 	1030	if County == 	"Effingham"
replace cntycode = 	1050	if County == 	"Elbert"
replace cntycode = 	1070	if County == 	"Emanuel"
replace cntycode = 	1090	if County == 	"Evans"
replace cntycode = 	1110	if County == 	"Fannin"
replace cntycode = 	1130	if County == 	"Fayette"
replace cntycode = 	1150	if County == 	"Floyd"
replace cntycode = 	1170	if County == 	"Forsyth"
replace cntycode = 	1190	if County == 	"Franklin"
replace cntycode = 	1210	if County == 	"Fulton"
replace cntycode = 	1230	if County == 	"Gilmer"
replace cntycode = 	1250	if County == 	"Glascock"
replace cntycode = 	1270	if County == 	"Glynn"
replace cntycode = 	1290	if County == 	"Gordon"
replace cntycode = 	1310	if County == 	"Grady"
replace cntycode = 	1330	if County == 	"Greene"
replace cntycode = 	1350	if County == 	"Gwinnett"
replace cntycode = 	1370	if County == 	"Habersham"
replace cntycode = 	1390	if County == 	"Hall"
replace cntycode = 	1410	if County == 	"Hancock"
replace cntycode = 	1430	if County == 	"Haralson"
replace cntycode = 	1450	if County == 	"Harris"
replace cntycode = 	1470	if County == 	"Hart"
replace cntycode = 	1490	if County == 	"Heard"
replace cntycode = 	1510	if County == 	"Henry"
replace cntycode = 	1530	if County == 	"Houston"
replace cntycode = 	1550	if County == 	"Irwin"
replace cntycode = 	1570	if County == 	"Jackson"
replace cntycode = 	1590	if County == 	"Jasper"
replace cntycode = 	1610	if County == 	"Jeff Davis"
replace cntycode = 	1630	if County == 	"Jefferson"
replace cntycode = 	1650	if County == 	"Jenkins"
replace cntycode = 	1670	if County == 	"Johnson"
replace cntycode = 	1690	if County == 	"Jones"
replace cntycode = 	1710	if County == 	"Lamar"
replace cntycode = 	1730	if County == 	"Lanier"
replace cntycode = 	1750	if County == 	"Laurens"
replace cntycode = 	1770	if County == 	"Lee"
replace cntycode = 	1790	if County == 	"Liberty"
replace cntycode = 	1810	if County == 	"Lincoln"
replace cntycode = 	1830	if County == 	"Long"
replace cntycode = 	1850	if County == 	"Lowndes"
replace cntycode = 	1870	if County == 	"Lumpkin"
replace cntycode = 	1890	if County == 	"McDuffie"
replace cntycode = 	1910	if County == 	"McIntosh"
replace cntycode = 	1930	if County == 	"Macon"
replace cntycode = 	1950	if County == 	"Madison"
replace cntycode = 	1970	if County == 	"Marion"
replace cntycode = 	1990	if County == 	"Meriwether"
replace cntycode = 	2010	if County == 	"Miller"
replace cntycode = 	2050	if County == 	"Mitchell"
replace cntycode = 	2070	if County == 	"Monroe"
replace cntycode = 	2090	if County == 	"Montgomery"
replace cntycode = 	2110	if County == 	"Morgan"
replace cntycode = 	2130	if County == 	"Murray"
replace cntycode = 	2150	if County == 	"Muscogee"
replace cntycode = 	2170	if County == 	"Newton"
replace cntycode = 	2190	if County == 	"Oconee"
replace cntycode = 	2210	if County == 	"Oglethorpe"
replace cntycode = 	2230	if County == 	"Paulding"
replace cntycode = 	2250	if County == 	"Peach"
replace cntycode = 	2270	if County == 	"Pickens"
replace cntycode = 	2290	if County == 	"Pierce"
replace cntycode = 	2310	if County == 	"Pike"
replace cntycode = 	2330	if County == 	"Polk"
replace cntycode = 	2350	if County == 	"Pulaski"
replace cntycode = 	2370	if County == 	"Putnam"
replace cntycode = 	2390	if County == 	"Quitman"
replace cntycode = 	2410	if County == 	"Rabun"
replace cntycode = 	2430	if County == 	"Randolph"
replace cntycode = 	2450	if County == 	"Richmond"
replace cntycode = 	2470	if County == 	"Rockdale"
replace cntycode = 	2490	if County == 	"Schley"
replace cntycode = 	2510	if County == 	"Screven"
replace cntycode = 	2530	if County == 	"Seminole"
replace cntycode = 	2550	if County == 	"Spalding"
replace cntycode = 	2570	if County == 	"Stephens"
replace cntycode = 	2590	if County == 	"Stewart"
replace cntycode = 	2610	if County == 	"Sumter"
replace cntycode = 	2630	if County == 	"Talbot"
replace cntycode = 	2650	if County == 	"Taliaferro"
replace cntycode = 	2670	if County == 	"Tattnall"
replace cntycode = 	2690	if County == 	"Taylor"
replace cntycode = 	2710	if County == 	"Telfair"
replace cntycode = 	2730	if County == 	"Terrell"
replace cntycode = 	2750	if County == 	"Thomas"
replace cntycode = 	2770	if County == 	"Tift"
replace cntycode = 	2790	if County == 	"Toombs"
replace cntycode = 	2810	if County == 	"Towns"
replace cntycode = 	2830	if County == 	"Treutlen"
replace cntycode = 	2850	if County == 	"Troup"
replace cntycode = 	2870	if County == 	"Turner"
replace cntycode = 	2890	if County == 	"Twiggs"
replace cntycode = 	2910	if County == 	"Union"
replace cntycode = 	2930	if County == 	"Upson"
replace cntycode = 	2950	if County == 	"Walker"
replace cntycode = 	2970	if County == 	"Walton"
replace cntycode = 	2990	if County == 	"Ware"
replace cntycode = 	3010	if County == 	"Warren"
replace cntycode = 	3030	if County == 	"Washington"
replace cntycode = 	3050	if County == 	"Wayne"
replace cntycode = 	3070	if County == 	"Webster"
replace cntycode = 	3090	if County == 	"Wheeler"
replace cntycode = 	3110	if County == 	"White"
replace cntycode = 	3130	if County == 	"Whitfield"
replace cntycode = 	3150	if County == 	"Wilcox"
replace cntycode = 	3170	if County == 	"Wilkes"
replace cntycode = 	3190	if County == 	"Wilkinson"
replace cntycode = 	3210	if County == 	"Worth"


gen statfips = 13
gen staticpsr = 44

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode

save GA_FBPop_2010.dta, replace

clear
