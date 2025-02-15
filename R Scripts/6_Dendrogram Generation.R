# Loading the required libraries
library(ape)
library(ggdendro)
library(ggplot2)

# Loading the PCA coordinates from a .txt file via a relative path
file_path <- "6_PCA_Dendro.txt"  # Ensure the file is in the working directory
df <- read.csv(file_path, header = FALSE, sep = ",")

# Extracting the sample names and coordinates
sample_names <- df[, 1]  # First column contains names
x_values <- as.numeric(df[, 2])  # First PCA component
y_values <- as.numeric(df[, 3])  # Second PCA component

# Creating a distance matrix utilizing the PCA coordinates
pca_matrix <- as.matrix(data.frame(x_values, y_values))
rownames(pca_matrix) <- sample_names

# Computing pairwise Euclidean distances
distance_matrix <- dist(pca_matrix)

# Performing hierarchical clustering
hc <- hclust(distance_matrix, method = "ward.D2")

# Converting the clustering output to a Dendrogram format
dendro_data <- as.dendrogram(hc)

# Convert the Dendrogram to a data frame for ggplot
dendro_df <- ggdendro::dendro_data(dendro_data, type = "rectangle")

# Defining the population groups within the .txt file
SSA_samples <- c("MOT", "DIN", "MBT", "YOR", "ANA")
eurasian_samples <- c("AHG", "WHG", "HAN", "ANE", "UST")

# Assigning the group colors
group_labels <- ifelse(dendro_df$labels$label %in% SSA_samples, "SSA",
                       ifelse(dendro_df$labels$label %in% eurasian_samples, "Eurasian", NA))  # Remove Admixed and Other groups

# Filtering out any missing (NA) values just in case
dendro_df$labels <- dendro_df$labels[!is.na(group_labels), ]

# Converting group labels into factor
dendro_df$labels$Group <- factor(group_labels, levels = c("SSA", "Eurasian"))

# Defining the color mapping for the visualization
color_map <- c("SSA" = "red", "Eurasian" = "blue")

# Creating the dendrogram plot
p <- ggplot() +
  geom_segment(data = dendro_df$segments, aes(x = x, y = y, xend = xend, yend = yend), color = "black") +
  geom_text(data = dendro_df$labels, aes(x = x, y = y, label = label, color = Group), 
            hjust = -0.2, vjust = 0.5, size = 7, fontface = "bold") +  # Adjusting the text placement
  scale_color_manual(values = color_map) +
  labs(title = "G25 Based Dendrogram generated in R using My Simulated ANA Component") +
  theme_minimal(base_size = 20) +
  theme(axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        legend.position = "none",  # Removing the legend (not needed)
        plot.title = element_text(hjust = 0.5, face = "bold", size = 22),  # Centered title
        plot.margin = margin(10, 400, 10, 10, "pt"))  # Increasing the right margin to fit in some text

# Displaying the Dendrogram
print(p)

# Saving the Dendrogram
output_filename <- "6_G25_Based_Dendrogram_generated_in_R_using_My_Simulated_ANA_Component.jpg"
ggsave(output_filename, plot = p, width = 22, height = 16, dpi = 400)  # Feel free to adjust the rest with the dpi part

# Print confirmation message
print(paste("Phylogenetic PCA tree saved using ggdendro as", output_filename))
