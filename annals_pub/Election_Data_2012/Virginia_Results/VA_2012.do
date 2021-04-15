/* This file was created in October 2020 by AKB. It reads in raw election data
(in excel format) from Virginia for the 2012 general election - results for the 
preseidential race. It creates a Stata data file, with variable names that 
conform to those being used in other data files for other states. */

clear

version 15.1

cd  H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\Virginia_Results

import excel using VA_Votes_AKB.xlsx /* This copies the original data we downloaded
	from the state, and removes extraneous characters from the field reporting 
	the county and city names */

save VA_2012.dta, replace

rename A County
rename B NVote_Obama
rename C NVote_Romney
rename D NVote_Johnson
rename E NVote_Goode
rename F NVote_Stein
rename G NVote_Others
rename H NVote_Total

drop if County == "" /* The data were somehow recorded in two lines (merge cells
                        or something). So half of the records were blank. This
						step eliminates that. We lost 134 observations. */

* see also: https://apps.bea.gov/regional/docs/statelist.cfm
drop if County == "County/City" | County == "Totals"

destring NVote_Obama NVote_Romney NVote_Johnson NVote_Goode NVote_Stein ///
	NVote_Others NVote_Total, replace

gen State = "Virginia"
gen sticpsr = 40
gen stfips  = 51

gen cnticpsr = .

