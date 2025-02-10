# Load necessary libraries
library(data.table)
library(ggplot2)
library(plotly)
library(reshape2)  # Required for melt()

# Load the CSV file using a relative path
file_path <- "MENA_ANA_proportions.csv"  # Ensure this file is in your working directory
mena_data <- fread(file_path)

# Add a Population column explicitly
mena_data[, Population := c("Moroccan", "Algerian", "Tunisian", "Libyan", "Egyptian-A", 
                            "Egyptian-B", "Egyptian-Copt", "Egypt-Iron-Age", "Palestinian", 
                            "Lebanese-Christian", "Lebanese-Muslim", "Syrian", "Saudi")]

# Exclude "Distance" from the melt operation so it's NOT in the bar chart
mena_long <- melt(mena_data, id.vars = "Population", 
                  measure.vars = c("Eurasian", "My-Simulated-ANA", "Yoruba", "Dinka"),
                  variable.name = "Ancestry", value.name = "Proportion")

# Define custom colors (Eurasian in blue, others in reddish shades)
custom_colors <- c(
  "Eurasian" = "#0072B2",         # Blue
  "My-Simulated-ANA" = "#D55E00", # Reddish-Orange
  "Yoruba" = "#E69F00",          # Golden Yellow
  "Dinka" = "#CC4C02"            # Deep Orange
)

# Create the bar plot (Distance is only used for tooltips, not plotted)
p <- ggplot(mena_long, aes(x = reorder(Population, -mena_data$Eurasian[match(Population, mena_data$Population)]), 
                           y = Proportion, fill = Ancestry, 
                           text = paste("Population:", Population, 
                                        "<br>Ancestry:", Ancestry, 
                                        "<br>Proportion:", round(Proportion, 2), 
                                        "<br>Distance:", mena_data$Distance[match(Population, mena_data$Population)]))) +
  geom_bar(stat = "identity", position = "stack") +  
  scale_fill_manual(values = custom_colors) +  # Apply custom colors
  theme_minimal() +
  labs(title = "MENA Ancestry Proportions",
       x = "Population", y = "Proportion") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10))

# Convert to interactive plotly chart with proper tooltip (proportions + distance)
interactive_plot <- ggplotly(p, tooltip = "text")

# Show the plot
interactive_plot
