# Loading the required libraries
library(ggplot2)
library(ggrepel)  # Loaded ggrepel for better label positioning

# Loading the PCA coordinates from a .txt file via a relative path
file_path <- "PCA_SSA-Admixed-Eurasian.txt"  # Ensure the file is in the working directory
df <- read.csv(file_path, header = FALSE, sep = ",")

# Extracting the sample names and coordinates
sample_names <- df[, 1]  # First column contains names
x_values <- as.numeric(df[, 2])  # First PCA component
y_values <- as.numeric(df[, 3])  # Second PCA component

# Defining groups such as SSA, Eurasian and Admixed for bettering future visualization
SSA_samples <- c("Mota", "Dinka", "Mbuti", "Yoruba", "My_Simulated_ANA", "Public_Simulated_ANA")
eurasian_samples <- c("Anatolian-HG", "WHG", "Han", "Ancient-North-Eurasian", "Ust-Ishim")
Admixed_samples <- c("Iberomaurusian", "Somali", "Tigray-Tigrinya")

# Assigning the groups
group_labels <- ifelse(sample_names %in% SSA_samples, "SSA populations",
                         ifelse(sample_names %in% eurasian_samples, "Eurasian populations", "Admixed populations"))

# Creating a dataframe for ggplot
pca_data <- data.frame(Sample = sample_names, PC1 = x_values, PC2 = y_values, Group = group_labels)

# Definung the colors and shapes of the groups
color_map <- c("SSA populations" = "red", "Eurasian populations" = "blue", "Admixed populations" = "darkgreen")
shape_map <- c("SSA populations" = 0, "Eurasian populations" = 2, "Admixed populations" = 1)  # Hollow Square, Hollow Triangle, Hollow Circle

# Creating a  PCA scatter plot with improved label positioning (had issues prior)
p <- ggplot(pca_data, aes(x = PC1, y = PC2, color = Group, shape = Group)) +
  geom_point(size = 4, stroke = 1.2, fill = "white") +  # Hollow shapes
  geom_text_repel(aes(label = Sample), show.legend = FALSE, size = 3, box.padding = 0.5, point.padding = 0.3, segment.color = NA) +  # Improved label placement without boxes
  scale_color_manual(name = "Population Group", values = color_map) +
  scale_shape_manual(name = "Population Group", values = shape_map) +
  labs(title = "G25 Based PCA generated using R",
       x = "Principal Component 1", 
       y = "Principal Component 2") +
  theme_minimal(base_size = 14) +  # Clean theme
  theme(panel.grid = element_blank())  # Removes gridlines

# Displaying the plot
print(p)

# Saving the plot as a high-resolution JPEG
output_filename <- "SSA-Eurasian2.jpg"
ggsave(output_filename, plot = p, width = 12, height = 9, dpi = 300)

# Printing the confirmation message
print(paste("Plot saved successfully as", output_filename))
