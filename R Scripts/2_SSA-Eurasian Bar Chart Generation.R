# Loading the required libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(plotly)
library(htmlwidgets)

# Loading the PCA coordinates from a .txt file via a relative path
file_path <- "PCA_Bar_Chart.txt"
pca_data <- read.table(file_path, sep=",", header=FALSE, stringsAsFactors=FALSE, check.names=FALSE)

# Extracting the sample names and PCA coordinates
colnames(pca_data) <- c("Population", paste0("PC", 1:(ncol(pca_data) - 1)))
pca_data$Population <- trimws(pca_data$Population)  # Remove leading/trailing spaces

# Converting the pca_data to a proper dataframe and setting up the row names
rownames(pca_data) <- pca_data$Population  
pca_data <- pca_data[, -1]  # Remove "Population" column after setting row names

# 🔹 Ensuring the row names remain EXACTLY as they are in the dataset (was experiencing issues)
original_names <- read.table(file_path, sep=",", header=FALSE, stringsAsFactors=FALSE)[, 1]
rownames(pca_data) <- original_names

# Defining the reference groups for "SSA" and "Eurasian"
SSA_refs <- c("Mbuti", "Mota", "Gumuz")
eurasian_refs <- c("Anatolian-HG", "Villabruna")

# Checking for mismatched reference names
mismatches <- setdiff(c(SSA_refs, eurasian_refs), rownames(pca_data))
if (length(mismatches) > 0) {
  cat("⚠️ WARNING: Some reference populations are missing or renamed in R. Checking for auto-renamed versions...\n")
  
  # Attempting to find renamed versions by checking altered names in R
  corrected_refs <- sapply(c(SSA_refs, eurasian_refs), function(name) {
    possible_match <- rownames(pca_data)[grep(name, rownames(pca_data))]
    if (length(possible_match) == 1) return(possible_match)
    return(name)  # Keeping the original names if no match is found
  })
  
  # Updating the reference lists with corrected names
  SSA_refs <- corrected_refs[1:length(SSA_refs)]
  eurasian_refs <- corrected_refs[(length(SSA_refs) + 1):length(corrected_refs)]
  
  cat("✔️ Updated references after matching:", SSA_refs, eurasian_refs, "\n")
}

# Computing the mean PCA coordinates for SSA and Eurasian clusters
SSA_mean <- colMeans(pca_data[SSA_refs, , drop=FALSE])
eurasian_mean <- colMeans(pca_data[eurasian_refs, , drop=FALSE])

# Setting up a function for computing ancestry proportions
compute_ancestry <- function(pop_coords) {
  if (any(is.na(pop_coords))) return(c(NA, NA))  # Avoid NaN errors
  
  d_SSA <- sqrt(sum((pop_coords - SSA_mean)^2))
  d_eurasian <- sqrt(sum((pop_coords - eurasian_mean)^2))
  
  if (d_SSA + d_eurasian == 0) return(c(NA, NA))  # Prevent division by zero
  
  SSA_percent <- (d_eurasian / (d_SSA + d_eurasian)) * 100
  eurasian_percent <- (d_SSA / (d_SSA + d_eurasian)) * 100
  
  return(c(SSA=SSA_percent, Eurasian=eurasian_percent))
}

# Defining target populations (excluding reference populations)
exclude_pops <- c(SSA_refs, eurasian_refs, "Yoruba")
target_pops <- setdiff(rownames(pca_data), exclude_pops)

# Applying a function to all target populations
results <- as.data.frame(t(apply(pca_data[target_pops, , drop=FALSE], 1, compute_ancestry)))

# Saving results to a csv file
output_filename <- "SSA_Eurasian_Results.csv"
write.csv(results, output_filename, row.names=TRUE)

cat(paste("✅ Ancestry calculations saved successfully as", output_filename, "in the working directory.\n"))

# Converting the results dataframe from wide to long format
results_long <- results %>%
  mutate(Population = rownames(.)) %>%
  pivot_longer(cols = c("SSA", "Eurasian"), names_to = "Ancestry", values_to = "Percentage")

# Defining the desired order for populations to be displayed
desired_order <- c("Iberomaurusian", "Biher-Tigrinya", "Tigray-Tigrinya", "Amhara", "Beta-Israel", 
                   "Agaw", "Saho", "Afar", 
                   "Oromo", "Somali")

# Converting Population column to a factor with the specified order
results_long$Population <- factor(results_long$Population, levels=desired_order)

# Creating the ordered ggplot
p <- ggplot(results_long, aes(x=Population, y=Percentage, fill=Ancestry, text=paste0(Ancestry, ": ", round(Percentage, 2), "%"))) +
  geom_bar(stat="identity", position="stack") +
  coord_flip() +  # Keeps vertical bars
  theme_minimal() +
  scale_fill_manual(values=c("SSA"="#e31a1c", "Eurasian"="#1f78b4")) +  # Red for SSA, Blue for Eurasian
  labs(title="Based on G25 Clustering Positions", x="", y="")

# Converting the ggplot to an interactive plotly plot
interactive_plot <- ggplotly(p, tooltip="text")

# Displaying the interactive plot
interactive_plot

# Defining HTML output file's name
html_filename <- "2_SSA_Eurasian_Bar_Chart.html"

# Saving the interactive plot to HTML
saveWidget(interactive_plot, file=html_filename, selfcontained=TRUE)

cat(paste("✅ Interactive plot saved successfully as", html_filename, "in the working directory.\n"))
