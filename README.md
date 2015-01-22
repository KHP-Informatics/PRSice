PRSice
============

**Software:** PRSice (pronounced 'precise') a software package for calculating, applying, evaluating and plotting the results of polygenic risk scores  

*********************
**Version:** 1.1  
**Authors:** Jack Euesden <jack.euesden@kcl.ac.uk>, Cathryn M. Lewis and Paul F. O'Reilly <paul.oreilly@kcl.ac.uk>  
**Publised in [Bioinformatics](http://bioinformatics.oxfordjournals.org/content/early/2014/12/28/bioinformatics.btu848.abstract)**
**Website:** http://PRSice.info  
See user manual for details on running PRSice: [PRSice_Manual_171214.pdf](https://github.com/KHP-Informatics/PRSice/blob/master/PRSice_Manual_171214.pdf)  
Vignette: [PRSice_VIGNETTE_v1.2.pdf](https://github.com/KHP-Informatics/PRSice/blob/master/PRSice_VIGNETTE_v1.2.pdf)  
*********************

### PRSice: Dockerised for your polygenic pleasure!
Here we provide a Docker image of PRSice v1.1, for you to run on your Windows or Mac or Linux box.  
_Why?_ ... So you can run it on any system!!!

**Dockered by:** Stephen Newhouse <stepen.j.newhouse@gmail.com>  

*********************

# PRSice: Polygenic Risk Score software

**Summary:** A polygenic risk score (PRS) is a sum of trait-associated alleles across many genetic loci, typically weighted by effect sizes estimated from a genome-wide association study (GWAS). The application of PRS has grown in recent years as their utility for detecting shared genetic aetiology among traits has become appreciated; PRS can also be used to establish the presence of a genetic signal in underpowered studies, infer the genetic architecture of a trait, for screening in clinical trials, and can act as a biomarker for a phenotype. Here we present the first dedicated PRS software, PRSice (‘precise’), for calculating, applying, evaluating and plotting the results of polygenic risk scores. PRSice can calculate PRS at a large number of thresholds (“high resolution”) to provide the best-fit PRS, as well as provide results calculated at broad P-value thresholds, can thin SNPs according to linkage disequilibrium and P-value or use all SNPs, handles genotyped and imputed data, can calculate and incorporate ancestry-informative variables, and can apply PRS across multiple traits in a single run. We exemplify the use of PRSice via application to data on Schizophrenia, Major Depressive Disorder and Smoking, illustrate the importance of identifying the best-fit PRS, and estimate a P-value significance threshold for high-resolution PRS studies.

**Availability:** PRSice is written in R, including wrappers for bash data management scripts and PLINK-1.9 to minimise computational time. PRSice runs as a command-line program with a variety of user-options, and is freely available for download from http://PRSice.info

*********************

## Example Output

The first two figures are based on a PRSice run over PGC Schizophrenia and RADIANT-UK Major Depressive Disorder data, as shown in our paper, while the quantile plot is produced from simulated data.

![fig1](/figs/PGC2_MANUSCRIPT_FIGURES_BARPLOT_2014-09-16-eps-converted-to.png)

![fig2](/figs/PGC2_MANUSCRIPT_FIGURES_POINTPLOT_2014-09-16-eps-converted-to.png)

![fig3](/figs/EXAMPLE_3_QUANTILES_1_QUANTILES_PLOT.png)

*********************

## Get me the Docker Version

**Intsall docker**  

Windows: https://docs.docker.com/installation/windows/  
Mac: https://docs.docker.com/installation/mac/  

**Build from scratch**

If on Windows or Mac then start **boot2docker**

```
## eg on Mac
boot2docker start
```

```
git clone https://github.com/KHP-Informatics/PRSice.git

cd PRSice/docker

docker build --rm=true -t compbio/prsice:1.1 .

```

**or** 

```
docker pull compbio/prsice:1.1
```



## Runnng PRSice

**Plink Versions**
The following PLINK executables are provided and installed in the docker images at :-  

- /usr/local/bin/plink1.9_i686  
- /usr/local/bin/plink1.9_x86_64  

Make sure you use the right binary for your system eg 64bit vx 32bit!

**Running PRSice on a 64bit machine (x86_64)**

See user manual for details on running PRSice: [PRSice_Manual_171214.pdf](https://github.com/KHP-Informatics/PRSice/blob/master/PRSice_Manual_171214.pdf)

```
docker run \
  --rm \
  -it \
  -v ${HOME}/pgrs:/home/pipeman: \
  -w /home/pipeman \
  -e HOME=/home/pipeman \
  -e USER=pipeman \
  --user pipeman \
  --name prsice \
  compbio/prsice:1.1 /bin/bash -c 
    "R \
    --file=/usr/local/bin/PRSice_v1.1.R \
    -q \
    --args 
    plink /usr/local/bin/plink1.9_x86_64 \
    base /home/pipeman/TOY_BASE_GWAS.assoc \
    target /home/pipeman/TOY_TARGET \
    slower 0 \
    sinc 0.01 \
    supper 0.5 \
    binary.target F"
```

http://www.carlboettiger.info/2014/09/22/containerizing-my-development-environment.html  







