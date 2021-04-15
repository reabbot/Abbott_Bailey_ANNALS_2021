
Last updated 4-14-21
Corresponding Author: Rebecca Abbott rabbot3@uic.edu
About this folder: In this folder you will find data and corresponding analyses. It is strongly recommended that if you use one of the following final datasets, to prevent yourself from having to rebuild the data entirely. 

	analysis_collapse.dta (also saved as analysisA.dta)-data used in our analyses

	00analysis_collapse.dta (also saved as analysisB.dta)-same ase analysis_collapsed.dta but with observations dropped where there were zero lynchings and zero averted lynchings in the county cluster. 


********************
analysis_data.do
********************
Reads in the FullMerge.dta which is all of the input data merged. It then does some pre-processing and collapses the data by county cluster. This file generates analysis_collapse.dta and 00analysis_collapse.dta. These two files contain the same data except 00analysis_collapse.dta drops all  observations where there were 0 lynchings and 0 averted lynchings. 


*************
analysis.do- 
**************
Runs all of the robustness check analyses in these files: 1A, 1B, 2A, 2B, .... 16A, 16B. These are different models we designed to test our theory. Please note anaylsis.do reads in both analysis_collapse.dta and 00analysis_collapse.dta these are the data collapsed by county cluster. 00analysis_collapse.dta is the same as analysis_collapse.dta but with the counties with zero threatened  or completed lynchings. All analyses files labeled B (ex. 1B, 2B, 3B etc.) use this data as a check to make sure counties with 0 lynchings or threatened lynchings are not significantly different from other counties. 


*********************
final_analysis_and_checks.do
************************
Generates final_analysis_and_checks.smcl and graphs in this folder. Those wishing to recreate our findings should rely on this do file. 


******************
.gph files
*******************
These were generated prior to creating the final dataset collapsed by cluster and are just for robustness checks. 


*******************************
1A, 1B, 2A, 2B, .... 16A, 16B.smcl
*********************************
These are log files for different robustness checks we ran

*************************
.png files
**************************
These are graphs from our final analyses, not all made it into the publication but they are generated from the analyses that did go into the publication. 


*********************
regressiontables.xlsx and Table1.docx
***************************
Different versions of our table one in the paper.

