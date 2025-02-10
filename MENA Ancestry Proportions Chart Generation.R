# Loading the required libraries
library(data.table)
library(ggplot2)
library(plotly)
library(reshape2)  
library(htmlwidgets)

# Loading the CSV file using a relative path
file_path <- "MENA_ANA_proportions.csv"  # Ensure this file is in your working directory
mena_data <- fread(file_path)

# Adding a Population column explicitly
mena_data[, Population := c("Moroccan", "Algerian", "Tunisian", "Libyan", "Egyptian-A", 
                            "Egyptian-B", "Egyptian-Copt", "Egypt-Iron-Age", "Palestinian", 
                            "Lebanese-Christian", "Lebanese-Muslim", "Syrian", "Saudi")]

# Excluding "Distance" from the melt operation so it's not in the chart
mena_long <- melt(mena_data, id.vars = "Population", 
                  measure.vars = c("Eurasian", "My-Simulated-ANA", "Yoruba", "Dinka"),
                  variable.name = "Ancestry", value.name = "Proportion")

# Defining custom colors 
custom_colors <- c(
  "Eurasian" = "#0072B2",         # Blue
  "My-Simulated-ANA" = "#D55E00", # Orange
  "Yoruba" = "#FFD700",           # Yellow
  "Dinka" = "#800000"             # Maroon
)

# Creating the bar plot (Distance is only used for tooltips, not plotted)
p <- ggplot(mena_long, aes(x = reorder(Population, -mena_data$Eurasian[match(Population, mena_data$Population)]), 
                           y = Proportion, fill = Ancestry, 
                           text = paste("Population:", Population, 
                                        "<br>Ancestry:", Ancestry, 
                                        "<br>Proportion:", round(Proportion, 2), 
                                        "<br>Distance:", mena_data$Distance[match(Population, mena_data$Population)]))) +
  geom_bar(stat = "identity", position = "stack") +  
  scale_fill_manual(values = custom_colors) +  # Applying the custom colors
  theme_minimal() +
  labs(title = "G25 & nMonte Based Results",
       x = "Population", y = "Proportion") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10))

# Converting the chart to an interactive plotly chart with tooltip
interactive_plot <- ggplotly(p, tooltip = "text")

# Save the interactive plot as an HTML file
output_file <- "MENA_Ancestry_Chart.html"
saveWidget(interactive_plot, output_file, selfcontained = TRUE)

# Printing message confirming successful save
cat("Interactive plot saved as", output_file, "\n")

# Showing the interactive plot in RStudio Viewer
print(interactive_plot)  # Ensures it appears in the Viewer
