# Abbott_Bailey_ANNALS_2021
 
This repository holds the data, processing scripts, merging scripts, analysis scripts and log files for a 2021 Annals publication. Files that are most likely to be of interest are: 

1) The appendix associated with the publication
annals_pub/Appendix_for_ANNALS_publication.txt

2)The codebook associated with the final dataset
annals_pub/Analysis/Analysis Data Dictionary.xlsx

3)The dataset used for the analyses in the publication
annals_pub/Analysis/Nov Submission/analysis_collapse.dta

4)The Stata log file of the analyses associated with the publication
annals_pub/Analysis/Nov Submission/final_analysis_and_checks.smcl

It is strongly recommended that you use analysis_collapse.dta to recreate the analyses rather than rebuild the dataset on your own, however all the original files are in the repository and can be merged by running annals_pub/FullMerge.do which merges all data together, then run annals_pub/Analysis/Nov Submission/analysis_data.do which collapses the data into countycluster unit of observation from county unit of observation. 

For questions about the data or analyses, please contact the corresponding author for the repository: Rebecca Abbott rabbot3@uic.edu
