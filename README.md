<h1 align="center">Population Genetics & Anthropological Data Analysis | Modeling Ancestral North African Ancestry with R</h1>

This project showcases an **end-to-end anthropological data analysis workflow** developed in R using population-level principal-component coordinates. I designed the analysis to explore the proposed **Ancestral North African (ANA)** lineage and its potential relationship to Iberomaurusian, Natufian, Sub-Saharan African, and West Eurasian populations.

The project combines **principal component analysis, coordinate-based ancestry estimation, linear algebra, simulation, hierarchical clustering, and interactive visualization**. Using Eurogenes Global25 coordinates and published population-genetics findings as the analytical foundation, I generated multiple PCA plots, ancestry-proportion charts, simulated ANA coordinates, and a dendrogram to investigate how a hypothetical ANA-related population might cluster within broader African and Eurasian genetic variation.

Although the case study focuses on prehistoric North Africa, the analytical capabilities demonstrated here such as multivariate analysis, distance-based modeling, simulation, clustering, data visualization, and technical research communication are transferable to genetics, anthropology, public health, biological research, and other data-intensive scientific fields.

The repository directly supports a detailed article published on my anthropology blog, **Anthromadness**, where I interpret the results alongside peer-reviewed and preprint research. The analysis should be understood as an **independent exploratory reconstruction**, not as a formal replacement for methods such as qpAdm, qpGraph, formal statistics, or newly sampled ancient DNA. :contentReference[oaicite:0]{index=0}

## 📖 Featured Research Article

The complete analytical interpretation, historical context, visualizations, methodological reasoning, and literature discussion are presented in the accompanying Anthromadness article:

### [Iberomaurusians Descend from a Unique Sub-Saharan African Lineage: Ancestral North African (ANA)](https://anthromadness.blogspot.com/2025/02/iberomaurusians-descend-from-unique-sub.html)

The article examines:

- Published ancestry models for Iberomaurusians
- The proposed relationship between Iberomaurusians and Natufians
- Global PCA positioning between African and Eurasian populations
- Coordinate-based estimates of Sub-Saharan and Eurasian affinity
- Reconstruction of a hypothetical ANA population
- Potential ANA-related ancestry across North Africa and the Middle East
- Limitations of reference-population selection
- Questions that future ancient-DNA research may resolve

## 🎯 Analytical Goals

The primary goals of this project were to:

- Visualize the global genetic positioning of Iberomaurusians
- Compare Iberomaurusian clustering with African and Eurasian reference groups
- Estimate relative Sub-Saharan and Eurasian affinities using PCA-coordinate distances
- Simulate a hypothetical Ancestral North African population
- Evaluate the simulated population through global PCA projections
- Construct a dendrogram using hierarchical clustering
- Visualize modeled ANA-related ancestry across Middle Eastern and North African populations
- Translate technical analysis into an accessible long-form research article

## 🏗️ Analytical Workflow

```text
Global25 PCA Coordinates
        ↓
Data Preparation in R
        ↓
Population Selection and Grouping
        ↓
Principal Component Visualization
        ↓
Distance-Based Ancestry Estimation
        ↓
Linear-Algebraic ANA Simulation
        ↓
Simulation Validation through PCA Positioning
        ↓
Hierarchical Clustering and Dendrogram Generation
        ↓
Interactive Ancestry-Proportion Visualizations
        ↓
Anthropological Interpretation and Blog Publication
```

## 🧬 Research Context

Ancient-DNA studies have modeled Iberomaurusians from Taforalt as deriving ancestry from both a West Eurasian-related source and a deeply divergent African-related source.

Published models have differed in their exact proportions and inferred direction of ancestry flow. Some analyses modeled Iberomaurusians using Natufian-related and Sub-Saharan African-related ancestry, while later work proposed that an Iberomaurusian-related population may instead have contributed ancestry to Natufians.

This project explores whether a hypothetical ANA-related population can be reconstructed geometrically from PCA coordinates and whether that simulated population occupies a plausible position relative to Iberomaurusians, Anatolian hunter-gatherers, Natufians, and selected African populations.

The resulting simulation is an **analytical approximation based on PCA geometry**. It does not establish the genome, exact ancestry composition, geographic origin, or historical reality of an unsampled population.

## 📊 Analytical Methods

### Principal Component Analysis Visualization

Generated PCA plots to examine:

- African–Eurasian population structure
- Iberomaurusian positioning
- Natufian and Anatolian hunter-gatherer relationships
- The location of simulated ANA coordinates
- Population movement along major principal components

The analyses use precomputed **Eurogenes Global25 PCA coordinates** rather than calculating principal components directly from raw genomic data.

### Distance-Based Ancestry Estimation

Estimated relative Sub-Saharan and Eurasian affinities by comparing population coordinates with two reference clusters:

