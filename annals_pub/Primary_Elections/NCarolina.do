/* This file begun April 2020 by AKB. It reads in the votes for 2016
Republican primary in North Carolina. There is a .txt file that includes results
for all primary races, with the number of votes for each candidate reported by 
polling station for each county. There is a separate record for each candidate 
in each polling station. so...I read in the .txt file, and save an ongoing 
working file, stripped to include only results for the Republican Presidential 
primary. Then, I create two cumulated files -- one with the total number of
votes for Trump in each county, and one for the total number of votes cast in
each county. I merge these together and then create the other variables.
Ultimately, this process creates a small data file with counties (nonclustered) 
as cases and the following variables:
1) String variable with county name
2) String variable with "Florida" to indicate state
3) Numeric ICPSR codes for state (stcode) & county (cnticpsr)
4) Unique identifier (geocode)
5) N votes for Donald Trump in each county
6) N total votes cast in each county's Republican primary

*/

version 15.1

cd "H:\Lynching\Trump_Lynch\Primary_Elections"

import delimited using "NCresults_pct_20160315.txt", varn(1) /* reading in raw data for each county. */

keep if contestname == "US PRESIDENT (REP)"

keep county choice totalvotes 

rename county County

save NC_Working, replace /* This is the "scratch" file I use to calculate votes. */

/* creating first mini data set that counts up the N of votes cast for Trump
in each county. */

collapse (sum) NTrump=totalvotes if choice == "Donald J. Trump", by(County)

/* resulting data file has two variables: NTrump and County */

save NC_Trump, replace /* note that I save it with a new file name */

clear

use NC_Working /* I go back and re-open the scratch data file */

/* now I create a mini data file that counts up total votes cast for Republicans
in each County during the primary */

collapse (sum) TotVotes=totalvotes, by(County)

/* resulting data file has two variables: TotVotes and County */

save NC_Votes, replace /* DO NOT CLEAR! KEEP THIS IN WORKING MEMORY!!! */

merge 1:1 County using NC_Trump 

/* So now data file has 4 variables: County NTrump TotVotes & _merge */

drop _merge

rename TotVotes NVotes
replace County = proper(County) /* in original .txt fie, County names were in all caps */

destring NTrump NVotes, replace
la var NTrump "N Votes for Trump"
la var NVotes "Total votes cast"

gen State = "North Carolina"
gen sticpsr = 47
gen stfips = 37

