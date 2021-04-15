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

gen cntycode = .
replace cntycode = 	10	 if County == 	"Autauga"
replace cntycode = 	30	 if County == 	"Baldwin"
replace cntycode = 	50	 if County == 	"Barbour"
replace cntycode = 	70	 if County == 	"Bibb"
replace cntycode = 	90	 if County == 	"Blount"
replace cntycode = 	110	 if County == 	"Bullock"
replace cntycode = 	130	 if County == 	"Butler"
replace cntycode = 	150	 if County == 	"Calhoun"
replace cntycode = 	170	 if County == 	"Chambers"
replace cntycode = 	190	 if County == 	"Cherokee"
replace cntycode = 	210	 if County == 	"Chilton"
replace cntycode = 	230	 if County == 	"Choctaw"
replace cntycode = 	250	 if County == 	"Clarke"
replace cntycode = 	270	 if County == 	"Clay"
replace cntycode = 	290	 if County == 	"Cleburne"
replace cntycode = 	310	 if County == 	"Coffee"
replace cntycode = 	330	 if County == 	"Colbert"
replace cntycode = 	350	 if County == 	"Conecuh"
replace cntycode = 	370	 if County == 	"Coosa"
replace cntycode = 	390	 if County == 	"Covington"
replace cntycode = 	410	 if County == 	"Crenshaw"
replace cntycode = 	430	 if County == 	"Cullman"
replace cntycode = 	450	 if County == 	"Dale"
replace cntycode = 	470	 if County == 	"Dallas"
replace cntycode = 	490	 if County == 	"DeKalb"
replace cntycode = 	510	 if County == 	"Elmore"
replace cntycode = 	530	 if County == 	"Escambia"
replace cntycode = 	550	 if County == 	"Etowah"
replace cntycode = 	570	 if County == 	"Fayette"
replace cntycode = 	590	 if County == 	"Franklin"
replace cntycode = 	610	 if County == 	"Geneva"
replace cntycode = 	630	 if County == 	"Greene"
replace cntycode = 	650	 if County == 	"Hale"
replace cntycode = 	670	 if County == 	"Henry"
replace cntycode = 	690	 if County == 	"Houston"
replace cntycode = 	710	 if County == 	"Jackson"
replace cntycode = 	730	 if County == 	"Jefferson"
replace cntycode = 	750	 if County == 	"Lamar"
replace cntycode = 	770	 if County == 	"Lauderdale"
replace cntycode = 	790	 if County == 	"Lawrence"
replace cntycode = 	810	 if County == 	"Lee"
replace cntycode = 	830	 if County == 	"Limestone"
replace cntycode = 	850	 if County == 	"Lowndes"
replace cntycode = 	870	 if County == 	"Macon"
replace cntycode = 	890	 if County == 	"Madison"
replace cntycode = 	910	 if County == 	"Marengo"
replace cntycode = 	930	 if County == 	"Marion"
replace cntycode = 	950	 if County == 	"Marshall"
replace cntycode = 	970	 if County == 	"Mobile"
replace cntycode = 	990	 if County == 	"Monroe"
replace cntycode = 	1010	 if County == 	"Montgomery"
replace cntycode = 	1030	 if County == 	"Morgan"
replace cntycode = 	1050	 if County == 	"Perry"
replace cntycode = 	1070	 if County == 	"Pickens"
replace cntycode = 	1090	 if County == 	"Pike"
replace cntycode = 	1110	 if County == 	"Randolph"
replace cntycode = 	1130	 if County == 	"Russell"
replace cntycode = 	1150	 if County == 	"St. Clair"
replace cntycode = 	1170	 if County == 	"Shelby"
replace cntycode = 	1190	 if County == 	"Sumter"
replace cntycode = 	1210	 if County == 	"Talladega"
replace cntycode = 	1230	 if County == 	"Tallapoosa"
replace cntycode = 	1250	 if County == 	"Tuscaloosa"
replace cntycode = 	1270	 if County == 	"Walker"
replace cntycode = 	1290	 if County == 	"Washington"
replace cntycode = 	1310	 if County == 	"Wilcox"
replace cntycode = 	1330	 if County == 	"Winston"

save AL_2016_Primary.dta, replace

clear

