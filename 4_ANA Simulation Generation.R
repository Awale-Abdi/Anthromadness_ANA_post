# Loading the required libraries
library(data.table)

# Loading the PCA coordinates from a .txt file via a relative path
input_file <- "4_PCA_ANA_Simulation.txt"  # Input file containing PCA coordinates
output_file <- "4_My_Simultated_ANA.txt"  # Output file for estimated ANA

# Loading the PCA data (comma-separated file)
pca_data <- fread(input_file, header = FALSE, sep = ",", stringsAsFactors = FALSE)

# Renaming the columns: First column is "Population", rest are PCA components (PC1, PC2, ...)
setnames(pca_data, c("Population", paste0("PC", 1:(ncol(pca_data) - 1))))

# Ensuring Population column exists
if (!"Population" %in% colnames(pca_data)) {
  stop("Error: 'Population' column missing from input file.")
}

# Converting numerical columns explicitly to prevent NA issues
pca_data_numeric <- as.data.frame(lapply(pca_data[, -1, with = FALSE], as.numeric))
rownames(pca_data_numeric) <- pca_data$Population

# Extracting Iberomaurusians (P3) and Anatolian-HG (P1)
P3 <- as.numeric(pca_data_numeric["Iberomaurusian", ])
P1 <- as.numeric(pca_data_numeric["Anatolian-HG", ])

# Checking if the values are read correctly
if (any(is.na(P3)) | any(is.na(P1))) {
  stop("Error: Missing or incorrectly formatted PCA values. Check input file.")
}

# Computing Euclidean distance between IBMs (P3) and AHGs (P1)
dist_P3_P1 <- sqrt(sum((P3 - P1)^2))

# Computing a dynamic scaling factor lambda based on PCA distances
lambda_factor <- dist_P3_P1 / sqrt(sum((P1 - P3)^2))

# Computing ANA's coordinates using the scaled equation:
# ANA = P3 + λ * (P3 - P1)
P2 <- P3 + lambda_factor * (P3 - P1)

# Formatting the output to match G25 coordinates style
ana_result <- c("My_Simulated_ANA", P2)
formatted_result <- paste(ana_result, collapse = ",")

# Writing the result to a .txt file
writeLines(formatted_result, output_file)

# Print completion message
cat("ANA Coordiates saved to", output_file, "\n")