replace cnticpsr = 	10	if County == 	"Accomack County"
replace cnticpsr = 	30	if County == 	"Albemarle County"
replace cnticpsr = 	5100	if County == 	"Alexandria City"
replace cnticpsr = 	50	if County == 	"Alleghany County"
replace cnticpsr = 	70	if County == 	"Amelia County"
replace cnticpsr = 	90	if County == 	"Amherst County"
replace cnticpsr = 	110	if County == 	"Appomattox County"
replace cnticpsr = 	130	if County == 	"Arlington County"
replace cnticpsr = 	150	if County == 	"Augusta County"
replace cnticpsr = 	170	if County == 	"Bath County"
replace cnticpsr = 	190	if County == 	"Bedford County"
replace cnticpsr = 	190	if County == 	"Bedford City"
/* NOTE: Bedford Town became an independent city in 1968, and then was
reabsorbed by Bedford County in 2013. Confirmation here:
https://newsadvance.com/news/local/bedford-reversion-to-town-becomes-official-today/article_5dcbc886-e1e9-11e2-a412-001a4bcf6878.html
*/
replace cnticpsr = 	210	if County == 	"Bland County"
replace cnticpsr = 	230	if County == 	"Botetourt County"
replace cnticpsr = 	5200	if County == 	"Bristol City"
replace cnticpsr = 	250	if County == 	"Brunswick County"
replace cnticpsr = 	270	if County == 	"Buchanan County"
replace cnticpsr = 	290	if County == 	"Buckingham County"
replace cnticpsr = 	5300	if County == 	"Buena Vista City"
replace cnticpsr = 	310	if County == 	"Campbell County"
replace cnticpsr = 	330	if County == 	"Caroline County"
replace cnticpsr = 	350	if County == 	"Carroll County"
replace cnticpsr = 	360	if County == 	"Charles City County"
replace cnticpsr = 	370	if County == 	"Charlotte County"
replace cnticpsr = 	5400	if County == 	"Charlottesville City"
replace cnticpsr = 	5500	if County == 	"Chesapeake City"
replace cnticpsr = 	410	if County == 	"Chesterfield County"
replace cnticpsr = 	430	if County == 	"Clarke County"
replace cnticpsr = 	5700	if County == 	"Colonial Heights City"
replace cnticpsr = 	5800	if County == 	"Covington City"
replace cnticpsr = 	450	if County == 	"Craig County"
replace cnticpsr = 	470	if County == 	"Culpeper County"
replace cnticpsr = 	490	if County == 	"Cumberland County"
replace cnticpsr = 	5900	if County == 	"Danville City"
replace cnticpsr = 	510	if County == 	"Dickenson County"
replace cnticpsr = 	530	if County == 	"Dinwiddie County"
replace cnticpsr = 	5950	if County == 	"Emporia City"
replace cnticpsr = 	570	if County == 	"Essex County"
replace cnticpsr = 	590	if County == 	"Fairfax County"
replace cnticpsr = 	6000	if County == 	"Fairfax City"
replace cnticpsr = 	6100	if County == 	"Falls Church City"
replace cnticpsr = 	610	if County == 	"Fauquier County"
replace cnticpsr = 	630	if County == 	"Floyd County"
replace cnticpsr = 	650	if County == 	"Fluvanna County"
replace cnticpsr = 	670	if County == 	"Franklin County"
replace cnticpsr = 	6200	if County == 	"Franklin City"
replace cnticpsr = 	690	if County == 	"Frederick County"
replace cnticpsr = 	6300	if County == 	"Fredericksburg City"
replace cnticpsr = 	6400	if County == 	"Galax City"
replace cnticpsr = 	710	if County == 	"Giles County"
replace cnticpsr = 	730	if County == 	"Gloucester County"
replace cnticpsr = 	750	if County == 	"Goochland County"
replace cnticpsr = 	770	if County == 	"Grayson County"
replace cnticpsr = 	790	if County == 	"Greene County"
replace cnticpsr = 	810	if County == 	"Greensville County"
replace cnticpsr = 	830	if County == 	"Halifax County"
replace cnticpsr = 	6500	if County == 	"Hampton City"
replace cnticpsr = 	850	if County == 	"Hanover County"
replace cnticpsr = 	6600	if County == 	"Harrisonburg City"
replace cnticpsr = 	870	if County == 	"Henrico County"
replace cnticpsr = 	890	if County == 	"Henry County"
replace cnticpsr = 	910	if County == 	"Highland County"
replace cnticpsr = 	6700	if County == 	"Hopewell City"
replace cnticpsr = 	930	if County == 	"Isle of Wight County"
replace cnticpsr = 	950	if County == 	"James City County"
replace cnticpsr = 	970	if County == 	"King and Queen County"
replace cnticpsr = 	990	if County == 	"King George County"
replace cnticpsr = 	1010	if County == 	"King William County"
replace cnticpsr = 	1030	if County == 	"Lancaster County"
replace cnticpsr = 	1050	if County == 	"Lee County"
replace cnticpsr = 	6780	if County == 	"Lexington City"
replace cnticpsr = 	1070	if County == 	"Loudoun County"
replace cnticpsr = 	1090	if County == 	"Louisa County"
replace cnticpsr = 	1110	if County == 	"Lunenburg County"
replace cnticpsr = 	6800	if County == 	"Lynchburg City"
replace cnticpsr = 	1130	if County == 	"Madison County"
replace cnticpsr = 	1530	if County == 	"Manassas City"
replace cnticpsr = 	1530	if County == 	"Manassas Park City"
replace cnticpsr = 	6900	if County == 	"Martinsville City"
replace cnticpsr = 	1150	if County == 	"Mathews County"
replace cnticpsr = 	1170	if County == 	"Mecklenburg County"
replace cnticpsr = 	1190	if County == 	"Middlesex County"
replace cnticpsr = 	1210	if County == 	"Montgomery County"
replace cnticpsr = 	1250	if County == 	"Nelson County"
replace cnticpsr = 	1270	if County == 	"New Kent County"
replace cnticpsr = 	7000	if County == 	"Newport News City"
replace cnticpsr = 	7100	if County == 	"Norfolk City"
replace cnticpsr = 	1310	if County == 	"Northampton County"
replace cnticpsr = 	1330	if County == 	"Northumberland County"
replace cnticpsr = 	7200	if County == 	"Norton City"
replace cnticpsr = 	1350	if County == 	"Nottoway County"
replace cnticpsr = 	1370	if County == 	"Orange County"
replace cnticpsr = 	1390	if County == 	"Page County"
replace cnticpsr = 	1410	if County == 	"Patrick County"
replace cnticpsr = 	7300	if County == 	"Petersburg City"
replace cnticpsr = 	1430	if County == 	"Pittsylvania County"
replace cnticpsr = 	1990	if County == 	"Poquoson City"
replace cnticpsr = 	1435	if County == 	"Portsmouth City"
replace cnticpsr = 	1450	if County == 	"Powhatan County"
replace cnticpsr = 	1470	if County == 	"Prince Edward County"
replace cnticpsr = 	1490	if County == 	"Prince George County"
replace cnticpsr = 	1530	if County == 	"Prince William County"
replace cnticpsr = 	1550	if County == 	"Pulaski County"
replace cnticpsr = 	7500	if County == 	"Radford City"
replace cnticpsr = 	1570	if County == 	"Rappahannock County"
replace cnticpsr = 	1590	if County == 	"Richmond County"
replace cnticpsr = 	7600	if County == 	"Richmond City"
replace cnticpsr = 	1610	if County == 	"Roanoke County"
replace cnticpsr = 	7700	if County == 	"Roanoke City"
replace cnticpsr = 	1630	if County == 	"Rockbridge County"
replace cnticpsr = 	1650	if County == 	"Rockingham County"
replace cnticpsr = 	1670	if County == 	"Russell County"
replace cnticpsr = 	7750	if County == 	"Salem City"
replace cnticpsr = 	1690	if County == 	"Scott County"
replace cnticpsr = 	1710	if County == 	"Shenandoah County"
replace cnticpsr = 	1730	if County == 	"Smyth County"
replace cnticpsr = 	1750	if County == 	"Southampton County"
replace cnticpsr = 	1770	if County == 	"Spotsylvania County"
replace cnticpsr = 	1790	if County == 	"Stafford County"
replace cnticpsr = 	7900	if County == 	"Staunton City"
replace cnticpsr = 	8000	if County == 	"Suffolk City"
replace cnticpsr = 	1810	if County == 	"Surry County"
replace cnticpsr = 	1830	if County == 	"Sussex County"
replace cnticpsr = 	1850	if County == 	"Tazewell County"
replace cnticpsr = 	8100	if County == 	"Virginia Beach City"
replace cnticpsr = 	1870	if County == 	"Warren County"
replace cnticpsr = 	1910	if County == 	"Washington County"
replace cnticpsr = 	8200	if County == 	"Waynesboro City"
replace cnticpsr = 	1930	if County == 	"Westmoreland County"
replace cnticpsr = 	8300	if County == 	"Williamsburg City"
replace cnticpsr = 	8400	if County == 	"Winchester City"
replace cnticpsr = 	1950	if County == 	"Wise County"
replace cnticpsr = 	1970	if County == 	"Wythe County"
replace cnticpsr = 	1990	if County == 	"York County"

gen uniqfips = (stfips * 10000) + cnticpsr
gen uniqicpsr = (sticpsr * 10000) + cnticpsr	

save VA_2012.dta, replace

clear

