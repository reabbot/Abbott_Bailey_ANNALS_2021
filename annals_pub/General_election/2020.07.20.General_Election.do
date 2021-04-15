/* This file begun for ASA 2019 submission by Amy Bailey. */

version 14.2

cd "H:\Lynching\Trump_Lynch\Elections_2016_Lynch"

use Alabama

gen cntycode = .			
replace cntycode = 	10	if County == 	"Autauga"
replace cntycode = 	30	if County == 	"Baldwin"
replace cntycode = 	50	if County == 	"Barbour"
replace cntycode = 	70	if County == 	"Bibb"
replace cntycode = 	90	if County == 	"Blount"
replace cntycode = 	110	if County == 	"Bullock"
replace cntycode = 	130	if County == 	"Butler"
replace cntycode = 	150	if County == 	"Calhoun"
replace cntycode = 	170	if County == 	"Chambers"
replace cntycode = 	190	if County == 	"Cherokee"
replace cntycode = 	210	if County == 	"Chilton"
replace cntycode = 	230	if County == 	"Choctaw"
replace cntycode = 	250	if County == 	"Clarke"
replace cntycode = 	270	if County == 	"Clay"
replace cntycode = 	290	if County == 	"Cleburne"
replace cntycode = 	310	if County == 	"Coffee"
replace cntycode = 	330	if County == 	"Colbert"
replace cntycode = 	350	if County == 	"Conecuh"
replace cntycode = 	370	if County == 	"Coosa"
replace cntycode = 	390	if County == 	"Covington"
replace cntycode = 	410	if County == 	"Crenshaw"
replace cntycode = 	430	if County == 	"Cullman"
replace cntycode = 	450	if County == 	"Dale"
replace cntycode = 	470	if County == 	"Dallas"
replace cntycode = 	490	if County == 	"DeKalb"
replace cntycode = 	510	if County == 	"Elmore"
replace cntycode = 	530	if County == 	"Escambia"
replace cntycode = 	550	if County == 	"Etowah"
replace cntycode = 	570	if County == 	"Fayette"
replace cntycode = 	590	if County == 	"Franklin"
replace cntycode = 	610	if County == 	"Geneva"
replace cntycode = 	630	if County == 	"Greene"
replace cntycode = 	650	if County == 	"Hale"
replace cntycode = 	670	if County == 	"Henry"
replace cntycode = 	690	if County == 	"Houston"
replace cntycode = 	710	if County == 	"Jackson"
replace cntycode = 	730	if County == 	"Jefferson"
replace cntycode = 	750	if County == 	"Lamar"
replace cntycode = 	770	if County == 	"Lauderdale"
replace cntycode = 	790	if County == 	"Lawrence"
replace cntycode = 	810	if County == 	"Lee"
replace cntycode = 	830	if County == 	"Limestone"
replace cntycode = 	850	if County == 	"Lowndes"
replace cntycode = 	870	if County == 	"Macon"
replace cntycode = 	890	if County == 	"Madison"
replace cntycode = 	910	if County == 	"Marengo"
replace cntycode = 	930	if County == 	"Marion"
replace cntycode = 	950	if County == 	"Marshall"
replace cntycode = 	970	if County == 	"Mobile"
replace cntycode = 	990	if County == 	"Monroe"
replace cntycode = 	1010	if County == 	"Montgomery"
replace cntycode = 	1030	if County == 	"Morgan"
replace cntycode = 	1050	if County == 	"Perry"
replace cntycode = 	1070	if County == 	"Pickens"
replace cntycode = 	1090	if County == 	"Pike"
replace cntycode = 	1110	if County == 	"Randolph"
replace cntycode = 	1130	if County == 	"Russell"
replace cntycode = 	1150	if County == 	"St. Clair"
replace cntycode = 	1170	if County == 	"Shelby"
replace cntycode = 	1190	if County == 	"Sumter"
replace cntycode = 	1210	if County == 	"Talladega"
replace cntycode = 	1230	if County == 	"Tallapoosa"
replace cntycode = 	1250	if County == 	"Tuscaloosa"
replace cntycode = 	1270	if County == 	"Walker"
replace cntycode = 	1290	if County == 	"Washington"
replace cntycode = 	1310	if County == 	"Wilcox"
replace cntycode = 	1330	if County == 	"Winston"
drop if County == "Total:"

replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr, replace
gen uniqicpsr = stateicpsr + cntycode

save Alabama, replace

clear

use Arkansas	

gen cntycode = .		
replace cntycode = 	10	if County == 	"Arkansas"
replace cntycode = 	30	if County == 	"Ashley"
replace cntycode = 	50	if County == 	"Baxter"
replace cntycode = 	70	if County == 	"Benton"
replace cntycode = 	90	if County == 	"Boone"
replace cntycode = 	110	if County == 	"Bradley"
replace cntycode = 	130	if County == 	"Calhoun"
replace cntycode = 	150	if County == 	"Carroll"
replace cntycode = 	170	if County == 	"Chicot"
replace cntycode = 	190	if County == 	"Clark"
replace cntycode = 	210	if County == 	"Clay"
replace cntycode = 	230	if County == 	"Cleburne"
replace cntycode = 	250	if County == 	"Cleveland"
replace cntycode = 	270	if County == 	"Columbia"
replace cntycode = 	290	if County == 	"Conway"
replace cntycode = 	310	if County == 	"Craighead"
replace cntycode = 	330	if County == 	"Crawford"
replace cntycode = 	350	if County == 	"Crittenden"
replace cntycode = 	370	if County == 	"Cross"
replace cntycode = 	390	if County == 	"Dallas"
replace cntycode = 	410	if County == 	"Desha"
replace cntycode = 	430	if County == 	"Drew"
replace cntycode = 	450	if County == 	"Faulkner"
replace cntycode = 	470	if County == 	"Franklin"
replace cntycode = 	490	if County == 	"Fulton"
replace cntycode = 	510	if County == 	"Garland"
replace cntycode = 	530	if County == 	"Grant"
replace cntycode = 	550	if County == 	"Greene"
replace cntycode = 	570	if County == 	"Hempstead"
replace cntycode = 	590	if County == 	"Hot Spring"
replace cntycode = 	610	if County == 	"Howard"
replace cntycode = 	630	if County == 	"Independence"
replace cntycode = 	650	if County == 	"Izard"
replace cntycode = 	670	if County == 	"Jackson"
replace cntycode = 	690	if County == 	"Jefferson"
replace cntycode = 	710	if County == 	"Johnson"
replace cntycode = 	730	if County == 	"Lafayette"
replace cntycode = 	750	if County == 	"Lawrence"
replace cntycode = 	770	if County == 	"Lee"
replace cntycode = 	790	if County == 	"Lincoln"
replace cntycode = 	810	if County == 	"Little River"
replace cntycode = 	830	if County == 	"Logan"
replace cntycode = 	850	if County == 	"Lonoke"
replace cntycode = 	870	if County == 	"Madison"
replace cntycode = 	890	if County == 	"Marion"
replace cntycode = 	910	if County == 	"Miller"
replace cntycode = 	930	if County == 	"Mississippi"
replace cntycode = 	950	if County == 	"Monroe"
replace cntycode = 	970	if County == 	"Montgomery"
replace cntycode = 	990	if County == 	"Nevada"
replace cntycode = 	1010	if County == 	"Newton"
replace cntycode = 	1030	if County == 	"Ouachita"
replace cntycode = 	1050	if County == 	"Perry"
replace cntycode = 	1070	if County == 	"Phillips"
replace cntycode = 	1090	if County == 	"Pike"
replace cntycode = 	1110	if County == 	"Poinsett"
replace cntycode = 	1130	if County == 	"Polk"
replace cntycode = 	1150	if County == 	"Pope"
replace cntycode = 	1170	if County == 	"Prairie"
replace cntycode = 	1190	if County == 	"Pulaski"
replace cntycode = 	1210	if County == 	"Randolph"
replace cntycode = 	1230	if County == 	"St Francis"
replace cntycode = 	1250	if County == 	"Saline"
replace cntycode = 	1270	if County == 	"Scott"
replace cntycode = 	1290	if County == 	"Searcy"
replace cntycode = 	1310	if County == 	"Sebastian"
replace cntycode = 	1330	if County == 	"Sevier"
replace cntycode = 	1350	if County == 	"Sharp"
replace cntycode = 	1370	if County == 	"Stone"
replace cntycode = 	1390	if County == 	"Union"
replace cntycode = 	1410	if County == 	"Van Buren"
replace cntycode = 	1430	if County == 	"Washington"
replace cntycode = 	1450	if County == 	"White"
replace cntycode = 	1470	if County == 	"Woodruff"
replace cntycode = 	1490	if County == 	"Yell"


replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode

save Arkansas, replace

append using Alabama

save AllStatesNov2016, replace

clear

use Florida

gen cntycode = .			
replace cntycode = 	10	if County == 	"Alachua"
replace cntycode = 	30	if County == 	"Baker"
replace cntycode = 	50	if County == 	"Bay"
replace cntycode = 	70	if County == 	"Bradford"
replace cntycode = 	90	if County == 	"Brevard"
replace cntycode = 	110	if County == 	"Broward"
replace cntycode = 	130	if County == 	"Calhoun"
replace cntycode = 	150	if County == 	"Charlotte"
replace cntycode = 	170	if County == 	"Citrus"
replace cntycode = 	190	if County == 	"Clay"
replace cntycode = 	210	if County == 	"Collier"
replace cntycode = 	230	if County == 	"Columbia"
replace cntycode = 	250	if County == 	"Desoto"
replace cntycode = 	270	if County == 	"Dixie"
replace cntycode = 	290	if County == 	"Duval"
replace cntycode = 	310	if County == 	"Escambia"
replace cntycode = 	330	if County == 	"Flagler"
replace cntycode = 	350	if County == 	"Franklin"
replace cntycode = 	370	if County == 	"Gadsden"
replace cntycode = 	390	if County == 	"Gilchrist"
replace cntycode = 	410	if County == 	"Glades"
replace cntycode = 	430	if County == 	"Gulf"
replace cntycode = 	450	if County == 	"Hamilton"
replace cntycode = 	470	if County == 	"Hardee"
replace cntycode = 	490	if County == 	"Hendry"
replace cntycode = 	510	if County == 	"Hernando"
replace cntycode = 	530	if County == 	"Highlands"
replace cntycode = 	550	if County == 	"Hillsborough"
replace cntycode = 	570	if County == 	"Holmes"
replace cntycode = 	590	if County == 	"Indian River"
replace cntycode = 	610	if County == 	"Jackson"
replace cntycode = 	630	if County == 	"Jefferson"
replace cntycode = 	650	if County == 	"Lafayette"
replace cntycode = 	670	if County == 	"Lake"
replace cntycode = 	690	if County == 	"Lee"
replace cntycode = 	710	if County == 	"Leon"
replace cntycode = 	730	if County == 	"Levy"
replace cntycode = 	750	if County == 	"Liberty"
replace cntycode = 	770	if County == 	"Madison"
replace cntycode = 	790	if County == 	"Manatee"
replace cntycode = 	810	if County == 	"Marion"
replace cntycode = 	830	if County == 	"Martin"
replace cntycode = 	850	if County == 	"Miami-Dade"
replace cntycode = 	870	if County == 	"Monroe"
replace cntycode = 	890	if County == 	"Nassau"
replace cntycode = 	910	if County == 	"Okaloosa"
replace cntycode = 	930	if County == 	"Okeechobee"
replace cntycode = 	950	if County == 	"Orange"
replace cntycode = 	970	if County == 	"Osceola"
replace cntycode = 	990	if County == 	"Palm Beach"
replace cntycode = 	1010	if County == 	"Pasco"
replace cntycode = 	1030	if County == 	"Pinellas"
replace cntycode = 	1050	if County == 	"Polk"
replace cntycode = 	1070	if County == 	"Putnam"
replace cntycode = 	1090	if County == 	"St. Johns"
replace cntycode = 	1110	if County == 	"St. Lucie"
replace cntycode = 	1130	if County == 	"Santa Rosa"
replace cntycode = 	1150	if County == 	"Sarasota"
replace cntycode = 	1170	if County == 	"Seminole"
replace cntycode = 	1190	if County == 	"Sumter"
replace cntycode = 	1210	if County == 	"Suwannee"
replace cntycode = 	1230	if County == 	"Taylor"
replace cntycode = 	1250	if County == 	"Union"
replace cntycode = 	1270	if County == 	"Volusia"
replace cntycode = 	1290	if County == 	"Wakulla"
replace cntycode = 	1310	if County == 	"Walton"
replace cntycode = 	1330	if County == 	"Washington"
drop if County == "Total:"

replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode

gen pctTrump = Trump/TotVotes *100
gen r_T_C = Trump/Clinton

save Florida, replace

append using AllStatesNov2016

save AllStatesNov2016, replace

clear

use Georgia

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

drop if County == "Total:"

replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode

save Georgia, replace

append using AllStatesNov2016

save AllStatesNov2016, replace

clear

* append using Kentucky

use Louisiana

gen State = "Louisiana" 
rename statecode stateicpsr 
gen statefips = 22 
rename Total TotVotes

replace cntycode = cntycode * 10

replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode

save Louisiana, replace

append using AllStatesNov2016

save AllStatesNov2016, replace

clear


use Mississippi
gen State = "Mississippi" 
rename statecode stateicpsr 
gen statefips = 28 

rename Total TotVotes 

replace cntycode = cntycode * 10
replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode


save Mississippi, replace
append using AllStatesNov2016

save AllStatesNov2016, replace

clear

use NCarolina

gen State = "North Carolina" 
rename statecode stateicpsr 
gen statefips = 37 

rename Total TotVotes 

replace cntycode = cntycode * 10
replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode


save NCarolina, replace

append using AllStatesNov2016

save AllStatesNov2016, replace

clear


use SCarolina

gen cntycode = uniqfips - 45000
replace cntycode = cntycode * 10

replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode

save SCarolina, replace

append using AllStatesNov2016

save AllStatesNov2016, replace

clear

use Tennessee

gen State = "Tennessee" 
rename statecode stateicpsr 
gen statefips = 47 
replace cntycode = cntycode * 10

replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode


save Tennessee, replace

append using AllStatesNov2016

save AllStatesNov2016, replace

clear


use Virginia

replace statefips = 51
replace stateicpsr = 40

replace statefips = statefips * 100 if cntycode < 100
replace statefips = statefips * 10 if cntycode >= 100 & cntycode < 1000
tostring cntycode, replace
tostring statefips, replace
gen uniqfips = statefips + cntycode

destring cntycode, replace
replace stateicpsr = stateicpsr * 100 if cntycode < 100
replace stateicpsr = stateicpsr * 10 if cntycode >= 100 & cntycode < 1000

tostring stateicpsr cntycode, replace
gen uniqicpsr = stateicpsr + cntycode

save Virginia, replace

append using AllStatesNov2016
save AllStatesNov2016, replace

keep County Clinton Trump TotVotes pctTrump r_T_C stateicpsr statefips cntycode uniqfips uniqicpsr

save AllStatesNov2016, replace

clear



****************************************************************************
*Below this line adds Kentucky general election data, added 10-18-20 by RA
*****************************************************************************

clear all
cd "C:\Users\bobab\Desktop\Current_Data_July2020\Amy updates"
import excel "C:\Users\bobab\Desktop\Current_Data_July2020\Amy updates\Kentucky_2016_General_Election.xls", sheet("2") cellrange(A3:CW124) firstrow

keep County ElectionDayDonaldJTRUMPMi ElectionDayHillaryRodhamCLINT Total

*add county id

drop if County== "Total:"

gen statefips = 21


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


gen uniqfips = (statefips * 10000) + cntycode



*merge with general election data
save Kentucky, replace

tostring cntycode,replace
tostring uniqfips,replace
tostring statefips,replace

rename ElectionDayDonaldJTRUMPMi Trump
rename ElectionDayHillaryRodhamCLINT Clinton
rename Total TotVotes

gen pctTrump= Trump/TotVotes
gen r_T_C = Trump/Clinton

append using AllStatesNov2016_copy
save AllStatesNov2016, replace











