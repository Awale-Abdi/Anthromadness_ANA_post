<h1 align="center">Anthromadness - Iberomaurusians descend from a unique Sub-Saharan African lineage: Ancestral North African (ANA)</h1>

This project applies data analytics, statistics, and visualization techniques to anthropological and population genetics research. Specifically, it explores the proposed **Ancestral North African (ANA)** genetic component.

## Key Goals of This Project

- **Generate Principal Component Analysis (PCA) plots** to visualize population clustering.
- **Construct a dendrogram** to analyze phylogenetic relationships.
- **Simulate an Ancestral North African (ANA) genetic component** and analyze its unique qualities.
- **Create interactive bar charts** to illustrate ancestry proportions.
- **Generate results in R** using linear algebra and Euclidean distance metrics.

## Technical Implementation

The project was developed using **R** with the following packages:

```r
library(ggplot2)       # For PCA and bar chart visualization
library(ggrepel)       # Improves label placement on PCA plots
library(ggdendro)      # Constructs dendrograms from hierarchical clustering
library(ape)           # Advanced phylogenetic tree analysis
library(data.table)    # Efficient data handling for large CSV files
library(tidyr)         # Data manipulation and transformation
library(dplyr)         # Data wrangling and filtering
library(plotly)        # Converts static plots into interactive visualizations
library(htmlwidgets)   # Saves interactive visualizations as HTML files
library(reshape2)      # Reshapes datasets for visualization
```

## How to Use

### **1. Clone the Repository**
```sh
git clone https://github.com/Awale-Abdi/Anthromadness_ANA_post.git
cd Anthromadness_ANA_post
```
### 2. Have the Datasets present in your working directory

The analyses rely on **Eurogenes Global25 PCA coordinates**:

- 1_First_PCA.txt → Needed for generating the first global PCA I shared on my blog
- 2_PCA_Bar_Chart.txt → Needed for generating the SSA-to-Eurasian ancestry proportion bar chart
- 3_PCA_Global_Simulation.txt → Needed for generating the global PCAs containing the ANA simulations
- 4_PCA_ANA_Simulation.txt → Needed for generating my ANA simulations
- 6_PCA_Dendro.txt → Needed for the Dendrogram
- 7_MENA_ANA_proportions.csv → Needed for generating the MENA ANA admixture chart
  
You must have all these files present in your working directory for the R scripts to run without errors. They are loaded via relative paths, so as long as they are in your working directory, everything should work fine.

### **3. Run the R Scripts**
Make sure you have R installed and the required packages. Download the datasets into your working directory then open RStudio and execute the scripts:

- 1_First PCA Generation.R → Generates first global PCA in my blog post
- 2_SSA-Eurasian Bar Chart Generation.R → Generates SSA:Eurasian ancestry chart
- 3_Simulation PCA Generation.R → Generate Global PCAs with ANA simulations in them
- 4_ANA Simulation Generation - 63.5 percent Natufian.R → Generates coords of Natufian-like ANA simulation
- 4_ANA Simulation Generation.R → Generates coords of my computed ANA simulation discussed on blog
- 6_Dendrogram Generation.R → Generates Dendrogram
- 7_MENA Ancestry Proportions Bar Chart Generation.R → Generates MENA ANA admixture chart

## Results

📖For a full breakdown of this project, check out the detailed write-up on my blog:
🔗 [Iberomaurusians descend from a unique Sub-Saharan African lineage: Ancestral North African (ANA)](https://anthromadness.blogspot.com/2025/02/iberomaurusians-descend-from-unique-sub.html)


## Citation & References
This project references peer-reviewed and preprint studies on ancient and modern genomes:

- Loosdrecht et al. (2018): [Science](https://www.science.org/doi/10.1126/science.aar8380)
- Lazaridis et al. (2018): [bioRxiv](https://www.biorxiv.org/content/10.1101/423079v1)
- Lipson et al. (2020): [Nature](https://www.nature.com/articles/s41586-020-1929-1)
- Pickrell et al. (2014): [PNAS](https://www.pnas.org/doi/full/10.1073/pnas.1313787111)

## Contact with me if you have any questions

📌 Email: Awaleiabdi@outlook.com
📌 LinkedIn: [Awale Abdi]([www.linkedin.com/in/awale-abdi](https://www.linkedin.com/in/awale-abdi/))

