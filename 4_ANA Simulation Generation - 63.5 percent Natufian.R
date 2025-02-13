# Loading the required libraries
library(data.table)

# Loading the PCA coordinates from a .txt file via a relative path
input_file <- "4_PCA_ANA_Simulation.txt"  # Input file containing PCA coordinates
output_file <- "4_ANA_Simulation_Natufian_as_63.5_percent.txt"  # Output file for estimated ANA

# Loading the PCA data
pca_data <- fread(input_file, header = FALSE, sep = ",", stringsAsFactors = FALSE)

# Renaming columns: First column is "Population", rest are PCA components (PC1, PC2, ...)
setnames(pca_data, c("Population", paste0("PC", 1:(ncol(pca_data) - 1))))

# Ensuring the Population column exists
if (!"Population" %in% colnames(pca_data)) {
  stop("Error: 'Population' column missing from input file.")
}

# Converting numerical columns explicitly to prevent NA issues
pca_data_numeric <- as.data.frame(lapply(pca_data[, -1, with = FALSE], as.numeric))
rownames(pca_data_numeric) <- pca_data$Population

# Extracting Iberomaurusians (P3) and Natufians (P1)
P3 <- as.numeric(pca_data_numeric["Iberomaurusian", ])
P1 <- as.numeric(pca_data_numeric["Natufian", ])

# Checking if the values are being read correctly
if (any(is.na(P3)) | any(is.na(P1))) {
  stop("Error: Missing or incorrectly formatted PCA values. Check input file.")
}

# Defining the assumed admixture proportions
t <- 0.635  # 63.5% Natufian (Eurasian)
s <- 1 - t  # 36.5% ANA (African)

# Computing ANA's coordinates using the equation:
# ANA = (IBM - (t * Natufian)) / s
P2 <- (P3 - (t * P1)) / s

# Formatting the output to match G25 coordinates style
ana_result <- c("ANA_Simulation_Natufian_as_63.5_percent", P2)
formatted_result <- paste(ana_result, collapse = ",")

# Writing the result to a .txt file
writeLines(formatted_result, output_file)

# Printing a completion message
cat("Dynamically inferred ANA coordinates saved to:", output_file, "\n")
