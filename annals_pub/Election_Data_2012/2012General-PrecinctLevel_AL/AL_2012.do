/* This file was created October 2020 by AKB, to create a single Stata data file 
with county-level votes for each candidate in the 2012 Presidential election. It 
is based on the .do file ALVotes, which read in results from the 2016 Alabama 
Republican primaries. This .do file reads in a separate Excel spreadsheet for 
each county (the 2016 primaries had all counties in a single spreadsheet) and
creates a single Stata data file for merging with the county-level results from
other states. This involves assigning ICPSR codes for the state, overall, and
for each county, as well as a unique geographic identifier.
*/

version 15.1

cd H:\Lynching\Trump_Lynch\ASA_from_CSDE\Election_Data_2012\Election_Data_2012\2012General-PrecinctLevel_AL

import excel using Autauga.xlsx, ///
   sheet("2") cellrange(D25:M25)

keep D F H J L M
   
gen County = "Autauga"
gen cnticpsr = 0010

save AL_2012.dta, replace

clear

import excel using Baldwin.xlsx, ///
   sheet("2") cellrange(D52:M52)
   /* NOTE: The cell range is different re: row number for each county. The last
   row with data values in the Excel spreadsheet provides totals for the county.
   This row varies based on the number of precincts in the county. */

keep D F H J L M
gen County = "Baldwin"
gen cnticpsr = 0030

append using AL_2012.dta
save AL_2012.dta, replace

clear

import excel using Barbour.xlsx, ///
   sheet("2") cellrange(D23:M23)
 
keep D F H J L M
gen County = "Barbour"
gen cnticpsr = 0050

append using AL_2012.dta
save AL_2012.dta, replace

clear

import excel using Bibb.xlsx, ///
   sheet("2") cellrange(D14:M14)
 
keep D F H J L M
gen County = "Bibb"
gen cnticpsr = 0070

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Blount.xlsx, ///
   sheet("2") cellrange(D30:M30)
 
keep D F H J L M
gen County = "Blount"
gen cnticpsr = 0090

append using AL_2012.dta
save AL_2012.dta, replace


clear

/* For some reason the excel spreadsheet for Bullock County says the results 
are unavailable, so I added results from the NYT website to the blank worksheet:
https://www.nytimes.com/elections/2012/results/states/alabama.html */
import excel using Bullock.xlsx, ///
   cellrange(D4:M4)
 
keep D F H J L M
gen County = "Bullock"
gen cnticpsr = 0110

append using AL_2012.dta
save AL_2012.dta, replace

clear


import excel using Butler.xlsx, ///
   cellrange(D4:M4)
   
keep D F H J L M
gen County = "Butler"
gen cnticpsr = 0130

append using AL_2012.dta
save AL_2012.dta, replace

clear

import excel using Calhoun.xlsx, ///
   sheet("2") cellrange(D54:M54)
 
keep D F H J L M
gen County = "Calhoun"
gen cnticpsr = 0150

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Chambers.xlsx, ///
   sheet("2") cellrange(D27:M27)
 
keep D F H J L M
gen County = "Chambers"
gen cnticpsr = 0170

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Cherokee.xlsx, ///
   sheet("2") cellrange(D29:M29)
 
keep D F H J L M   
gen County = "Cherokee"
gen cnticpsr = 0190

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Chilton.xlsx, ///
   sheet("2") cellrange(D24:M24)
 
keep D F H J L M  
gen County = "Chilton"
gen cnticpsr = 0210

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Choctaw.xlsx, ///
   sheet("2") cellrange(D38:M38)
 
keep D F H J L M 
gen County = "Choctaw"
gen cnticpsr = 0230

append using AL_2012.dta
save AL_2012.dta, replace

clear

import excel using Clarke.xlsx, ///
   sheet("2") cellrange(D33:M33)
 
keep D F H J L M
gen County = "Clarke"
gen cnticpsr = 0250

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Clay.xlsx, ///
   sheet("2") cellrange(D20:M20)

keep D F H J L M   
gen County = "Clay"
gen cnticpsr = 0270

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Cleburne.xlsx, ///
   sheet("2") cellrange(D20:M20)
 
keep D F H J L M   
gen County = "Cleburne"
gen cnticpsr = 0290

