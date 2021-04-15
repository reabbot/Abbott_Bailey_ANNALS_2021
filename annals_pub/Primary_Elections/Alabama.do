/* This file was created March 2020 by AKB. It reads in results from the 2016
Alabama Republican primaries -- an Excel spreadsheet with a separate tab for 
each county -- and creates a single Stata data file for merging with the county-
level results from other states. This involves assigning ICPSR codes for the 
state, overall, and for each county, as well as a unique geographic identifier.
*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections

use AL_Trump

merge 1:1 County using AL_Votes

drop _merge

gen State= "Alabama"
gen sticpsr = 41
gen stfips  = 01

gen cnticpsr = .
replace cnticpsr = 	10	 if County == 	"Autauga"
replace cnticpsr = 	30	 if County == 	"Baldwin"
replace cnticpsr = 	50	 if County == 	"Barbour"
replace cnticpsr = 	70	 if County == 	"Bibb"
replace cnticpsr = 	90	 if County == 	"Blount"
replace cnticpsr = 	110	 if County == 	"Bullock"
replace cnticpsr = 	130	 if County == 	"Butler"
replace cnticpsr = 	150	 if County == 	"Calhoun"
replace cnticpsr = 	170	 if County == 	"Chambers"
replace cnticpsr = 	190	 if County == 	"Cherokee"
replace cnticpsr = 	210	 if County == 	"Chilton"
replace cnticpsr = 	230	 if County == 	"Choctaw"
replace cnticpsr = 	250	 if County == 	"Clarke"
replace cnticpsr = 	270	 if County == 	"Clay"
replace cnticpsr = 	290	 if County == 	"Cleburne"
replace cnticpsr = 	310	 if County == 	"Coffee"
replace cnticpsr = 	330	 if County == 	"Colbert"
replace cnticpsr = 	350	 if County == 	"Conecuh"
replace cnticpsr = 	370	 if County == 	"Coosa"
replace cnticpsr = 	390	 if County == 	"Covington"
replace cnticpsr = 	410	 if County == 	"Crenshaw"
replace cnticpsr = 	430	 if County == 	"Cullman"
replace cnticpsr = 	450	 if County == 	"Dale"
replace cnticpsr = 	470	 if County == 	"Dallas"
replace cnticpsr = 	490	 if County == 	"DeKalb"
replace cnticpsr = 	510	 if County == 	"Elmore"
replace cnticpsr = 	530	 if County == 	"Escambia"
replace cnticpsr = 	550	 if County == 	"Etowah"
replace cnticpsr = 	570	 if County == 	"Fayette"
replace cnticpsr = 	590	 if County == 	"Franklin"
replace cnticpsr = 	610	 if County == 	"Geneva"
replace cnticpsr = 	630	 if County == 	"Greene"
replace cnticpsr = 	650	 if County == 	"Hale"
replace cnticpsr = 	670	 if County == 	"Henry"
replace cnticpsr = 	690	 if County == 	"Houston"
replace cnticpsr = 	710	 if County == 	"Jackson"
replace cnticpsr = 	730	 if County == 	"Jefferson"
replace cnticpsr = 	750	 if County == 	"Lamar"
replace cnticpsr = 	770	 if County == 	"Lauderdale"
replace cnticpsr = 	790	 if County == 	"Lawrence"
replace cnticpsr = 	810	 if County == 	"Lee"
replace cnticpsr = 	830	 if County == 	"Limestone"
replace cnticpsr = 	850	 if County == 	"Lowndes"
replace cnticpsr = 	870	 if County == 	"Macon"
replace cnticpsr = 	890	 if County == 	"Madison"
replace cnticpsr = 	910	 if County == 	"Marengo"
replace cnticpsr = 	930	 if County == 	"Marion"
replace cnticpsr = 	950	 if County == 	"Marshall"
replace cnticpsr = 	970	 if County == 	"Mobile"
replace cnticpsr = 	990	 if County == 	"Monroe"
replace cnticpsr = 	1010	 if County == 	"Montgomery"
replace cnticpsr = 	1030	 if County == 	"Morgan"
replace cnticpsr = 	1050	 if County == 	"Perry"
replace cnticpsr = 	1070	 if County == 	"Pickens"
replace cnticpsr = 	1090	 if County == 	"Pike"
replace cnticpsr = 	1110	 if County == 	"Randolph"
replace cnticpsr = 	1130	 if County == 	"Russell"
replace cnticpsr = 	1150	 if County == 	"St. Clair"
replace cnticpsr = 	1170	 if County == 	"Shelby"
replace cnticpsr = 	1190	 if County == 	"Sumter"
replace cnticpsr = 	1210	 if County == 	"Talladega"
replace cnticpsr = 	1230	 if County == 	"Tallapoosa"
replace cnticpsr = 	1250	 if County == 	"Tuscaloosa"
replace cnticpsr = 	1270	 if County == 	"Walker"
replace cnticpsr = 	1290	 if County == 	"Washington"
replace cnticpsr = 	1310	 if County == 	"Wilcox"
replace cnticpsr = 	1330	 if County == 	"Winston"

gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr

save AL_2016_Primary.dta, replace

clear

