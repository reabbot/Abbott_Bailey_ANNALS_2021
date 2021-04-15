/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in South Carolina by county, and creates a small 
data file with counties (nonclustered) as cases and the following variables:
1) String variable with county name
2) String variable with "Tennessee" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cnticpsr)
4) Unique identifier (geocode)
5) N votes for Donald Trump in each county
6) N total votes cast in each county

The contents of the Excel spreadsheet (.xls format) were downloaded from the 
Georgia elections commission website and converted into .xlsx format. 
*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections

import excel using TN_2016_Primary.xlsx, first

keep County NTrump NVotes

destring NTrump NVotes, replace
la var NTrump "N Votes for Trump"
la var NVotes "Total votes cast"

gen State = "Tennessee"
gen sticpsr = 54
gen stfips  = 47

gen cnticpsr = .

replace cnticpsr = 	10	 if County == 	"Anderson"
replace cnticpsr = 	30	 if County == 	"Bedford"
replace cnticpsr = 	50	 if County == 	"Benton"
replace cnticpsr = 	70	 if County == 	"Bledsoe"
replace cnticpsr = 	90	 if County == 	"Blount"
replace cnticpsr = 	110	 if County == 	"Bradley"
replace cnticpsr = 	130	 if County == 	"Campbell"
replace cnticpsr = 	150	 if County == 	"Cannon"
replace cnticpsr = 	170	 if County == 	"Carroll"
replace cnticpsr = 	190	 if County == 	"Cartier"
replace cnticpsr = 	210	 if County == 	"Cheatham"
replace cnticpsr = 	230	 if County == 	"Chester"
replace cnticpsr = 	250	 if County == 	"Claiborne"
replace cnticpsr = 	270	 if County == 	"Clay"
replace cnticpsr = 	290	 if County == 	"Cocke"
replace cnticpsr = 	310	 if County == 	"Coffee"
replace cnticpsr = 	330	 if County == 	"Crockett"
replace cnticpsr = 	350	 if County == 	"Cumberland"
replace cnticpsr = 	370	 if County == 	"Davidson"
replace cnticpsr = 	390	 if County == 	"Decatur"
replace cnticpsr = 	410	 if County == 	"DeKalb"
replace cnticpsr = 	430	 if County == 	"Dickson"
replace cnticpsr = 	450	 if County == 	"Dyer"
replace cnticpsr = 	470	 if County == 	"Fayette"
replace cnticpsr = 	490	 if County == 	"Fentress"
replace cnticpsr = 	510	 if County == 	"Franklin"
replace cnticpsr = 	530	 if County == 	"Gibson"
replace cnticpsr = 	550	 if County == 	"Giles"
replace cnticpsr = 	570	 if County == 	"Grainger"
replace cnticpsr = 	590	 if County == 	"Greene"
replace cnticpsr = 	610	 if County == 	"Grundy"
replace cnticpsr = 	630	 if County == 	"Hamblen"
replace cnticpsr = 	650	 if County == 	"Hamilton"
replace cnticpsr = 	670	 if County == 	"Hancock"
replace cnticpsr = 	690	 if County == 	"Hardeman"
replace cnticpsr = 	710	 if County == 	"Hardin"
replace cnticpsr = 	730	 if County == 	"Hawkins"
replace cnticpsr = 	750	 if County == 	"Haywood"
replace cnticpsr = 	770	 if County == 	"Henderson"
replace cnticpsr = 	790	 if County == 	"Henry"
replace cnticpsr = 	810	 if County == 	"Hickman"
replace cnticpsr = 	830	 if County == 	"Houston"
replace cnticpsr = 	850	 if County == 	"Humphreys"
replace cnticpsr = 	870	 if County == 	"Jackson"
replace cnticpsr = 	875	 if County == 	"James" /* County disbanded in 1919 */
replace cnticpsr = 	890	 if County == 	"Jefferson"
replace cnticpsr = 	910	 if County == 	"Johnson"
replace cnticpsr = 	930	 if County == 	"Knox"
replace cnticpsr = 	950	 if County == 	"Lake"
replace cnticpsr = 	970	 if County == 	"Lauderdale"
replace cnticpsr = 	990	 if County == 	"Lawrence"
replace cnticpsr = 	1010	 if County == 	"Lewis"
replace cnticpsr = 	1030	 if County == 	"Lincoln"
replace cnticpsr = 	1050	 if County == 	"Loudon"
replace cnticpsr = 	1070	 if County == 	"McMinn"
replace cnticpsr = 	1090	 if County == 	"McNairy"
replace cnticpsr = 	1110	 if County == 	"Macon"
replace cnticpsr = 	1130	 if County == 	"Madison"
replace cnticpsr = 	1150	 if County == 	"Marion"
replace cnticpsr = 	1170	 if County == 	"Marshall"
replace cnticpsr = 	1190	 if County == 	"Maury"
replace cnticpsr = 	1210	 if County == 	"Meigs"
replace cnticpsr = 	1230	 if County == 	"Monroe"
replace cnticpsr = 	1250	 if County == 	"Montgomery"
replace cnticpsr = 	1270	 if County == 	"Moore"
replace cnticpsr = 	1290	 if County == 	"Morgan"
replace cnticpsr = 	1310	 if County == 	"Obion"
replace cnticpsr = 	1330	 if County == 	"Overton"
replace cnticpsr = 	1350	 if County == 	"Perry"
replace cnticpsr = 	1370	 if County == 	"Pickett"
replace cnticpsr = 	1390	 if County == 	"Polk"
replace cnticpsr = 	1410	 if County == 	"Putnam"
replace cnticpsr = 	1430	 if County == 	"Rhea"
replace cnticpsr = 	1450	 if County == 	"Roane"
replace cnticpsr = 	1470	 if County == 	"Robertson"
replace cnticpsr = 	1490	 if County == 	"Rutherford"
replace cnticpsr = 	1510	 if County == 	"Scott"
replace cnticpsr = 	1530	 if County == 	"Sequatchie"
replace cnticpsr = 	1550	 if County == 	"Sevier"
replace cnticpsr = 	1570	 if County == 	"Shelby"
replace cnticpsr = 	1590	 if County == 	"Smith"
replace cnticpsr = 	1610	 if County == 	"Stewart"
replace cnticpsr = 	1630	 if County == 	"Sullivan"
replace cnticpsr = 	1650	 if County == 	"Sumner"
replace cnticpsr = 	1670	 if County == 	"Tipton"
replace cnticpsr = 	1690	 if County == 	"Trousdale"
replace cnticpsr = 	1710	 if County == 	"Unicoi"
replace cnticpsr = 	1730	 if County == 	"Union"
replace cnticpsr = 	1750	 if County == 	"Van_Buren"
replace cnticpsr = 	1770	 if County == 	"Warren"
replace cnticpsr = 	1790	 if County == 	"Washington"
replace cnticpsr = 	1810	 if County == 	"Wayne"
replace cnticpsr = 	1830	 if County == 	"Weakley"
replace cnticpsr = 	1850	 if County == 	"White"
replace cnticpsr = 	1870	 if County == 	"Williamson"
replace cnticpsr = 	1890	 if County == 	"Wilson"

gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr

save TN_2016_Primary, replace

clear