append using AL_2012.dta
save AL_2012.dta, replace


clear

import excel using Coffee.xlsx, ///
   sheet("2") cellrange(D35:M35)
 
keep D F H J L M  
gen County = "Coffee"
gen cnticpsr = 0310

append using AL_2012
save AL_2012, replace

clear

import excel using Colbert.xlsx, ///
   sheet("2") cellrange(D42:M42)
 
keep D F H J L M
gen County = "Colbert"
gen cnticpsr = 0330

append using AL_2012
save AL_2012, replace

clear

import excel using Conecuh.xlsx, ///
   sheet("2") cellrange(D32:M32)
 
keep D F H J L M
gen County = "Conecuh"
gen cnticpsr = 0350

append using AL_2012
save AL_2012, replace

clear

import excel using Coosa.xlsx, ///
   sheet("2") cellrange(D18:M18)
 
keep D F H J L M
gen County = "Coosa"
gen cnticpsr = 0370

append using AL_2012
save AL_2012, replace

clear

import excel using Covington.xlsx, ///
   sheet("2") cellrange(D31:M31)
 
keep D F H J L M
gen County = "Covington"
gen cnticpsr = 0390

append using AL_2012
save AL_2012, replace

clear

import excel using Crenshaw.xlsx, ///
   sheet("2") cellrange(D24:M24)
 
keep D F H J L M
gen County = "Crenshaw"
gen cnticpsr = 0410

append using AL_2012
save AL_2012, replace

clear

import excel using Cullman.xlsx, ///
   sheet("2") cellrange(D55:M55)
 
keep D F H J L M
gen County = "Cullman"
gen cnticpsr = 0430

append using AL_2012
save AL_2012, replace

clear

import excel using Dale.xlsx, ///
   sheet("2") cellrange(D25:M25)
 
keep D F H J L M
gen County = "Dale"
gen cnticpsr = 0450

append using AL_2012
save AL_2012, replace

clear

import excel using Dallas.xlsx, ///
   sheet("2") cellrange(D35:M35)
 
keep D F H J L M
gen County = "Dallas"
gen cnticpsr = 0470

append using AL_2012
save AL_2012, replace

clear

import excel using DeKalb.xlsx, ///
   sheet("2") cellrange(D57:M57)
 
keep D F H J L M
gen County = "DeKalb"
gen cnticpsr = 0490

append using AL_2012
save AL_2012, replace

clear

import excel using Elmore.xlsx, ///
   sheet("2") cellrange(D34:M34)
 
keep D F H J L M
gen County = "Elmore"
gen cnticpsr = 0510

append using AL_2012
save AL_2012, replace

clear

import excel using Escambia.xlsx, ///
   sheet("2") cellrange(D35:M35)
 
keep D F H J L M
gen County = "Escambia"
gen cnticpsr = 0530

append using AL_2012
save AL_2012, replace

clear

import excel using Etowah.xlsx, ///
    sheet("2") cellrange(D47:M47)
 
keep D F H J L M
gen County = "Etowah"
gen cnticpsr = 0550

append using AL_2012
save AL_2012, replace

clear

import excel using Fayette.xlsx, ///
    sheet("2") cellrange(D33:M33)
 
keep D F H J L M
gen County = "Fayette"
gen cnticpsr = 0570

append using AL_2012
save AL_2012, replace

clear

import excel using Franklin.xlsx, ///
    sheet("2") cellrange(D30:M30)
 
keep D F H J L M
gen County = "Franklin"
gen cnticpsr = 0590

append using AL_2012
save AL_2012, replace

clear

import excel using Geneva.xlsx, ///
    sheet("2") cellrange(D31:M31)
 
keep D F H J L M
gen County = "Geneva"
gen cnticpsr = 0610

append using AL_2012
save AL_2012, replace

clear

import excel using Greene.xlsx, ///
    sheet("2") cellrange(D20:M20)
 
keep D F H J L M
gen County = "Greene"
gen cnticpsr = 0630

append using AL_2012
save AL_2012, replace

clear

import excel using Hale.xlsx, ///
      cellrange(D4:M4)
 
keep D F H J L M
gen County = "Hale"
gen cnticpsr = 0650

append using AL_2012
save AL_2012, replace

clear

