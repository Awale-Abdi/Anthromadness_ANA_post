# Loading the required libraries
library(data.table)
library(ggplot2)
library(plotly)
library(reshape2)  
library(htmlwidgets)

# Loading the CSV file using a relative path
file_path <- "7_MENA_ANA_proportions.csv"
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

# Creating the horizontal bar plot
p <- ggplot(mena_long, aes(y = reorder(Population, mena_data$Eurasian[match(Population, mena_data$Population)]), 
                           x = Proportion, fill = Ancestry, 
                           text = paste("Population:", Population, 
                                        "<br>Ancestry:", Ancestry, 
                                        "<br>Proportion:", round(Proportion, 2), 
                                        "<br>Distance:", mena_data$Distance[match(Population, mena_data$Population)]))) +
  geom_bar(stat = "identity", position = "stack") +  
  scale_fill_manual(values = custom_colors) +  # Applying the custom colors
  theme_minimal() +
  labs(title = "G25 & nMonte Based Results",
       x = "Proportion", y = "Population") +
  theme(axis.text.y = element_text(size = 10))  # Adjusting the text size for clarity

# Converting the chart to an interactive plotly chart with tooltip
interactive_plot <- ggplotly(p, tooltip = "text")

# Save the interactive plot as an HTML file
output_file <- "7_MENA_Ancestry_Bar_Chart.html"
saveWidget(interactive_plot, output_file, selfcontained = TRUE)

# Printing message confirming successful save
cat("Interactive plot saved as", output_file, "\n")

# Showing the interactive plot in RStudio Viewer
print(interactive_plot)
