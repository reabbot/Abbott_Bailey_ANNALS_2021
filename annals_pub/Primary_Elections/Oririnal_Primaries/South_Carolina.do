/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in South Carolina by county, and creates a small 
data file with counties (nonclustered) as cases and the following variables:
1) String variable with county name
2) String variable with "South Carolina" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cntycode)
4) Unique identifier (geocode)
5) N votes for Donald Trump in each county
6) N total votes cast in each county

The contents of the Excel spreadsheet (.xls format) were downloaded from the 
South Carolina elections commission website and converted into .xlsx format. 
*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections

import excel using SC_2016_Primary.xlsx, ///
   sheet("2") cellrange(A4:O49) 

keep A N O

rename A County
rename N NTrump
rename O NVotes

destring NTrump NVotes, replace
la var NTrump "N Votes for Trump"
la var NVotes "Total votes cast"

gen state = "South Carolina"
gen stcode = 48

gen cntycode = .

replace cntycode = 	10	if County == 	"Abbeville"
replace cntycode = 	30	if County == 	"Aiken"
replace cntycode = 	50	if County == 	"Allendale"
replace cntycode = 	70	if County == 	"Anderson"
replace cntycode = 	90	if County == 	"Bamberg"
replace cntycode = 	110	if County == 	"Barnwell"
replace cntycode = 	130	if County == 	"Beaufort"
replace cntycode = 	150	if County == 	"Berkeley"
replace cntycode = 	170	if County == 	"Calhoun"
replace cntycode = 	190	if County == 	"Charleston"
replace cntycode = 	210	if County == 	"Cherokee"
replace cntycode = 	230	if County == 	"Chester"
replace cntycode = 	250	if County == 	"Chesterfield"
replace cntycode = 	270	if County == 	"Clarendon"
replace cntycode = 	290	if County == 	"Colleton"
replace cntycode = 	310	if County == 	"Darlington"
replace cntycode = 	330	if County == 	"Dillon"
replace cntycode = 	350	if County == 	"Dorchester"
replace cntycode = 	370	if County == 	"Edgefield"
replace cntycode = 	390	if County == 	"Fairfield"
replace cntycode = 	410	if County == 	"Florence"
replace cntycode = 	430	if County == 	"Georgetown"
replace cntycode = 	450	if County == 	"Greenville"
replace cntycode = 	470	if County == 	"Greenwood"
replace cntycode = 	490	if County == 	"Hampton"
replace cntycode = 	510	if County == 	"Horry"
replace cntycode = 	530	if County == 	"Jasper"
replace cntycode = 	550	if County == 	"Kershaw"
replace cntycode = 	570	if County == 	"Lancaster"
replace cntycode = 	590	if County == 	"Laurens"
replace cntycode = 	610	if County == 	"Lee"
replace cntycode = 	630	if County == 	"Lexington"
replace cntycode = 	650	if County == 	"McCormick"
replace cntycode = 	670	if County == 	"Marion"
replace cntycode = 	690	if County == 	"Marlboro"
replace cntycode = 	710	if County == 	"Newberry"
replace cntycode = 	730	if County == 	"Oconee"
replace cntycode = 	750	if County == 	"Orangeburg"
replace cntycode = 	755	if County == 	"Pendleton"  /* County disbanded 1826 */
replace cntycode = 	770	if County == 	"Pickens"
replace cntycode = 	790	if County == 	"Richland"
replace cntycode = 	810	if County == 	"Saluda"
replace cntycode = 	830	if County == 	"Spartanburg"
replace cntycode = 	850	if County == 	"Sumter"
replace cntycode = 	870	if County == 	"Union"
replace cntycode = 	890	if County == 	"Williamsburg"
replace cntycode = 	910	if County == 	"York"

gen geocode = (stcode * 10000) + cntycode

save SC_2016_Primary, replace

clear



