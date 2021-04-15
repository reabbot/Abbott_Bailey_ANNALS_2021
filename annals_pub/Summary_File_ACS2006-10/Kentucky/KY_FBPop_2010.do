clear all

/* This file begun July 2020 by AKB. It is designed to read in ACS 5 year
estimates so we can identify foreign-born population by county using the
2006 - 2010 data. Note that we also have to create the unique geographic ID
variables here. The current file uses data for Alabama. There is a separate 
.do file for each state, which creates a distinct .dta file. These then will be
appended together to create a large file. */

import delimited e20105ky0005001.txt

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
egen OK = anymatch (LOGRECNO), values (13/132)
	 
keep if OK

/* deletes 2789 records; 67 retained */

gen County = ""		


replace County = 	"Adair"	 if LOGRECNO == 	0000013
replace County = 	"Allen"	 if LOGRECNO == 	0000014
replace County = 	"Anderson"	 if LOGRECNO == 	0000015
replace County = 	"Ballard"	 if LOGRECNO == 	0000016
replace County = 	"Barren"	 if LOGRECNO == 	0000017
replace County = 	"Bath"	 if LOGRECNO == 	0000018
replace County = 	"Bell"	 if LOGRECNO == 	0000019
replace County = 	"Boone"	 if LOGRECNO == 	0000020
replace County = 	"Bourbon"	 if LOGRECNO == 	0000021
replace County = 	"Boyd"	 if LOGRECNO == 	0000022
replace County = 	"Boyle"	 if LOGRECNO == 	0000023
replace County = 	"Bracken"	 if LOGRECNO == 	0000024
replace County = 	"Breathitt"	 if LOGRECNO == 	0000025
replace County = 	"Breckinridge"	 if LOGRECNO == 	0000026
replace County = 	"Bullitt"	 if LOGRECNO == 	0000027
replace County = 	"Butler"	 if LOGRECNO == 	0000028
replace County = 	"Caldwell"	 if LOGRECNO == 	0000029
replace County = 	"Calloway"	 if LOGRECNO == 	0000030
replace County = 	"Campbell"	 if LOGRECNO == 	0000031
replace County = 	"Carlisle"	 if LOGRECNO == 	0000032
replace County = 	"Carroll"	 if LOGRECNO == 	0000033
replace County = 	"Carter"	 if LOGRECNO == 	0000034
replace County = 	"Casey"	 if LOGRECNO == 	0000035
replace County = 	"Christian"	 if LOGRECNO == 	0000036
replace County = 	"Clark"	 if LOGRECNO == 	0000037
replace County = 	"Clay"	 if LOGRECNO == 	0000038
replace County = 	"Clinton"	 if LOGRECNO == 	0000039
replace County = 	"Crittenden"	 if LOGRECNO == 	0000040
replace County = 	"Cumberland"	 if LOGRECNO == 	0000041
replace County = 	"Daviess"	 if LOGRECNO == 	0000042
replace County = 	"Edmonson"	 if LOGRECNO == 	0000043
replace County = 	"Elliott"	 if LOGRECNO == 	0000044
replace County = 	"Estill"	 if LOGRECNO == 	0000045
replace County = 	"Fayette"	 if LOGRECNO == 	0000046
replace County = 	"Fleming"	 if LOGRECNO == 	0000047
replace County = 	"Floyd"	 if LOGRECNO == 	0000048
replace County = 	"Franklin"	 if LOGRECNO == 	0000049
replace County = 	"Fulton"	 if LOGRECNO == 	0000050
replace County = 	"Gallatin"	 if LOGRECNO == 	0000051
replace County = 	"Garrard"	 if LOGRECNO == 	0000052
replace County = 	"Grant"	 if LOGRECNO == 	0000053
replace County = 	"Graves"	 if LOGRECNO == 	0000054
replace County = 	"Grayson"	 if LOGRECNO == 	0000055
replace County = 	"Green"	 if LOGRECNO == 	0000056
replace County = 	"Greenup"	 if LOGRECNO == 	0000057
replace County = 	"Hancock"	 if LOGRECNO == 	0000058
replace County = 	"Hardin"	 if LOGRECNO == 	0000059
replace County = 	"Harlan"	 if LOGRECNO == 	0000060
replace County = 	"Harrison"	 if LOGRECNO == 	0000061
replace County = 	"Hart"	 if LOGRECNO == 	0000062
replace County = 	"Henderson"	 if LOGRECNO == 	0000063
replace County = 	"Henry"	 if LOGRECNO == 	0000064
replace County = 	"Hickman"	 if LOGRECNO == 	0000065
replace County = 	"Hopkins"	 if LOGRECNO == 	0000066
replace County = 	"Jackson"	 if LOGRECNO == 	0000067
replace County = 	"Jefferson"	 if LOGRECNO == 	0000068
replace County = 	"Jessamine"	 if LOGRECNO == 	0000069
replace County = 	"Johnson"	 if LOGRECNO == 	0000070
replace County = 	"Kenton"	 if LOGRECNO == 	0000071
replace County = 	"Knott"	 if LOGRECNO == 	0000072
replace County = 	"Knox"	 if LOGRECNO == 	0000073
replace County = 	"Larue"	 if LOGRECNO == 	0000074
replace County = 	"Laurel"	 if LOGRECNO == 	0000075
replace County = 	"Lawrence"	 if LOGRECNO == 	0000076
replace County = 	"Lee"	 if LOGRECNO == 	0000077
replace County = 	"Leslie"	 if LOGRECNO == 	0000078
replace County = 	"Letcher"	 if LOGRECNO == 	0000079
replace County = 	"Lewis"	 if LOGRECNO == 	0000080
replace County = 	"Lincoln"	 if LOGRECNO == 	0000081
replace County = 	"Livingston"	 if LOGRECNO == 	0000082
replace County = 	"Logan"	 if LOGRECNO == 	0000083
replace County = 	"Lyon"	 if LOGRECNO == 	0000084
replace County = 	"McCracken"	 if LOGRECNO == 	0000085
replace County = 	"McCreary"	 if LOGRECNO == 	0000086
replace County = 	"McLean"	 if LOGRECNO == 	0000087
replace County = 	"Madison"	 if LOGRECNO == 	0000088
replace County = 	"Magoffin"	 if LOGRECNO == 	0000089
replace County = 	"Marion"	 if LOGRECNO == 	0000090
replace County = 	"Marshall"	 if LOGRECNO == 	0000091
replace County = 	"Martin"	 if LOGRECNO == 	0000092
replace County = 	"Mason" if LOGRECNO == 	0000093
replace County = 	"Meade"	 if LOGRECNO == 	0000094
replace County = 	"Menifee"	 if LOGRECNO == 	0000095
replace County = 	"Mercer"	 if LOGRECNO == 	0000096
replace County = 	"Metcalfe"	 if LOGRECNO == 	0000097
replace County = 	"Monroe"	 if LOGRECNO == 	0000098
replace County = 	"Montgomery"	 if LOGRECNO == 	0000099
replace County = 	"Morgan"	 if LOGRECNO == 	0000100
replace County = 	"Muhlenberg"	 if LOGRECNO == 	0000101
replace County = 	"Nelson"	 if LOGRECNO == 	0000102
replace County = 	"Nicholas"	 if LOGRECNO == 	0000103
replace County = 	"Ohio"	 if LOGRECNO == 	0000104
replace County = 	"Oldham"	 if LOGRECNO == 	0000105
replace County = 	"Owen"	 if LOGRECNO == 	0000106
replace County = 	"Owsley"	 if LOGRECNO == 	0000107
replace County = 	"Pendleton"	 if LOGRECNO == 	0000108
replace County = 	"Perry"	 if LOGRECNO == 	0000109
replace County = 	"Pike"	 if LOGRECNO == 	0000110
replace County = 	"Powell"	 if LOGRECNO == 	0000111
replace County = 	"Pulaski"	 if LOGRECNO == 	0000112
replace County = 	"Robertson"	 if LOGRECNO == 	0000113
replace County = 	"Rockcastle"	 if LOGRECNO == 	0000114
replace County = 	"Rowan"	 if LOGRECNO == 	0000115
replace County = 	"Russell"	 if LOGRECNO == 	0000116
replace County = 	"Scott"	 if LOGRECNO == 	0000117
replace County = 	"Shelby"	 if LOGRECNO == 	0000118
replace County = 	"Simpson"	 if LOGRECNO == 	0000119
replace County = 	"Spencer"	 if LOGRECNO == 	0000120
replace County = 	"Taylor"	 if LOGRECNO == 	0000121
replace County = 	"Todd"	 if LOGRECNO == 	0000122
replace County = 	"Trigg"	 if LOGRECNO == 	0000123
replace County = 	"Trimble"	 if LOGRECNO == 	0000124
replace County = 	"Union"	 if LOGRECNO == 	0000125
replace County = 	"Warren"	 if LOGRECNO == 	0000126
replace County = 	"Washington"	 if LOGRECNO == 	0000127
replace County = 	"Wayne"	 if LOGRECNO == 	0000128
replace County = 	"Webster"	 if LOGRECNO == 	0000129
replace County = 	"Whitley"	 if LOGRECNO == 	0000130
replace County = 	"Wolfe"	 if LOGRECNO == 	0000131
replace County = 	"Woodford"	 if LOGRECNO == 	0000132




