/* This file was created March 2020 by AKB. It reads in results from the 2016
Alabama Republican primaries -- an Excel spreadsheet with a separate tab for 
each county -- and creates a single Stata data file for merging with the county-
level results from other states. This involves assigning ICPSR codes for the 
state, overall, and for each county, as well as a unique geographic identifier.
*/

version 15.1

cd H:\Lynching\Trump_Lynch\Primary_Elections

import excel using AL_2016_Primary.xlsx, ///
   sheet("Autauga") cellrange(B14:B14)
   
gen County = "Autauga"

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Baldwin") cellrange(B14:B14)
   
gen County = "Baldwin"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Barbour") cellrange(B14:B14)
   
gen County = "Barbour"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Bibb") cellrange(B14:B14)
   
gen County = "Bibb"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Blount") cellrange(B14:B14)
   
gen County = "Blount"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Bullock") cellrange(B14:B14)
   
gen County = "Bullock"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Butler") cellrange(B14:B14)
   
gen County = "Butler"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Calhoun") cellrange(B14:B14)
   
gen County = "Calhoun"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Chambers") cellrange(B14:B14)
   
gen County = "Chambers"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Cherokee") cellrange(B14:B14)
   
gen County = "Cherokee"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Chilton") cellrange(B14:B14)
   
gen County = "Chilton"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Choctaw") cellrange(B14:B14)
   
gen County = "Choctaw"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Clarke") cellrange(B14:B14)
   
gen County = "Clarke"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Clay") cellrange(B14:B14)
   
gen County = "Clay"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Cleburne") cellrange(B14:B14)
   
gen County = "Cleburne"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Coffee") cellrange(B14:B14)
   
gen County = "Coffee"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Colbert") cellrange(B14:B14)
   
gen County = "Colbert"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Conecuh") cellrange(B14:B14)
   
gen County = "Conecuh"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Coosa") cellrange(B14:B14)
   
gen County = "Coosa"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Covington") cellrange(B14:B14)
   
gen County = "Covington"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Crenshaw") cellrange(B14:B14)
   
gen County = "Crenshaw"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Cullman") cellrange(B14:B14)
   
gen County = "Cullman"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Dale") cellrange(B14:B14)
   
gen County = "Dale"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Dallas") cellrange(B14:B14)
   
gen County = "Dallas"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("DeKalb") cellrange(B14:B14)
   
gen County = "DeKalb"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Elmore") cellrange(B14:B14)
   
gen County = "Elmore"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Escambia") cellrange(B14:B14)
   
gen County = "Escambia"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Etowah") cellrange(B14:B14)
   
gen County = "Etowah"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Fayette") cellrange(B14:B14)
   
gen County = "Fayette"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Franklin") cellrange(B14:B14)
   
gen County = "Franklin"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Geneva") cellrange(B14:B14)
   
gen County = "Geneva"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Greene") cellrange(B14:B14)
   
gen County = "Greene"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Hale") cellrange(B14:B14)
   
gen County = "Hale"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Henry") cellrange(B14:B14)
   
gen County = "Henry"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Houston") cellrange(B14:B14)
   
gen County = "Houston"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Jackson") cellrange(B14:B14)
   
gen County = "Jackson"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Jefferson") cellrange(B14:B14)
   
gen County = "Jefferson"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Lamar") cellrange(B14:B14)
   
gen County = "Lamar"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Lauderdale") cellrange(B14:B14)
   
gen County = "Lauderdale"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Lawrence") cellrange(B14:B14)
   
gen County = "Lawrence"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Lee") cellrange(B14:B14)
   
gen County = "Lee"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Limestone") cellrange(B14:B14)
   
gen County = "Limestone"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Lowndes") cellrange(B14:B14)
   
gen County = "Lowndes"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Macon") cellrange(B14:B14)
   
gen County = "Macon"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Madison") cellrange(B14:B14)
   
gen County = "Madison"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Marengo") cellrange(B14:B14)
   
gen County = "Marengo"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Marion") cellrange(B14:B14)
   
gen County = "Marion"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Marshall") cellrange(B14:B14)
   
gen County = "Marshall"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Mobile") cellrange(B14:B14)
   
gen County = "Mobile"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Monroe") cellrange(B14:B14)
   
gen County = "Monroe"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Montgomery") cellrange(B14:B14)
   
gen County = "Montgomery"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Morgan") cellrange(B14:B14)
   
gen County = "Morgan"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Perry") cellrange(B14:B14)
   
gen County = "Perry"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Pickens") cellrange(B14:B14)
   
gen County = "Pickens"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Pike") cellrange(B14:B14)
   
gen County = "Pike"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Randolph") cellrange(B14:B14)
   
gen County = "Randolph"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Russell") cellrange(B14:B14)
   
gen County = "Russell"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Shelby") cellrange(B14:B14)
   
gen County = "Shelby"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("St. Clair") cellrange(B14:B14)
   
gen County = "St. Clair"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Sumter") cellrange(B14:B14)
   
gen County = "Sumter"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Talladega") cellrange(B14:B14)
   
gen County = "Talladega"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Tallapoosa") cellrange(B14:B14)
   
gen County = "Tallapoosa"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Tuscaloosa") cellrange(B14:B14)
   
gen County = "Tuscaloosa"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Walker") cellrange(B14:B14)
   
gen County = "Walker"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Washington") cellrange(B14:B14)
   
gen County = "Washington"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Wilcox") cellrange(B14:B14)
   
gen County = "Wilcox"

append using AL_Trump

save AL_Trump, replace

clear

import excel using AL_2016_Primary.xlsx, ///
   sheet("Winston") cellrange(B14:B14)
   
gen County = "Winston"

append using AL_Trump

rename B NTrump

gen state = "Alabama"
gen stcode = 41

save AL_Trump, replace

clear














