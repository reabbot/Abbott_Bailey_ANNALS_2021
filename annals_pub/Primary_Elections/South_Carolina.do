/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in South Carolina by county, and creates a small 
data file with counties (nonclustered) as cases and the following variables:
1) String variable with county name
2) String variable with "South Carolina" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cnticpsr)
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

gen State = "South Carolina"
gen sticpsr = 48
gen stfips = 45

gen cnticpsr = .

replace cnticpsr = 	10	if County == 	"Abbeville"
replace cnticpsr = 	30	if County == 	"Aiken"
replace cnticpsr = 	50	if County == 	"Allendale"
replace cnticpsr = 	70	if County == 	"Anderson"
replace cnticpsr = 	90	if County == 	"Bamberg"
replace cnticpsr = 	110	if County == 	"Barnwell"
replace cnticpsr = 	130	if County == 	"Beaufort"
replace cnticpsr = 	150	if County == 	"Berkeley"
replace cnticpsr = 	170	if County == 	"Calhoun"
replace cnticpsr = 	190	if County == 	"Charleston"
replace cnticpsr = 	210	if County == 	"Cherokee"
replace cnticpsr = 	230	if County == 	"Chester"
replace cnticpsr = 	250	if County == 	"Chesterfield"
replace cnticpsr = 	270	if County == 	"Clarendon"
replace cnticpsr = 	290	if County == 	"Colleton"
replace cnticpsr = 	310	if County == 	"Darlington"
replace cnticpsr = 	330	if County == 	"Dillon"
replace cnticpsr = 	350	if County == 	"Dorchester"
replace cnticpsr = 	370	if County == 	"Edgefield"
replace cnticpsr = 	390	if County == 	"Fairfield"
replace cnticpsr = 	410	if County == 	"Florence"
replace cnticpsr = 	430	if County == 	"Georgetown"
replace cnticpsr = 	450	if County == 	"Greenville"
replace cnticpsr = 	470	if County == 	"Greenwood"
replace cnticpsr = 	490	if County == 	"Hampton"
replace cnticpsr = 	510	if County == 	"Horry"
replace cnticpsr = 	530	if County == 	"Jasper"
replace cnticpsr = 	550	if County == 	"Kershaw"
replace cnticpsr = 	570	if County == 	"Lancaster"
replace cnticpsr = 	590	if County == 	"Laurens"
replace cnticpsr = 	610	if County == 	"Lee"
replace cnticpsr = 	630	if County == 	"Lexington"
replace cnticpsr = 	650	if County == 	"McCormick"
replace cnticpsr = 	670	if County == 	"Marion"
replace cnticpsr = 	690	if County == 	"Marlboro"
replace cnticpsr = 	710	if County == 	"Newberry"
replace cnticpsr = 	730	if County == 	"Oconee"
replace cnticpsr = 	750	if County == 	"Orangeburg"
replace cnticpsr = 	755	if County == 	"Pendleton"  /* County disbanded 1826 */
replace cnticpsr = 	770	if County == 	"Pickens"
replace cnticpsr = 	790	if County == 	"Richland"
replace cnticpsr = 	810	if County == 	"Saluda"
replace cnticpsr = 	830	if County == 	"Spartanburg"
replace cnticpsr = 	850	if County == 	"Sumter"
replace cnticpsr = 	870	if County == 	"Union"
replace cnticpsr = 	890	if County == 	"Williamsburg"
replace cnticpsr = 	910	if County == 	"York"

gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr

save SC_2016_Primary, replace

clear