import excel using Henry.xlsx, ///
    sheet("2") cellrange(D19:M19)
 
keep D F H J L M
gen County = "Henry"
gen cnticpsr = 0670

append using AL_2012
save AL_2012, replace

clear

import excel using Houston.xlsx, ///
    sheet("2") cellrange(D32:M32)
 
keep D F H J L M
gen County = "Houston"
gen cnticpsr = 0690

append using AL_2012
save AL_2012, replace


clear

import excel using Jackson.xlsx, ///
    sheet("2") cellrange(D32:M32)
 
keep D F H J L M
gen County = "Jackson"
gen cnticpsr = 0710

append using AL_2012
save AL_2012, replace

clear

import excel using Jefferson.xlsx, ///
    sheet("2") cellrange(D184:M184)
 
keep D F H J L M
gen County = "Jefferson"
gen cnticpsr = 0730

append using AL_2012
save AL_2012, replace

clear

import excel using Lamar.xlsx, ///
    sheet("2") cellrange(D31:M31)
 
keep D F H J L M
gen County = "Lamar"
gen cnticpsr = 0750

append using AL_2012
save AL_2012, replace

clear

import excel using Lauderdale.xlsx, ///
    sheet("2") cellrange(D37:M37)
 
keep D F H J L M
gen County = "Lauderdale"
gen cnticpsr = 0770

append using AL_2012
save AL_2012, replace

clear

import excel using Lawrence.xlsx, ///
    sheet("2") cellrange(D35:M35)
 
keep D F H J L M
gen County = "Lawrence"
gen cnticpsr = 0790

append using AL_2012
save AL_2012, replace

clear

import excel using Lee.xlsx, ///
    sheet("2") cellrange(D29:M29)
 
keep D F H J L M
gen County = "Lee"
gen cnticpsr = 0810

append using AL_2012
save AL_2012, replace

clear

import excel using Limestone.xlsx, ///
     sheet("2") cellrange(D30:M30)
 
keep D F H J L M
   
gen County = "Limestone"
gen cnticpsr = 0830

append using AL_2012
save AL_2012, replace

clear

import excel using Lowndes.xlsx, ///
     sheet("2") cellrange(D18:M18)
 
keep D F H J L M 
gen County = "Lowndes"
gen cnticpsr = 0850

append using AL_2012
save AL_2012, replace

clear

import excel using Macon.xlsx, ///
     sheet("2") cellrange(D20:M20)
 
keep D F H J L M
gen County = "Macon"
gen cnticpsr = 0870

append using AL_2012
save AL_2012, replace

clear

import excel using Madison.xlsx, ///
     sheet("2") cellrange(D81:M81)
 
keep D F H J L M 
gen County = "Madison"
gen cnticpsr = 0890

append using AL_2012
save AL_2012, replace

clear

import excel using Marengo.xlsx, ///
     sheet("2") cellrange(D28:M28)
 
keep D F H J L M
gen County = "Marengo"
gen cnticpsr = 0910

append using AL_2012
save AL_2012, replace

clear


import excel using Marion.xlsx, ///
     sheet("2") cellrange(D26:M26)
 
keep D F H J L M  
gen County = "Marion"
gen cnticpsr = 0930

append using AL_2012
save AL_2012, replace

clear

import excel using Marshall.xlsx, ///
     sheet("2") cellrange(D44:M44)
 
keep D F H J L M
gen County = "Marshall"
gen cnticpsr = 0950

append using AL_2012
save AL_2012, replace

clear

import excel using Mobile.xlsx, ///
     sheet("2") cellrange(D113:M113)
 
keep D F H J L M
gen County = "Mobile"
gen cnticpsr = 0970

append using AL_2012
save AL_2012, replace

clear

import excel using Monroe.xlsx, ///
     sheet("2") cellrange(D37:M37)
 
keep D F H J L M
   
gen County = "Monroe"
gen cnticpsr = 0990

append using AL_2012

save AL_2012, replace

clear

/* NOTE: Montgomery County votes were reported using a vastly different format
than other counties. I created a second sheet with NY Times results. */

import excel using Montgomery.xlsx, ///
   sheet("NYTimes_Results") cellrange(D2:M2)

keep D F H J L M
gen County = "Montgomery"
gen cnticpsr = 1010