gen cnticpsr = .
replace cnticpsr = 	10	 if County == 	"Alamance"
replace cnticpsr = 	30	 if County == 	"Alexander"
replace cnticpsr = 	50	 if County == 	"Alleghany"
replace cnticpsr = 	70	 if County == 	"Anson"
replace cnticpsr = 	90	 if County == 	"Ashe"
replace cnticpsr = 	110	 if County == 	"Avery"
replace cnticpsr = 	130	 if County == 	"Beaufort"
replace cnticpsr = 	150	 if County == 	"Bertie"
replace cnticpsr = 	170	 if County == 	"Bladen"
replace cnticpsr = 	190	 if County == 	"Brunswick"
replace cnticpsr = 	210	 if County == 	"Buncombe"
replace cnticpsr = 	230	 if County == 	"Burke"
replace cnticpsr = 	250	 if County == 	"Cabarrus"
replace cnticpsr = 	270	 if County == 	"Caldwell"
replace cnticpsr = 	290	 if County == 	"Camden"
replace cnticpsr = 	310	 if County == 	"Carteret"
replace cnticpsr = 	330	 if County == 	"Caswell"
replace cnticpsr = 	350	 if County == 	"Catawba"
replace cnticpsr = 	370	 if County == 	"Chatham"
replace cnticpsr = 	390	 if County == 	"Cherokee"
replace cnticpsr = 	410	 if County == 	"Chowan"
replace cnticpsr = 	430	 if County == 	"Clay"
replace cnticpsr = 	450	 if County == 	"Cleveland"
replace cnticpsr = 	470	 if County == 	"Columbus"
replace cnticpsr = 	490	 if County == 	"Craven"
replace cnticpsr = 	510	 if County == 	"Cumberland"
replace cnticpsr = 	530	 if County == 	"Currituck"
replace cnticpsr = 	550	 if County == 	"Dare"
replace cnticpsr = 	570	 if County == 	"Davidson"
replace cnticpsr = 	590	 if County == 	"Davie"
replace cnticpsr = 	610	 if County == 	"Duplin"
replace cnticpsr = 	630	 if County == 	"Durham"
replace cnticpsr = 	650	 if County == 	"Edgecombe"
replace cnticpsr = 	670	 if County == 	"Forsyth"
replace cnticpsr = 	690	 if County == 	"Franklin"
replace cnticpsr = 	710	 if County == 	"Gaston"
replace cnticpsr = 	730	 if County == 	"Gates"
replace cnticpsr = 	750	 if County == 	"Graham"
replace cnticpsr = 	770	 if County == 	"Granville"
replace cnticpsr = 	790	 if County == 	"Greene"
replace cnticpsr = 	810	 if County == 	"Guilford"
replace cnticpsr = 	830	 if County == 	"Halifax"
replace cnticpsr = 	850	 if County == 	"Harnett"
replace cnticpsr = 	870	 if County == 	"Haywood"
replace cnticpsr = 	890	 if County == 	"Henderson"
replace cnticpsr = 	910	 if County == 	"Hertford"
replace cnticpsr = 	930	 if County == 	"Hoke"
replace cnticpsr = 	950	 if County == 	"Hyde"
replace cnticpsr = 	970	 if County == 	"Iredell"
replace cnticpsr = 	990	 if County == 	"Jackson"
replace cnticpsr = 	1010	 if County == 	"Johnston"
replace cnticpsr = 	1030	 if County == 	"Jones"
replace cnticpsr = 	1050	 if County == 	"Lee"
replace cnticpsr = 	1070	 if County == 	"Lenoir"
replace cnticpsr = 	1090	 if County == 	"Lincoln"
replace cnticpsr = 	1110	 if County == 	"Mcdowell"
replace cnticpsr = 	1130	 if County == 	"Macon"
replace cnticpsr = 	1150	 if County == 	"Madison"
replace cnticpsr = 	1170	 if County == 	"Martin"
replace cnticpsr = 	1190	 if County == 	"Mecklenburg"
replace cnticpsr = 	1210	 if County == 	"Mitchell"
replace cnticpsr = 	1230	 if County == 	"Montgomery"
replace cnticpsr = 	1250	 if County == 	"Moore"
replace cnticpsr = 	1270	 if County == 	"Nash"
replace cnticpsr = 	1290	 if County == 	"New Hanover"
replace cnticpsr = 	1310	 if County == 	"Northampton"
replace cnticpsr = 	1330	 if County == 	"Onslow"
replace cnticpsr = 	1350	 if County == 	"Orange"
replace cnticpsr = 	1370	 if County == 	"Pamlico"
replace cnticpsr = 	1390	 if County == 	"Pasquotank"
replace cnticpsr = 	1410	 if County == 	"Pender"
replace cnticpsr = 	1430	 if County == 	"Perquimans"
replace cnticpsr = 	1450	 if County == 	"Person"
replace cnticpsr = 	1470	 if County == 	"Pitt"
replace cnticpsr = 	1490	 if County == 	"Polk"
replace cnticpsr = 	1510	 if County == 	"Randolph"
replace cnticpsr = 	1530	 if County == 	"Richmond"
replace cnticpsr = 	1550	 if County == 	"Robeson"
replace cnticpsr = 	1570	 if County == 	"Rockingham"
replace cnticpsr = 	1590	 if County == 	"Rowan"
replace cnticpsr = 	1610	 if County == 	"Rutherford"
replace cnticpsr = 	1630	 if County == 	"Sampson"
replace cnticpsr = 	1650	 if County == 	"Scotland"
replace cnticpsr = 	1670	 if County == 	"Stanly"
replace cnticpsr = 	1690	 if County == 	"Stokes"
replace cnticpsr = 	1710	 if County == 	"Surry"
replace cnticpsr = 	1730	 if County == 	"Swain"
replace cnticpsr = 	1750	 if County == 	"Transylvania"
replace cnticpsr = 	1770	 if County == 	"Tyrrell"
replace cnticpsr = 	1790	 if County == 	"Union"
replace cnticpsr = 	1810	 if County == 	"Vance"
replace cnticpsr = 	1830	 if County == 	"Wake"
replace cnticpsr = 	1850	 if County == 	"Warren"
replace cnticpsr = 	1870	 if County == 	"Washington"
replace cnticpsr = 	1890	 if County == 	"Watauga"
replace cnticpsr = 	1910	 if County == 	"Wayne"
replace cnticpsr = 	1930	 if County == 	"Wilkes"
replace cnticpsr = 	1950	 if County == 	"Wilson"
replace cnticpsr = 	1970	 if County == 	"Yadkin"
replace cnticpsr = 	1990	 if County == 	"Yancey"

gen uniqFIPS = (stfips * 10000) + cnticpsr
gen uniqICPSR = (sticpsr * 10000) + cnticpsr

save NC_2016_Primary, replace

clear

