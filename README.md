<h1 align="center">Multivariate Analysis & Computational Modeling with R | Population Genetics Case Study</h1>

This project showcases an **end-to-end computational analysis workflow** developed in **R** using population-level principal-component coordinates. I developed it to demonstrate multivariate analysis, distance-based modeling, simulation, clustering, interactive visualization, and interdisciplinary research using complex scientific data.

Although the project uses **population genetics and prehistoric North Africa** as its case study, the analytical techniques demonstrated, including **multivariate analysis, linear algebra, simulation, distance-based modeling, hierarchical clustering, and data visualization**, are broadly transferable across Data Science, bioinformatics, healthcare, scientific research, and other data-intensive fields.

Using **R**, Eurogenes Global25 coordinates, and published population-genetics research, I developed multiple PCA visualizations, coordinate-based affinity models, simulated population coordinates, hierarchical clustering models, and interactive comparative visualizations.

The resulting analysis supports a detailed article published on my anthropology blog, [**Anthromadness**](https://anthromadness.blogspot.com/), where the computational findings are integrated with published genetic and anthropological research. The project is an **exploratory computational reconstruction** rather than a substitute for formal population-genetic methods or newly sampled ancient DNA.

## 📖 Featured Research Article

The complete analytical interpretation, historical context, visualizations, methodology, and literature discussion are presented in the accompanying Anthromadness article:

### [Iberomaurusians Descend from a Unique Sub-Saharan African Lineage: Ancestral North African (ANA)](https://anthromadness.blogspot.com/2025/02/iberomaurusians-descend-from-unique-sub.html)

The article examines:

- Published ancestry models for Iberomaurusians
- Relationships between Iberomaurusians and Natufians
- African and Eurasian population structure
- Coordinate-based ancestry affinities
- Reconstruction of a hypothetical Ancestral North African population
- Potential ANA-related ancestry across North Africa and the Middle East
- Reference-population effects
- Questions for future ancient-DNA research

## 🎯 Project Goals

The project applies computational and multivariate techniques to investigate population structure and evaluate a hypothetical ancestral population model.

The primary goals were to:

- Analyze population structure using principal-component coordinates.
- Compare African and Eurasian population affinities.
- Develop coordinate-based ancestry estimates.
- Simulate a hypothetical Ancestral North African population.
- Evaluate simulated coordinates through PCA and clustering.
- Model ancestry patterns across comparative populations.
- Produce interactive and publication-oriented visualizations.
- Integrate quantitative results with interdisciplinary scientific research.


## 🏗️ Solution Architecture

#### Workflow

```text
Global25 PCA Coordinates
        ↓
Data Preparation
        ↓
Population Selection & Grouping
        ↓
Multivariate Analysis
        ↓
Distance-Based Modeling
        ↓
Linear-Algebraic Simulation
        ↓
PCA Validation
        ↓
Hierarchical Clustering
        ↓
Interactive Visualization
        ↓
Statistical Interpretation
        ↓
Interdisciplinary Research Synthesis
        ↓
Scientific Writing & Publication
```

#### Data

- **Primary Dataset:** Eurogenes Global25 Coordinates
- **Supporting Data:** Published ancient-DNA and population-genetics research
- **Data Type:** Population-level principal-component coordinates
- **Study Regions:** Africa, North Africa, the Middle East, and Eurasia
- **Research Focus:** Population structure, genetic affinity, simulation, and demographic history

#### Data Preparation

Prepared and structured population-level coordinate data by:

- Selecting relevant ancient and modern populations.
- Filtering population reference groups.
- Organizing coordinate datasets for comparative analysis.
- Calculating population-level coordinate averages.
- Reshaping data for modeling and visualization.
- Preparing reproducible analytical inputs across multiple R workflows.

#### Multivariate Analysis

Used precomputed **Eurogenes Global25 PCA coordinates** to examine:

- African-Eurasian population structure.
- Iberomaurusian positioning.
- Natufian and Anatolian hunter-gatherer relationships.
- Simulated ANA positioning.
- Population movement across major principal components.

The analysis uses Global25 coordinate space rather than calculating principal components directly from raw genomic data.

#### Distance-Based Modeling

Estimated relative population affinities by comparing coordinates with selected African and Eurasian reference clusters.

The workflow incorporated:

- Population-coordinate averaging.
- Euclidean-distance calculations.
- Comparative reference clusters.
- Proportional affinity estimation.
- Cross-population comparisons.

These outputs represent **coordinate-based affinity estimates**, not formal admixture proportions.

#### ANA Simulation

Developed a linear-algebraic simulation to infer hypothetical ANA coordinates from the observed displacement of Iberomaurusians relative to an Anatolian hunter-gatherer-related reference.

The conceptual relationship was:

```text
ANA = Iberomaurusian + λ(Iberomaurusian − AHG)
```

The scaling factor projects a hypothetical ancestral population along the same multivariate direction.

A separate Natufian-related simulation was also generated to compare the reconstruction with previously published ancestry models.

#### Hierarchical Clustering

Applied hierarchical clustering using:

- Euclidean distance.
- Population-level PCA coordinates.
- Hierarchical clustering algorithms.
- Dendrogram visualization.

This provided an additional method for examining population similarity beyond two-dimensional PCA projections.

#### Interactive Visualization

Developed interactive and publication-oriented visualizations using **ggplot2**, **Plotly**, and supporting R packages.

Outputs included:

- PCA scatter plots.
- Comparative ancestry charts.
- Interactive affinity visualizations.
- Simulated population projections.
- Hierarchical dendrograms.
- MENA ancestry-proportion charts.

#### Research Interpretation

Integrated computational outputs with published research in:

- Population genetics
- Ancient DNA
- Archaeology
- Biological anthropology

This interdisciplinary synthesis allowed quantitative results to be evaluated within a broader scientific and historical framework.

## 📊 Analytical Insights

#### Iberomaurusian Positioning

- Iberomaurusians occupied an intermediate position between the selected African and Eurasian reference populations within the Global25 framework.
- Their positioning was broadly compatible with substantial affinity toward both sides of the comparison.
- PCA positioning alone cannot establish definitive ancestry proportions.

#### Comparison with Published Estimates

- Coordinate-distance estimates broadly resembled previously published ancestry estimates for some populations.
- This convergence suggests potential analytical value in coordinate-based exploratory modeling.
- PCA distance should not, however, be interpreted as equivalent to formal admixture analysis.

#### Simulated ANA Positioning

- Simulated ANA coordinates clustered on the African side of the selected global PCA.
- The simulation also displayed directional relationships toward Eurasian populations.
- Within the assumptions of the model, this was compatible with a deeply divergent African-related population positioned near lineages related to later non-African groups.

#### Population Relationships

- Exploratory simulations produced a model in which Iberomaurusians and Natufians could represent differing combinations of Anatolian hunter-gatherer-related and deeply divergent African-related ancestry.
- The results resembled aspects of previously proposed demographic models.
- The analysis cannot determine the true direction, timing, or exact proportions of historical ancestry exchange.

#### Reference-Population Effects

- Estimated ancestry patterns changed depending on the populations selected as analytical references.
- Genetically distant reference populations can distort or misattribute deeply divergent ancestry.
- Reference selection therefore represents a major consideration when interpreting comparative population models.

## ⚠️ Project Limitations

- Global25 coordinates are reduced-dimensional summaries rather than raw genotype data.
- PCA distance is not equivalent to genetic drift or formal admixture proportions.
- The simulated ANA population is mathematically inferred rather than archaeogenetically sampled.
- Results depend heavily on reference-population selection.
- Two-dimensional PCA plots cannot represent all variation across 25 principal components.
- Euclidean similarity does not establish direct ancestry.
- Historical directionality cannot be inferred from clustering alone.
- Formal validation would require ancient DNA and methods such as qpAdm, qpGraph, D-statistics, or related population-genetic tests.

The outputs should therefore be interpreted as **hypothesis-generating computational models** rather than definitive reconstructions of population history.

## 📈 Analytical Recommendations

Based on the analysis:

- Validate exploratory coordinate-based models using formal population-genetic methods where appropriate.
- Test alternative reference populations to evaluate model sensitivity.
- Incorporate newly published ancient-DNA samples as they become available.
- Compare PCA-based simulations with independent genetic and archaeological evidence.
- Use multiple complementary analytical methods rather than relying on a single ancestry model.
- Treat simulated ancestral populations as hypotheses requiring independent empirical validation.

## 🛠️ Technical Skills Demonstrated

#### Programming

- R
- Script-Based Analytical Workflows
- Reproducible Data Analysis

#### Statistical & Quantitative Analysis

- Multivariate Analysis
- Principal Component Analysis (PCA) Interpretation
- Euclidean-Distance Modeling
- Linear Algebra
- Simulation
- Hierarchical Clustering
- Proportional Affinity Estimation
- Comparative Modeling

#### Data Analysis

- Exploratory Data Analysis
- Population-Level Analysis
- Comparative Analysis
- Statistical Interpretation
- Model Evaluation

#### Data Preparation

- Data Cleaning
- Population Filtering
- Coordinate Transformation
- Data Reshaping
- Group-Level Aggregation
- CSV & Text-File Processing

#### Data Visualization

- PCA Scatter Plots
- Interactive Visualizations
- Comparative Bar Charts
- Dendrograms
- Publication-Oriented Graphics
- Analytical Data Storytelling

#### Libraries & Software

- RStudio
- ggplot2
- ggrepel
- ggdendro
- ape
- data.table
- tidyr
- dplyr
- Plotly
- htmlwidgets
- reshape2

#### Research Communication

- Literature Synthesis
- Scientific Interpretation
- Methodological Documentation
- Interdisciplinary Research
- Long-Form Analytical Writing
- Public-Facing Scientific Communication

## 💡 What This Project Demonstrates

This project demonstrates the ability to independently design, execute, and communicate a computational research workflow combining multivariate analysis, simulation, statistical modeling, visualization, and interdisciplinary evidence synthesis.

Key competencies demonstrated include:

- Developing reproducible analytical workflows in R.
- Applying quantitative methods to complex multidimensional datasets.
- Designing custom computational simulations.
- Evaluating relationships through multiple complementary analytical methods.
- Producing interactive and publication-oriented visualizations.
- Critically evaluating methodological assumptions and limitations.
- Integrating quantitative results with external scientific evidence.
- Translating complex analytical findings into accessible research communication.

Although centered on population genetics, the **analytical reasoning, computational modeling, statistical analysis, simulation, visualization, and research communication** demonstrated are broadly transferable across Data Science, Business Analytics, bioinformatics, healthcare, scientific research, and other data-intensive fields.

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

## 🚀 Replicating the Project

#### Clone the Repository

```bash
git clone https://github.com/Awale-Abdi/Anthromadness_ANA_post.git
cd Anthromadness_ANA_post
```

#### Install Required Packages

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

#### Confirm the File Structure

Keep the source datasets inside:

```text
Datasets/
```

and the analytical scripts inside:

```text
R Scripts/
```

Generated files should be written to:

```text
Outputs/
```

#### Run the Analysis

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

The scripts reproduce:

- Global PCA visualizations.
- African-Eurasian affinity estimates.
- Simulated ANA coordinates.
- PCA projections containing ANA simulations.
- Global25-based hierarchical clustering.
- Interactive MENA ancestry-proportion visualizations.

## 📬 Contact Me

**Email**

Awaleiabdi@outlook.com

**LinkedIn**

[linkedin.com/in/awale-abdi](https://www.linkedin.com/in/awale-abdi/)