append using AL_2012
save AL_2012, replace

clear

import excel using Morgan.xlsx, ///
     sheet("2") cellrange(D50:M50)
 
keep D F H J L M
gen County = "Morgan"
gen cnticpsr = 1030

append using AL_2012
save AL_2012, replace

clear

import excel using Perry.xlsx, ///
     sheet("2") cellrange(D18:M18)
 
keep D F H J L M
gen County = "Perry"
gen cnticpsr = 1050

append using AL_2012
save AL_2012, replace

clear

import excel using Pickens.xlsx, ///
     sheet("2") cellrange(D25:M25)
 
keep D F H J L M 
gen County = "Pickens"
gen cnticpsr = 1070

append using AL_2012
save AL_2012, replace

clear

import excel using Pike.xlsx, ///
     sheet("2") cellrange(D34:M34)
 
keep D F H J L M   
gen County = "Pike"
gen cnticpsr = 1090

append using AL_2012
save AL_2012, replace

clear

import excel using Randolph.xlsx, ///
     sheet("2") cellrange(D29:M29)
 
keep D F H J L M
gen County = "Randolph"
gen cnticpsr = 1110

append using AL_2012
save AL_2012, replace

clear

import excel using Russell.xlsx, ///
     sheet("2") cellrange(D23:M23)
 
keep D F H J L M
gen County = "Russell"
gen cnticpsr = 1130

append using AL_2012
save AL_2012, replace

clear

import excel using Shelby.xlsx, ///
    sheet("2") cellrange(D53:M53)
 
keep D F H J L M  
gen County = "Shelby"
gen cnticpsr = 1170

append using AL_2012
save AL_2012, replace

clear


import excel using St_Clair.xlsx, ///
    sheet("2") cellrange(D37:M37)
 
keep D F H J L M  
gen County = "St. Clair"
gen cnticpsr = 1150

append using AL_2012
save AL_2012, replace

clear

import excel using Sumter.xlsx, ///
    sheet("2") cellrange(D19:M19)
 
keep D F H J L M  
gen County = "Sumter"
gen cnticpsr = 1190

append using AL_2012
save AL_2012, replace

clear

import excel using Talladega.xlsx, ///
    sheet("2") cellrange(D32:M32)
 
keep D F H J L M  
gen County = "Talladega"
gen cnticpsr = 1210

append using AL_2012
save AL_2012, replace

clear

import excel using Tallapoosa.xlsx, ///
    sheet("2") cellrange(D31:M31)
 
keep D F H J L M  
gen County = "Tallapoosa"
gen cnticpsr = 1230

append using AL_2012
save AL_2012, replace

clear

import excel using Tuscaloosa.xlsx, ///
    sheet("2") cellrange(D60:M60)
 
keep D F H J L M  
gen County = "Tuscaloosa"
gen cnticpsr = 1250

append using AL_2012
save AL_2012, replace

clear

import excel using Walker.xlsx, ///
    sheet("2") cellrange(D52:M52)
 
keep D F H J L M 
gen County = "Walker"
gen cnticpsr = 1270

append using AL_2012
save AL_2012, replace

clear

import excel using Washington.xlsx, ///
    sheet("2") cellrange(D23:M23)
 
keep D F H J L M 
gen County = "Washington"
gen cnticpsr = 1290

append using AL_2012
save AL_2012, replace

clear

import excel using Wilcox.xlsx, ///
cellrange(D4:M4) /* Data from NY Times */
 
keep D F H J L M
gen County = "Wilcox"
gen cnticpsr = 1310

append using AL_2012
save AL_2012, replace

clear

import excel using Winston.xlsx, ///
    sheet("2") cellrange(D24:M24)
 
keep D F H J L M 
gen County = "Winston"
gen cnticpsr = 1330

append using AL_2012

gen State = "Alabama"
gen sticpsr = 41
gen stfips = 1
gen uniqicpsr = (sticpsr * 10000) + cnticpsr
gen uniqfips = (stfips * 10000) + cnticpsr
rename D NVote_Obama
rename F NVote_Romney
rename H NVote_Goode
rename J NVote_Johnson
rename L NVote_Stein
rename M NVote_Total

save AL_2012, replace

clear

