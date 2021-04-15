


capture log close
clear all
import delimited DECENNIALSF12010.P2_data_with_overlays_2020-10-15T134507.csv

keep if state== "Alabama"| state== "Arkansas" | state== "Florida" | ///
state== "Georgia" | state== "Kentucky" | state== "Tennessee" | ///
 state== "Virginia" | state== "Mississippi" | state== "Louisiana" | /// 
 state== "NorthCarolina" |  state== "SouthCarolina" 

 rename geo_id uniqfips
 
 save urban_rural.dta,replace
 clear all