**Sub-Saharan reference cluster**

- Mota
- Gumuz
- Mbuti

**Eurasian reference cluster**

- Western Hunter-Gatherers
- Anatolian Hunter-Gatherers

Mean PCA coordinates and Euclidean distances were used to generate proportional estimates of relative proximity to each cluster.

These values should be interpreted as **coordinate-based affinity estimates**, not as formal admixture proportions.

### ANA Simulation

A hypothetical ANA coordinate set was inferred using linear algebra and the observed displacement of Iberomaurusians from an Anatolian hunter-gatherer-related reference.

The conceptual relationship was:

```text
ANA = Iberomaurusian + λ(Iberomaurusian − AHG)
```

The scaling factor was used to project a hypothetical ancestral population along the same multivariate direction.

A separate Natufian-related simulation was also generated to compare the exploratory reconstruction with earlier published ancestry models.

### Hierarchical Clustering

A dendrogram was generated using:

- Euclidean distance
- Hierarchical clustering
- Population-level PCA coordinates
- Dendrogram visualization in R

This provided an additional way to inspect similarity patterns beyond two-dimensional PCA projections.

### Interactive Ancestry Visualizations

Interactive bar charts were developed with Plotly to display:

- Relative Sub-Saharan and Eurasian affinities
- Modeled ANA-related ancestry
- Comparative ancestry proportions across populations
- Middle Eastern and North African population patterns

## 🔍 Principal Analytical Observations

### Iberomaurusian PCA Positioning

Within the selected Global25 coordinate framework, Iberomaurusians occupy an intermediate position between the chosen African and Eurasian reference populations.

Their positioning appears broadly compatible with substantial ancestry related to both sides of that comparison, although PCA placement alone cannot provide definitive ancestry percentages.

### Similarity to Published Estimates

The coordinate-distance procedure produced estimates that broadly resembled previously published ancestry estimates for some populations.

This convergence is analytically interesting, but it should not be treated as proof that PCA distances are equivalent to formal admixture modeling.

### Simulated ANA Positioning

The simulated ANA coordinates cluster on the African side of the selected global PCA while displaying a directional relationship toward Eurasian populations.

Within the assumptions of the model, this is consistent with a population that may have diverged near lineages ancestral or related to later non-African groups without necessarily participating in the full Eurasian population bottleneck.

### Iberomaurusian and Natufian Relationships

The exploratory simulations suggest a possible model in which Iberomaurusians and Natufians represent differing combinations of:

- An Anatolian hunter-gatherer-related population
- A deeply divergent African-related population

This resembles aspects of previously proposed models, but the PCA-based reconstruction cannot determine the true direction, timing, or exact proportions of ancestry exchange.

### Reference-Population Effects

The results illustrate how ancestry estimates can change depending on the populations chosen as references.

A deeply divergent ancestry component may be underestimated or misattributed when available reference populations are genetically distant from the true ancestral source.

## ⚠️ Methodological Limitations

This project is an exploratory analytical exercise and has several important limitations:

- Global25 coordinates are reduced-dimensional summaries, not raw genotype data
- PCA distance is not equivalent to genetic drift or formal admixture proportion
- The simulated ANA population is mathematically inferred rather than archaeogenetically sampled
- The analysis depends heavily on reference-population selection
- Two-dimensional plots cannot capture all variation across 25 principal components
- Euclidean similarity does not establish direct ancestry
- Historical directionality cannot be inferred from clustering alone
- Formal validation would require ancient DNA and methods such as qpAdm, qpGraph, D-statistics, or related population-genetic tests

The outputs are therefore best interpreted as **hypothesis-generating visual and quantitative models**.

## 🛠️ Technical Skills Demonstrated

#### R Programming

- R
- RStudio
- Script-based analytical workflows
- Reproducible data analysis
- Package management

#### Statistical and Quantitative Analysis

- Principal-component coordinate analysis
- Euclidean-distance calculations
- Linear algebra
- Simulation
- Hierarchical clustering
- Proportional affinity estimation

#### Data Preparation

- Data cleaning
- Population filtering
- Coordinate transformation
- Data reshaping
- Group-level aggregation
- CSV and text-file processing

#### Data Visualization

- PCA scatter plots
- Interactive bar charts
- Dendrograms
- Population labels
- Comparative ancestry visualizations
- Publication-oriented graphics

#### Research Communication

- Literature synthesis
- Scientific interpretation
- Long-form analytical writing
- Methodological documentation
- Public-facing research communication
- Translating technical findings for non-specialist readers

## 📦 R Packages

