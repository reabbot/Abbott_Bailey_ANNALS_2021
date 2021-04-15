/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in Georgia by county, and creates a small data file
with counties (nonclustered) as cases and the following variables:
1) String variable with county name
2) String variable with "Georgia" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cnticpsr)
4) Unique identifier (geocode)
5) N votes for Donald Trump in each county
6) N total votes cast in each county

The contents of the Excel spreadsheet (.xls format) were downloaded from the 
Georgia elections commission website and converted into .xlsx format. 
*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections

import excel using GA_2016_Primary.xlsx, ///
   sheet("2") cellrange(A4:BP162) 

keep A BO BP

rename A County
rename BO NTrump
rename BP NVotes

destring NTrump NVotes, replace
la var NTrump "N Votes for Trump"
la var NVotes "Total votes cast"

gen State = "Georgia"
gen sticpsr = 44
gen stfips = 13

gen cnticpsr = .
replace cnticpsr = 	10	if County == 	"Appling"
replace cnticpsr = 	30	if County == 	"Atkinson"
replace cnticpsr = 	50	if County == 	"Bacon"
replace cnticpsr = 	70	if County == 	"Baker"
replace cnticpsr = 	90	if County == 	"Baldwin"
replace cnticpsr = 	110	if County == 	"Banks"
replace cnticpsr = 	130	if County == 	"Barrow"
replace cnticpsr = 	150	if County == 	"Bartow"
replace cnticpsr = 	170	if County == 	"Ben Hill"
replace cnticpsr = 	190	if County == 	"Berrien"
replace cnticpsr = 	210	if County == 	"Bibb"
replace cnticpsr = 	230	if County == 	"Bleckley"
replace cnticpsr = 	250	if County == 	"Brantley"
replace cnticpsr = 	270	if County == 	"Brooks"
replace cnticpsr = 	290	if County == 	"Bryan"
replace cnticpsr = 	310	if County == 	"Bulloch"
replace cnticpsr = 	330	if County == 	"Burke"
replace cnticpsr = 	350	if County == 	"Butts"
replace cnticpsr = 	370	if County == 	"Calhoun"
replace cnticpsr = 	390	if County == 	"Camden"
replace cnticpsr = 	410	if County == 	"Campbell"
replace cnticpsr = 	430	if County == 	"Candler"
replace cnticpsr = 	450	if County == 	"Carroll"
replace cnticpsr = 	470	if County == 	"Catoosa"
replace cnticpsr = 	490	if County == 	"Charlton"
replace cnticpsr = 	510	if County == 	"Chatham"
replace cnticpsr = 	530	if County == 	"Chattahoochee"
replace cnticpsr = 	550	if County == 	"Chattooga"
replace cnticpsr = 	570	if County == 	"Cherokee"
replace cnticpsr = 	590	if County == 	"Clarke"
replace cnticpsr = 	610	if County == 	"Clay"
replace cnticpsr = 	630	if County == 	"Clayton"
replace cnticpsr = 	650	if County == 	"Clinch"
replace cnticpsr = 	670	if County == 	"Cobb"
replace cnticpsr = 	690	if County == 	"Coffee"
replace cnticpsr = 	710	if County == 	"Colquitt"
replace cnticpsr = 	730	if County == 	"Columbia"
replace cnticpsr = 	750	if County == 	"Cook"
replace cnticpsr = 	770	if County == 	"Coweta"
replace cnticpsr = 	790	if County == 	"Crawford"
replace cnticpsr = 	810	if County == 	"Crisp"
replace cnticpsr = 	830	if County == 	"Dade"
replace cnticpsr = 	850	if County == 	"Dawson"
replace cnticpsr = 	870	if County == 	"Decatur"
replace cnticpsr = 	890	if County == 	"DeKalb"
replace cnticpsr = 	910	if County == 	"Dodge"
replace cnticpsr = 	930	if County == 	"Dooly"
replace cnticpsr = 	950	if County == 	"Dougherty"
replace cnticpsr = 	970	if County == 	"Douglas"
replace cnticpsr = 	990	if County == 	"Early"
replace cnticpsr = 	1010	if County == 	"Echols"
replace cnticpsr = 	1030	if County == 	"Effingham"
replace cnticpsr = 	1050	if County == 	"Elbert"
replace cnticpsr = 	1070	if County == 	"Emanuel"
replace cnticpsr = 	1090	if County == 	"Evans"
replace cnticpsr = 	1110	if County == 	"Fannin"
replace cnticpsr = 	1130	if County == 	"Fayette"
replace cnticpsr = 	1150	if County == 	"Floyd"
replace cnticpsr = 	1170	if County == 	"Forsyth"
replace cnticpsr = 	1190	if County == 	"Franklin"
replace cnticpsr = 	1210	if County == 	"Fulton"
replace cnticpsr = 	1230	if County == 	"Gilmer"
replace cnticpsr = 	1250	if County == 	"Glascock"
replace cnticpsr = 	1270	if County == 	"Glynn"
replace cnticpsr = 	1290	if County == 	"Gordon"
replace cnticpsr = 	1310	if County == 	"Grady"
replace cnticpsr = 	1330	if County == 	"Greene"
replace cnticpsr = 	1350	if County == 	"Gwinnett"
replace cnticpsr = 	1370	if County == 	"Habersham"
replace cnticpsr = 	1390	if County == 	"Hall"
replace cnticpsr = 	1410	if County == 	"Hancock"
replace cnticpsr = 	1430	if County == 	"Haralson"
replace cnticpsr = 	1450	if County == 	"Harris"
replace cnticpsr = 	1470	if County == 	"Hart"
replace cnticpsr = 	1490	if County == 	"Heard"
replace cnticpsr = 	1510	if County == 	"Henry"
replace cnticpsr = 	1530	if County == 	"Houston"
replace cnticpsr = 	1550	if County == 	"Irwin"
replace cnticpsr = 	1570	if County == 	"Jackson"
replace cnticpsr = 	1590	if County == 	"Jasper"
replace cnticpsr = 	1610	if County == 	"Jeff Davis"
replace cnticpsr = 	1630	if County == 	"Jefferson"
replace cnticpsr = 	1650	if County == 	"Jenkins"
replace cnticpsr = 	1670	if County == 	"Johnson"
replace cnticpsr = 	1690	if County == 	"Jones"
replace cnticpsr = 	1710	if County == 	"Lamar"
replace cnticpsr = 	1730	if County == 	"Lanier"
replace cnticpsr = 	1750	if County == 	"Laurens"
replace cnticpsr = 	1770	if County == 	"Lee"
replace cnticpsr = 	1790	if County == 	"Liberty"
replace cnticpsr = 	1810	if County == 	"Lincoln"
replace cnticpsr = 	1830	if County == 	"Long"
replace cnticpsr = 	1850	if County == 	"Lowndes"
replace cnticpsr = 	1870	if County == 	"Lumpkin"
replace cnticpsr = 	1890	if County == 	"McDuffie"
replace cnticpsr = 	1910	if County == 	"McIntosh"
replace cnticpsr = 	1930	if County == 	"Macon"
replace cnticpsr = 	1950	if County == 	"Madison"
replace cnticpsr = 	1970	if County == 	"Marion"
replace cnticpsr = 	1990	if County == 	"Meriwether"
replace cnticpsr = 	2010	if County == 	"Miller"
replace cnticpsr = 	2030	if County == 	"Milton"
replace cnticpsr = 	2050	if County == 	"Mitchell"
replace cnticpsr = 	2070	if County == 	"Monroe"
replace cnticpsr = 	2090	if County == 	"Montgomery"
replace cnticpsr = 	2110	if County == 	"Morgan"
replace cnticpsr = 	2130	if County == 	"Murray"
replace cnticpsr = 	2150	if County == 	"Muscogee"
replace cnticpsr = 	2170	if County == 	"Newton"
replace cnticpsr = 	2190	if County == 	"Oconee"
replace cnticpsr = 	2210	if County == 	"Oglethorpe"
replace cnticpsr = 	2230	if County == 	"Paulding"
replace cnticpsr = 	2250	if County == 	"Peach"
replace cnticpsr = 	2270	if County == 	"Pickens"
replace cnticpsr = 	2290	if County == 	"Pierce"
replace cnticpsr = 	2310	if County == 	"Pike"
replace cnticpsr = 	2330	if County == 	"Polk"
replace cnticpsr = 	2350	if County == 	"Pulaski"
replace cnticpsr = 	2370	if County == 	"Putnam"
replace cnticpsr = 	2390	if County == 	"Quitman"
replace cnticpsr = 	2410	if County == 	"Rabun"
replace cnticpsr = 	2430	if County == 	"Randolph"
replace cnticpsr = 	2450	if County == 	"Richmond"
replace cnticpsr = 	2470	if County == 	"Rockdale"
replace cnticpsr = 	2490	if County == 	"Schley"
replace cnticpsr = 	2510	if County == 	"Screven"
replace cnticpsr = 	2530	if County == 	"Seminole"
replace cnticpsr = 	2550	if County == 	"Spalding"
replace cnticpsr = 	2570	if County == 	"Stephens"
replace cnticpsr = 	2590	if County == 	"Stewart"
replace cnticpsr = 	2610	if County == 	"Sumter"
replace cnticpsr = 	2630	if County == 	"Talbot"
replace cnticpsr = 	2650	if County == 	"Taliaferro"
replace cnticpsr = 	2670	if County == 	"Tattnall"
replace cnticpsr = 	2690	if County == 	"Taylor"
replace cnticpsr = 	2710	if County == 	"Telfair"
replace cnticpsr = 	2730	if County == 	"Terrell"
replace cnticpsr = 	2750	if County == 	"Thomas"
replace cnticpsr = 	2770	if County == 	"Tift"
replace cnticpsr = 	2790	if County == 	"Toombs"
replace cnticpsr = 	2810	if County == 	"Towns"
replace cnticpsr = 	2830	if County == 	"Treutlen"
replace cnticpsr = 	2850	if County == 	"Troup"
replace cnticpsr = 	2870	if County == 	"Turner"
replace cnticpsr = 	2890	if County == 	"Twiggs"
replace cnticpsr = 	2910	if County == 	"Union"
replace cnticpsr = 	2930	if County == 	"Upson"
replace cnticpsr = 	2950	if County == 	"Walker"
replace cnticpsr = 	2970	if County == 	"Walton"
replace cnticpsr = 	2990	if County == 	"Ware"
replace cnticpsr = 	3010	if County == 	"Warren"
replace cnticpsr = 	3030	if County == 	"Washington"
replace cnticpsr = 	3050	if County == 	"Wayne"
replace cnticpsr = 	3070	if County == 	"Webster"
replace cnticpsr = 	3090	if County == 	"Wheeler"
replace cnticpsr = 	3110	if County == 	"White"
replace cnticpsr = 	3130	if County == 	"Whitfield"
replace cnticpsr = 	3150	if County == 	"Wilcox"
replace cnticpsr = 	3170	if County == 	"Wilkes"
replace cnticpsr = 	3190	if County == 	"Wilkinson"
replace cnticpsr = 	3210	if County == 	"Worth"


gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr

save GA_2016_Primary, replace

clear
