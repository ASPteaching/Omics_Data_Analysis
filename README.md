# Omics Techniques

This repository is intended to support some sessions in the "Omics Techniques" course in the UB-UPC-UAB-UPF interuniversitary Bioinformatics Degree. 

Overall this block deals with distinct aspects of omics data analysis, mostly focused in gene expression data analysis.

0. **Get familiar with Bioconductor**
Bioconductor is a set of R packages that provides state-of-the art methods and tools for omics data analysis. This first session introduces the general ideas and shows how to work with it using an OOP aproach to Bioconductor classes.

1. **Experimental design**. Instead of looking for problems in the data try to avoid them from the begining of the study. An appropriate experimental design can help researchers get the most from their data and alo avoid common error such as confusion between effects.
After reviewing some key ideas of experimental design the practgical exercises focus on recognizing types and components of experimental designs in practical situations.

2. **Linear models**
Linear models provide the natural framework for analyzing data obtained from "designed experiments". This sessions reviews basic ideas of linear modelling and introduces the linear model framework for microarray data analysis. If time permits it will be extended to GLM for discrete (counts from NGS) data analysis.

3. **Batch effect detection and removal**. One of most common problems in omics techniques is that, conciously or unadvertedly, samples are often generated in batches. Experimental design may be used to control known batches. There may be, however,  unknown ones which must be detected and whose effects must be removed. We will review PCA and see how to use it to detect batch effects. We will also see examples of how to use a linear model to account for batch effects if batch factors are known, and which techniques are there available to deal with unknown factors.

4. **Quality control and quality checking in sequencing** Sequencing goes through different  phases and problems may appear in many of these steps. It is important to know how to detect the effects of this problems and what to do to mitigate its effects.

		
		