```r
library(ggplot2)       # Statistical visualization
library(ggrepel)       # PCA label placement
library(ggdendro)      # Dendrogram visualization
library(ape)           # Phylogenetic analysis
library(data.table)    # Efficient data handling
library(tidyr)         # Data reshaping
library(dplyr)         # Data transformation
library(plotly)        # Interactive visualization
library(htmlwidgets)   # HTML widget export
library(reshape2)      # Dataset restructuring
```

## 💡 What This Project Demonstrates

This project demonstrates the ability to independently develop a multidisciplinary analytical case study connecting quantitative analysis with anthropological research.

Specifically, it showcases proficiency in:

- R programming
- Multivariate data analysis
- Population-genetics visualization
- PCA-coordinate interpretation
- Linear-algebraic simulation
- Distance-based modeling
- Hierarchical clustering
- Interactive visualization
- Reproducible research
- Literature synthesis
- Analytical storytelling
- Scientific communication

It also demonstrates the ability to extend an analytical project beyond code by integrating the results into a complete public-facing research article.

## 📁 Repository Structure

```text
Datasets/
    1_First_PCA.txt
    2_PCA_Bar_Chart.txt
    3_PCA_Global_Simulation.txt
    4_PCA_ANA_Simulation.txt
    6_PCA_Dendro.txt
    7_MENA_ANA_proportions.csv

Miscellaneous/
    Supporting and manually edited visual assets

Outputs/
    1_First_PCA.jpg
    2_SSA_Eurasian_Bar_Chart.html
    2_SSA_Eurasian_Results.csv
    3_Simulation_PCA_1.jpg
    3_Simulation_PCA_2.jpg
    4_ANA_Simulation_*.jpg
    4_My_Simulated_ANA.txt
    6_G25_Based_Dendrogram_*.jpg
    7_MENA_Ancestry_Bar_Chart.html

R Scripts/
    1_First PCA Generation.R
    2_SSA-Eurasian Bar Chart Generation.R
    3_Simulation PCA Generation.R
    4_ANA Simulation Generation - 63.5 percent Natufian.R
    4_ANA Simulation Generation.R
    6_Dendrogram Generation.R
    7_MENA Ancestry Proportions Bar Chart Generation.R

.gitattributes
README.md
```

## 📋 Replicating the Project

### Clone the Repository

```bash
git clone https://github.com/Awale-Abdi/Anthromadness_ANA_post.git
cd Anthromadness_ANA_post
```

### Install the Required Packages

```r
install.packages(c(
  "ggplot2",
  "ggrepel",
  "ggdendro",
  "ape",
  "data.table",
  "tidyr",
  "dplyr",
  "plotly",
  "htmlwidgets",
  "reshape2"
))
```

### Confirm the File Structure

The scripts use relative file paths. Keep the datasets inside:

```text
Datasets/
```

and the R scripts inside:

```text
R Scripts/
```

Generated files should be written to:

```text
Outputs/
```

### Run the Scripts

Execute the scripts in numerical order:

```text
1_First PCA Generation.R
2_SSA-Eurasian Bar Chart Generation.R
3_Simulation PCA Generation.R
4_ANA Simulation Generation - 63.5 percent Natufian.R
4_ANA Simulation Generation.R
6_Dendrogram Generation.R
7_MENA Ancestry Proportions Bar Chart Generation.R
```

The scripts generate:

- Global PCA visualizations
- Sub-Saharan–Eurasian affinity estimates
- Simulated ANA coordinates
- PCA projections containing ANA simulations
- A Global25-based dendrogram
- Interactive MENA ancestry-proportion charts

## 📚 Research Sources

1. **van de Loosdrecht et al. (2018)**  
   *Pleistocene North African genomes link Near Eastern and sub-Saharan African human populations.*  
   Science, 360(6387), 548–552.  
   [DOI: 10.1126/science.aar8380](https://doi.org/10.1126/science.aar8380)

2. **Lazaridis et al. (2018)**  
   *Paleolithic DNA from the Caucasus reveals core of West Eurasian ancestry.*  
   bioRxiv preprint.  
   [DOI: 10.1101/423079](https://doi.org/10.1101/423079)

3. **Lipson et al. (2020)**  
   *Ancient West African foragers in the context of African population history.*  
   Nature, 577, 665–670.  
   [DOI: 10.1038/s41586-020-1929-1](https://doi.org/10.1038/s41586-020-1929-1)

4. **Pickrell et al. (2014)**  
   *Ancient west Eurasian ancestry in southern and eastern Africa.*  
   Proceedings of the National Academy of Sciences, 111(7), 2632–2637.  
   [DOI: 10.1073/pnas.1313787111](https://doi.org/10.1073/pnas.1313787111)

## 📬 Contact Me

**Email**

Awaleiabdi@outlook.com

**LinkedIn**

[linkedin.com/in/awale-abdi](https://www.linkedin.com/in/awale-abdi/)
