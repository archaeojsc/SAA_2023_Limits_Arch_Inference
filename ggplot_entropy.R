library(ggplot2)

# Function to plot Shannon entropy for a biased coin
plot_shannon_entropy <- function(output_file = "shannon_entropy_plot.png") {
  # Create a sequence of probabilities from 0 to 1
  p <- seq(0, 1, by = 0.01)
  
  # Compute Shannon entropy for a biased coin with probability p and 1-p
  H <- -p * log2(p) - (1 - p) * log2(1 - p)
  H[is.na(H)] <- 0 # Replace NaN values (due to log2(0)) with 0
  
  # Create a data frame for plotting
  data <- data.frame(p = p, H = H)
  
  # Plot using ggplot
  plot <- ggplot(data, aes(x = p, y = H)) +
    geom_line(color = "black") +
    theme_minimal() +
    labs(x = "Probability of Heads (p)", 
         y = "Shannon Entropy (H)", 
         title = "Shannon Entropy vs. Probability for a Biased Coin") +
    geom_vline(xintercept = 0.5, linetype = "dashed") +
    annotate(
      "text",
      x = 0.48,
      y = max(H) / 2,
      label = "Fair Coin",
      angle = 90,
      hjust = 0.5,
      vjust = 0.5
    ) +
    theme(
      plot.title = element_text(hjust = 0.5),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line = element_line(color = "black")
    )
  
  print(plot)
  
  # Save the plot
  ggsave(filename = output_file, plot = plot, width = 6, height = 4, dpi = 300)
}

# Example usage:
plot_shannon_entropy("shannon_entropy_plot.png")
