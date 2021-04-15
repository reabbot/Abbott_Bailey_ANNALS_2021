/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in Louisiana by county, and creates a small data file
with counties (nonclustered) as cases and the following variables:
1) String variable with county name
2) String variable with "Mississippi" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cnticpsr)
4) Unique identifier (geocode)
5) N votes for Donald Trump in each county
6) N total votes cast in each county

I downloaded a .pdf file from the Mississippi election commission, and entered
county names, with the numbers for Trump votes and for total votes into an 
.xlsx file. Note that counties are cases.
*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections

import excel using MS_2016_Primary.xlsx, first

destring NTrump NVotes, replace
la var NTrump "N Votes for Trump"
la var NVotes "Total votes cast"

gen State = "Mississippi"
gen sticpsr = 46
gen stfips = 28

gen cnticpsr = .

replace cnticpsr = 	10	 if County ==  	"Adams"
replace cnticpsr = 	30	 if County == 	"Alcorn"
replace cnticpsr = 	50	 if County == 	"Amite"
replace cnticpsr = 	70	 if County == 	"Attala"
replace cnticpsr = 	90	 if County == 	"Benton"
replace cnticpsr = 	110	 if County == 	"Bolivar"
replace cnticpsr = 	130	 if County == 	"Calhoun"
replace cnticpsr = 	150	 if County == 	"Carroll"
replace cnticpsr = 	170	 if County == 	"Chickasaw"
replace cnticpsr = 	190	 if County == 	"Choctaw"
replace cnticpsr = 	210	 if County == 	"Claiborne"
replace cnticpsr = 	230	 if County == 	"Clarke"
replace cnticpsr = 	250	 if County == 	"Clay"
replace cnticpsr = 	270	 if County == 	"Coahoma"
replace cnticpsr = 	290	 if County == 	"Copiah"
replace cnticpsr = 	310	 if County == 	"Covington"
replace cnticpsr = 	330	 if County == 	"DeSoto"
replace cnticpsr = 	350	 if County == 	"Forrest"
replace cnticpsr = 	370	 if County == 	"Franklin"
replace cnticpsr = 	390	 if County == 	"George"
replace cnticpsr = 	410	 if County == 	"Greene"
replace cnticpsr = 	430	 if County == 	"Grenada"
replace cnticpsr = 	450	 if County == 	"Hancock"
replace cnticpsr = 	470	 if County == 	"Harrison"
replace cnticpsr = 	490	 if County == 	"Hinds"
replace cnticpsr = 	510	 if County == 	"Holmes"
replace cnticpsr = 	530	 if County == 	"Humphreys"
replace cnticpsr = 	550	 if County == 	"Issaquena"
replace cnticpsr = 	570	 if County == 	"Itawamba"
replace cnticpsr = 	590	 if County == 	"Jackson"
replace cnticpsr = 	610	 if County == 	"Jasper"
replace cnticpsr = 	630	 if County == 	"Jefferson"
replace cnticpsr = 	650	 if County == 	"Jefferson_Davis"
replace cnticpsr = 	670	 if County == 	"Jones"
replace cnticpsr = 	690	 if County == 	"Kemper"
replace cnticpsr = 	710	 if County == 	"Lafayette"
replace cnticpsr = 	730	 if County == 	"Lamar"
replace cnticpsr = 	750	 if County == 	"Lauderdale"
replace cnticpsr = 	770	 if County == 	"Lawrence"
replace cnticpsr = 	790	 if County == 	"Leake"
replace cnticpsr = 	810	 if County == 	"Lee"
replace cnticpsr = 	830	 if County == 	"Leflore"
replace cnticpsr = 	850	 if County == 	"Lincoln"
replace cnticpsr = 	870	 if County == 	"Lowndes"
replace cnticpsr = 	890	 if County == 	"Madison"
replace cnticpsr = 	910	 if County == 	"Marion"
replace cnticpsr = 	930	 if County == 	"Marshall"
replace cnticpsr = 	950	 if County == 	"Monroe"
replace cnticpsr = 	970	 if County == 	"Montgomery"
replace cnticpsr = 	990	 if County == 	"Neshoba"
replace cnticpsr = 	1010	 if County == 	"Newton"
replace cnticpsr = 	1030	 if County == 	"Noxubee"
replace cnticpsr = 	1050	 if County == 	"Oktibbeha"
replace cnticpsr = 	1070	 if County == 	"Panola"
replace cnticpsr = 	1090	 if County == 	"Pearl_River"
replace cnticpsr = 	1110	 if County == 	"Perry"
replace cnticpsr = 	1130	 if County == 	"Pike"
replace cnticpsr = 	1150	 if County == 	"Pontotoc"
replace cnticpsr = 	1170	 if County == 	"Prentiss"
replace cnticpsr = 	1190	 if County == 	"Quitman"
replace cnticpsr = 	1210	 if County == 	"Rankin"
replace cnticpsr = 	1230	 if County == 	"Scott"
replace cnticpsr = 	1250	 if County == 	"Sharkey"
replace cnticpsr = 	1270	 if County == 	"Simpson"
replace cnticpsr = 	1290	 if County == 	"Smith"
replace cnticpsr = 	1310	 if County == 	"Stone"
replace cnticpsr = 	1330	 if County == 	"Sunflower"
replace cnticpsr = 	1350	 if County == 	"Tallahatchie"
replace cnticpsr = 	1370	 if County == 	"Tate"
replace cnticpsr = 	1390	 if County == 	"Tippah"
replace cnticpsr = 	1410	 if County == 	"Tishomingo"
replace cnticpsr = 	1430	 if County == 	"Tunica"
replace cnticpsr = 	1450	 if County == 	"Union"
replace cnticpsr = 	1470	 if County == 	"Walthall"
replace cnticpsr = 	1490	 if County == 	"Warren"
replace cnticpsr = 	1510	 if County == 	"Washington"
replace cnticpsr = 	1530	 if County == 	"Wayne"
replace cnticpsr = 	1550	 if County == 	"Webster"
replace cnticpsr = 	1570	 if County == 	"Wilkinson"
replace cnticpsr = 	1590	 if County == 	"Winston"
replace cnticpsr = 	1610	 if County == 	"Yalobusha"
replace cnticpsr = 	1630	 if County == 	"Yazoo"

gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr

save MS_2016_Primary, replace

clear

