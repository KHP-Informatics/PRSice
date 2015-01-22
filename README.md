# PRSice
PRSice (pronounced 'precise') is a software package for calculating, applying, evaluating and plotting the results of polygenic risk scores

*********************

Authors: Jack Euesden, Cathryn M. Lewis and Paul F. O'Reilly  
Dockered by : Stephen Newhouse <stepen.j.newhouse@gmail.com>  

*********************

# PRSice: Polygenic Risk Score software

Publised in [Bioinformatics](http://bioinformatics.oxfordjournals.org/content/early/2014/12/28/bioinformatics.btu848.abstract)

**Summary:** A polygenic risk score (PRS) is a sum of trait-associated alleles across many genetic loci, typically weighted by effect sizes estimated from a genome-wide association study (GWAS). The application of PRS has grown in recent years as their utility for detecting shared genetic aetiology among traits has become appreciated; PRS can also be used to establish the presence of a genetic signal in underpowered studies, infer the genetic architecture of a trait, for screening in clinical trials, and can act as a biomarker for a phenotype. Here we present the first dedicated PRS software, PRSice (‘precise’), for calculating, applying, evaluating and plotting the results of polygenic risk scores. PRSice can calculate PRS at a large number of thresholds (“high resolution”) to provide the best-fit PRS, as well as provide results calculated at broad P-value thresholds, can thin SNPs according to linkage disequilibrium and P-value or use all SNPs, handles genotyped and imputed data, can calculate and incorporate ancestry-informative variables, and can apply PRS across multiple traits in a single run. We exemplify the use of PRSice via application to data on Schizophrenia, Major Depressive Disorder and Smoking, illustrate the importance of identifying the best-fit PRS, and estimate a P-value significance threshold for high-resolution PRS studies.

**Availability:** PRSice is written in R, including wrappers for bash data management scripts and PLINK-1.9 to minimise computational time. PRSice runs as a command-line program with a variety of user-options, and is freely available for download from http://PRSice.info

**Contact:** jack.euesden@kcl.ac.uk; paul.oreilly@kcl.ac.uk

**URL**: http://prsice.info/

*********************