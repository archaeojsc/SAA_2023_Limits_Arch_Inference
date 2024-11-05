library(ggplot2)

# Function to plot Shannon surprisal for heads and tails
plot_shannon_surprisal <- function(output_file = "shannon_surprisal_plot.png") {
  # Create a sequence of probabilities from a small epsilon to 1 - epsilon
  p <- seq(0.01, 0.99, by = 0.01)
  
  # Calculate surprisal for heads (I(heads)) and tails (I(tails))
  I_heads <- -log2(p)
  I_tails <- -log2(1 - p)
  
  # Create a data frame for plotting
  data <- data.frame(p = p,
                     I_heads = I_heads,
                     I_tails = I_tails)
  
  # Plot using ggplot
  plot <- ggplot(data) +
    geom_line(aes(x = p, y = I_heads, color = "Heads"), linetype = "solid") +
    geom_line(aes(x = p, y = I_tails, color = "Tails"), linetype = "dotted") +
    scale_color_manual(values = c("black", "black")) +
    labs(x = "Probability of Heads (p)", 
         y = "Shannon Surprisal (I)", 
         color = "", 
         title="Shannon Surprisal vs. Biased Coin Probability") +
    geom_vline(xintercept = 0.5, linetype = "dashed") +
    annotate(
      "text",
      x = 0.48,
      y = max(I_heads) / 2,
      label = "Fair Coin",
      angle = 90,
      hjust = 0.5,
      vjust = 0.5
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5),
      legend.position = "top",
      legend.justification = "right",
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.line = element_line(color = "black")
    )
  
  # Print the plot in R
  print(plot)
  
  # Save the plot
  ggsave(
    filename = output_file,
    plot = plot,
    width = 6,
    height = 4,
    dpi = 300
  )
}

# Example usage:
plot_shannon_surprisal("shannon_surprisal_plot.png")
