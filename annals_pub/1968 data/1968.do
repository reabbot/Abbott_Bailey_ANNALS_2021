/*This file processes Votes 1968.dta for merging */

clear all
use Votes_1968.dta


/*5 counties appear to be missing values for [cnticpsr NVote_Dem NVote_Rep 
NVote_Wallace NVote_Other NVote_Total uniqicpsr uniqfips] all the missing values 
of some variations of 9999 these were recoded to .
Also one instance of -397 votes was recoded to postive 397 it appears to be a 
real value and the negative is the mistake. 
*/
*Recoding missing values to "." 
recode cnticpsr 9999=.
recode NVote_Dem 9999999=.
recode NVote_Rep 9999999=.
recode NVote_Wallace 9999999=.
recode NVote_Other 9999999=.
recode NVote_Other  -397=397
recode NVote_Total 9999999=.
recode uniqicpsr 409999=.
recode uniqfips 519999=.


replace uniqfips= uniqfips/10
replace uniqicpsr=uniqicpsr/10

rename NVote_Total NVote_Total1968

save 1968.dta, replace
clear all
