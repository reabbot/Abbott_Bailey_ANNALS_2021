/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in Louisiana by county, and creates a small data file
with counties (nonclustered) as cases and the following variables:
1) String variable with county name
2) String variable with "Louisiana" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cnticpsr)
4) Unique identifier (geocode)
5) N votes for Donald Trump in each county
6) N total votes cast in each county

The contents of the Excel spreadsheet (.xls format) were downloaded from the 
Louisiana elections commission website in .xlsx format. 
*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections

import excel using LA_2016_Primary.xlsx, ///
   sheet("Multi-Parish(Parish)") cellrange(A382:O445) 
   
gen NVotes = B + C + D + E + F + G + H + I + J + K + L + M + N + O

rename A County
rename O NTrump

destring NTrump NVotes, replace
la var NTrump "N Votes for Trump"
la var NVotes "Total votes cast"

keep County NTrump NVotes

gen State = "Louisiana"
gen sticpsr = 45
gen stfips = 22

gen cnticpsr = .
replace cnticpsr = 	10	if County == 	"Acadia"
replace cnticpsr = 	30	if County == 	"Allen"
replace cnticpsr = 	50	if County == 	"Ascension"
replace cnticpsr = 	70	if County == 	"Assumption"
replace cnticpsr = 	90	if County == 	"Avoyelles"
replace cnticpsr = 	110	if County == 	"Beauregard"
replace cnticpsr = 	130	if County == 	"Bienville"
replace cnticpsr = 	150	if County == 	"Bossier"
replace cnticpsr = 	170	if County == 	"Caddo"
replace cnticpsr = 	190	if County == 	"Calcasieu"
replace cnticpsr = 	210	if County == 	"Caldwell"
replace cnticpsr = 	230	 if County == 	"Cameron"
replace cnticpsr = 	250	 if County == 	"Catahoula"
replace cnticpsr = 	270	 if County == 	"Claiborne"
replace cnticpsr = 	290	 if County == 	"Concordia"
replace cnticpsr = 	310	 if County == 	"De Soto"
replace cnticpsr = 	330	 if County == 	"East Baton Rouge"
replace cnticpsr = 	350	 if County == 	"East Carroll"
replace cnticpsr = 	370	 if County == 	"East Feliciana"
replace cnticpsr = 	390	 if County == 	"Evangeline"
replace cnticpsr = 	410	 if County == 	"Franklin"
replace cnticpsr = 	430	 if County == 	"Grant"
replace cnticpsr = 	450	 if County == 	"Iberia"
replace cnticpsr = 	470	 if County == 	"Iberville"
replace cnticpsr = 	490	 if County == 	"Jackson"
replace cnticpsr = 	510	 if County == 	"Jefferson"
replace cnticpsr = 	530	 if County == 	"Jefferson Davis"
replace cnticpsr = 	550	 if County == 	"Lafayette"
replace cnticpsr = 	570	 if County == 	"Lafourche"
replace cnticpsr = 	590	 if County == 	"Lasalle"
replace cnticpsr = 	610	 if County == 	"Lincoln"
replace cnticpsr = 	630	 if County == 	"Livingston"
replace cnticpsr = 	650	 if County == 	"Madison"
replace cnticpsr = 	670	 if County == 	"Morehouse"
replace cnticpsr = 	690	 if County == 	"Natchitoches"
replace cnticpsr = 	710	 if County == 	"Orleans"
replace cnticpsr = 	730	 if County == 	"Ouachita"
replace cnticpsr = 	750	 if County == 	"Plaquemines"
replace cnticpsr = 	770	 if County == 	"Pointe Coupee"
replace cnticpsr = 	790	 if County == 	"Rapides"
replace cnticpsr = 	810	 if County == 	"Red River"
replace cnticpsr = 	830	 if County == 	"Richland"
replace cnticpsr = 	850	 if County == 	"Sabine"
replace cnticpsr = 	870	 if County == 	"St. Bernard"
replace cnticpsr = 	890	 if County == 	"St. Charles"
replace cnticpsr = 	910	 if County == 	"St. Helena"
replace cnticpsr = 	930	 if County == 	"St. James"
replace cnticpsr = 	950	 if County == 	"St. John The Baptist"
replace cnticpsr = 	970	 if County == 	"St. Landry"
replace cnticpsr = 	990	 if County == 	"St. Martin"
replace cnticpsr = 	1010	 if County == 	"St. Mary"
replace cnticpsr = 	1030	 if County == 	"St. Tammany"
replace cnticpsr = 	1050	 if County == 	"Tangipahoa"
replace cnticpsr = 	1070	 if County == 	"Tensas"
replace cnticpsr = 	1090	 if County == 	"Terrebonne"
replace cnticpsr = 	1110	 if County == 	"Union"
replace cnticpsr = 	1130	 if County == 	"Vermilion"
replace cnticpsr = 	1150	 if County == 	"Vernon"
replace cnticpsr = 	1170	 if County == 	"Washington"
replace cnticpsr = 	1190	 if County == 	"Webster"
replace cnticpsr = 	1210	 if County == 	"West Baton Rouge"
replace cnticpsr = 	1230	 if County == 	"West Carroll"
replace cnticpsr = 	1250	 if County == 	"West Feliciana"
replace cnticpsr = 	1270	 if County == 	"Winn"


gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr

save LA_2016_Primary, replace

clear


