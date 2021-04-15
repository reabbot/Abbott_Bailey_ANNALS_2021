/* This file begun June of 2020 to merge data files from the 1890 census (both
agriculture and population) with the Horan & Hargis cluster files. */


clear all

*updated 7.8.20 uniqicpsr 450235 was recoded to uniqfips 666 to remove duplicates
		
		
*Merging historical demographic and agriculture data
		use "Demog_County_1890.dta"
		*replace uniqfips=666 if uniqicpsr == 450235
		replace uniqfips= uniqfips*10
		save "Demog_County_1890_edit.dta", replace
		clear all

		use "Ag_County_1890.dta"
		*replace uniqfips=666 if uniqicpsr == 450235
		replace uniqfips= uniqfips*10
		save "Ag_County_1890_edit.dta", replace
		clear all


		use "Demog_County_1890_edit.dta"
		merge 1:1 uniqfips uniqicpsr using "Ag_County_1890_edit.dta"

		drop _merge
		rename County County_hist
		save "Demog_Ag_1890.dta", replace
		
		
*Merging cluster data to historical demographic/agriculture
		merge 1:1 uniqfips uniqicpsr using "AllStates_Clust.dta"
		rename County county_clust
		rename totpop totpop1890
		drop _merge

		replace uniqicpsr= uniqicpsr/10
		replace uniqfips= uniqfips/10
save "Demog_Ag_1890.dta", replace
clear all
/*

. merge 1:1 uniqfips using "AllStates_Clust.dta"

    Result                           # of obs.
    -----------------------------------------
    not matched                           128
        from master                         7  (_merge==1)
        from using                        121  (_merge==2)

    matched                               779  (_merge==3)
    -----------------------------------------

. 
*****updated 7.8.20
*** 5 Virginia counties not in cluster data (_merge == 1):  ELIZABETH CITY, 
     NANSEMOND, NORFOLK, WARWICK, and PRINCESS ANNE. These are all counties that were
	 disbanded.
*added WARWICK above check with amy 7.8.20

*** 121 counties that were in the cluster data but not in the original 1890 census
    data.
	

. tab State if _merge==2

 Name of state |      Freq.     Percent        Cum.
---------------+-----------------------------------
       Alabama |          1        0.83        0.83
       Florida |         22       18.18       19.01
       Georgia |         24       19.83       38.84
     Louisiana |          6        4.96       43.80
   Mississippi |          7        5.79       49.59
North Carolina |          4        3.31       52.89
South Carolina |         11        9.09       61.98
     Tennessee |          1        0.83       62.81
      Virginia |         45       37.19      100.00
---------------+-----------------------------------
         Total |        121      100.00


Hand checked county / parish / city names:
 -> 50% sample in AL, FL, GA,LA, MS, NC & SC - all were established after1890
 -> In Virginia, all are independent cities (by name); checked several of them 
    and they seem to have been created after 1890
	 
*/