gen cntycode = .	

replace cntycode =	10	if County == 	"Adair"
replace cntycode =	30	if County == 	"Allen"
replace cntycode =	50	if County == 	"Anderson"
replace cntycode =	70	if County == 	"Ballard"
replace cntycode =	90	if County == 	"Barren" 
replace cntycode =	110	if County == 	"Bath"
replace cntycode =	130	if County == 	"Bell"
replace cntycode =	150	if County == 	"Boone"
replace cntycode =	170	if County == 	"Bourbon"
replace cntycode =	190	if County == 	"Boyd"
replace cntycode =	210	if County == 	"Boyle"
replace cntycode =	230	if County == 	"Bracken"
replace cntycode =	250	if County == 	"Breathitt"
replace cntycode =	270	if County == 	"Breckinridge"
replace cntycode =	290	if County == 	"Bullitt"
replace cntycode =	310	if County == 	"Butler"
replace cntycode =	330	if County == 	"Caldwell"
replace cntycode =	350	if County == 	"Calloway"
replace cntycode =	370	if County == 	"Campbell"
replace cntycode =	390	if County == 	"Carlisle"
replace cntycode =	410	if County == 	"Carroll"
replace cntycode =	430	if County == 	"Carter"
replace cntycode =	450	if County == 	"Casey"
replace cntycode =	470	if County == 	"Christian"
replace cntycode =	490	if County == 	"Clark"
replace cntycode =	510	if County == 	"Clay"
replace cntycode =	530	if County == 	"Clinton"
replace cntycode =	550	if County == 	"Crittenden"
replace cntycode =	570	if County == 	"Cumberland"
replace cntycode =	590	if County == 	"Daviess"
replace cntycode =	610	if County == 	"Edmonson"
replace cntycode =	630	if County == 	"Elliott"
replace cntycode =	650	if County == 	"Estill"
replace cntycode =	670	if County == 	"Fayette"
replace cntycode =	690	if County == 	"Fleming"
replace cntycode =	710	if County == 	"Floyd"
replace cntycode =	730	if County == 	"Franklin"
replace cntycode =	750	if County == 	"Fulton"
replace cntycode =	770	if County == 	"Gallatin"
replace cntycode =	790	if County == 	"Garrard"
replace cntycode =	810	if County == 	"Grant"
replace cntycode =	830	if County == 	"Graves"
replace cntycode =	850	if County == 	"Grayson"
replace cntycode =	870	if County == 	"Green"
replace cntycode =	890	if County == 	"Greenup"
replace cntycode =	910	if County == 	"Hancock"
replace cntycode =	930	if County == 	"Hardin"
replace cntycode =	950	if County == 	"Harlan"
replace cntycode =	970	if County == 	"Harrison"
replace cntycode =	990	if County == 	"Hart"
replace cntycode =	1010	if County == "Henderson"
replace cntycode =	1030	if County == "Henry"
replace cntycode =	1050	if County == 	"Hickman"
replace cntycode =	1070	if County == 	"Hopkins"
replace cntycode =	1090	if County == 	"Jackson"
replace cntycode =	1110	if County == 	"Jefferson"
replace cntycode =	1130	if County == 	"Jessamine"
replace cntycode =	1150	if County == 	"Johnson"
replace cntycode =	1170	if County == 	"Kenton"
replace cntycode =	1190	if County == 	"Knott"
replace cntycode =	1210	if County == 	"Knox"
replace cntycode =	1230	if County == 	"Larue"
replace cntycode =	1250	if County == 	"Laurel"
replace cntycode =	1270	if County == 	"Lawrence"
replace cntycode =	1290	if County == 	"Lee"
replace cntycode =	1310	if County == 	"Leslie"
replace cntycode =	1330	if County == 	"Letcher"
replace cntycode =	1350	if County == 	"Lewis"
replace cntycode =	1370	if County == 	"Lincoln"
replace cntycode =	1390	if County == 	"Livingston"
replace cntycode =	1410	if County == 	"Logan"
replace cntycode =	1430	if County == 	"Lyon"
replace cntycode =	1450	if County == 	"McCracken"
replace cntycode =	1470	if County == 	"McCreary"
replace cntycode =	1490	if County == 	"McLean"
replace cntycode =	1510	if County == 	"Madison"
replace cntycode =	1530	if County == 	"Magoffin"
replace cntycode =	1550	if County == 	"Marion"
replace cntycode =	1570	if County == 	"Marshall"
replace cntycode =	1590	if County == 	"Martin"
replace cntycode =	1610	if County == 	"Mason"
replace cntycode =	1630	if County == 	"Meade"
replace cntycode =	1650	if County == 	"Menifee"
replace cntycode =	1670	if County == 	"Mercer"
replace cntycode =	1690	if County == 	"Metcalfe"
replace cntycode =	1710	if County == 	"Monroe"
replace cntycode =	1730	if County == 	"Montgomery"
replace cntycode =	1750	if County == 	"Morgan"
replace cntycode =	1770	if County == 	"Muhlenberg"
replace cntycode =	1790	if County == 	"Nelson"
replace cntycode =	1810	if County == 	"Nicholas"
replace cntycode =	1830	if County == 	"Ohio"
replace cntycode =	1850	if County == 	"Oldham"
replace cntycode =	1870	if County == 	"Owen"
replace cntycode =	1890	if County == 	"Owsley"
replace cntycode =	1910	if County == 	"Pendleton"
replace cntycode =	1930	if County == 	"Perry"
replace cntycode =	1950	if County == 	"Pike"
replace cntycode =	1970	if County == 	"Powell"
replace cntycode =	1990	if County == 	"Pulaski"
replace cntycode =	2010	if County == 	"Robertson"
replace cntycode =	2030	if County == 	"Rockcastle"
replace cntycode =	2050	if County == 	"Rowan"
replace cntycode =	2070	if County == 	"Russell"
replace cntycode =	2090	if County == 	"Scott"
replace cntycode =	2110	if County == 	"Shelby"
replace cntycode =	2130	if County == 	"Simpson"
replace cntycode =	2150	if County == 	"Spencer"
replace cntycode =	2170	if County == 	"Taylor"
replace cntycode =	2190	if County == 	"Todd"
replace cntycode =	2210	if County == 	"Trigg"
replace cntycode =	2230	if County == 	"Trimble"
replace cntycode =	2250	if County == 	"Union"
replace cntycode =	2270	if County == 	"Warren"
replace cntycode =	2290	if County == 	"Washington"
replace cntycode =	2310	if County == 	"Wayne"
replace cntycode =	2330	if County == 	"Webster"
replace cntycode =	2350	if County == 	"Whitley"
replace cntycode =	2370	if County == 	"Wolfe"
replace cntycode =	2390	if County == 	"Woodford"


gen statfips = 21
gen staticpsr = 51

gen uniqfips = (statfips * 10000) + cntycode
gen uniqicpsr = (staticpsr * 10000) + cntycode


save KY_FBPop_2010.dta, replace

clear



