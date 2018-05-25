# Omics Techniques

This repository is intended to support some sessions in the "Omics Techniques" course in the Bioinformatics degree. Overall this block deals with distinct aspects of quality checking in Omics studies.  

1. **Experimental** design. Instead of looking for problems in the data try to avoid them from the begining of the study. An appropriate experimental design can help researchers get the most from their data and alo avoid common error such as confusion between effects.

2. **Batch effect detection and removal**. One of most common problems in omics techniques is that, conciously or unadvertedly, samples are often generated in batches. Experimental design may be used to control known batches. There may be, however,  unknown ones which must be detected and whose effects must be removed.

3. **Quality control and quality checking in sequencing** Sequencing goes through different  phases and problems may appear in many of these steps. It is important to know how to detect the effects of this problems and what to do to mitigate its effects.

## Experimental design

These slides shows an introduction to experimental design concepts.

The lab session will do three things

- First, an introduction to bioconductor and a quick review of microarray technology will be perfomed.
- Next, a basic workflow for microarray analysis will be introduced.
- The "natural way" to reflect experimental design in data analysis is using linear models. This can be done in omics data analysis with the methodology introduced by the `limma` or `edgeR` packages.
- Additional resources for a omics data analysis and reporting will be introduced and used such as.
	-  Gene Expression Omnibus Database (GEO)
	-  R markdown
	-  github
	
## Experimental design lab

- In this lab we will explore how linear modelling can be used to

	- Deploy a certain experimental design in an omics study
	- Analyze data under this design.
	
- This illustration will be done using the most classic omics data, expression microarrays. Some supporting materials about microarrays 
can be found in the "lab-1-Microarrays" folder.

	- Additional information can be found in [https://github.com/alexsanchezpla/StatisticalAnalysisOfMicroarrayData](https://github.com/alexsanchezpla/StatisticalAnalysisOfMicroarrayData)


		
		

