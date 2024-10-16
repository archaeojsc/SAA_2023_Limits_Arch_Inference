

# Function to calculate Shannon entropy for a biased coin
shannon_entropy_coin <- function(p) {
  # Handle cases where p is 0 or 1 to avoid log(0)
  if (p == 0 || p == 1) {
    return(0)
  } else {
    return(-p * log2(p) - (1 - p) * log2(1 - p))
  }
}

# Function to plot Shannon entropy against biased coin probabilities
plot_entropy_vs_prob <- function() {
  # Generate a sequence of probabilities from 0 to 1
  p_values <- seq(0, 1, by = 0.001)
  
  # Calculate the entropy for each probability
  entropy_values <- sapply(p_values, shannon_entropy_coin)
  
  # Plot entropy (H) against probability (p)
  plot(
    p_values,
    entropy_values,
    type = "l",
    xlab = "Probability of Heads (p)",
    ylab = "Shannon Entropy (H)",
    main = "Shannon Entropy vs. Biased Coin Probability",
    col = "blue",
    lwd = 2
  )
  
  abline(v = 0.5, col = 'red')
  text(
    x = 0.48,
    y = 0.5,
    srt = 90,
    labels = "Fair Coin",
    col = "red"
  )
}

# Example usage to generate the plot
plot_entropy_vs_prob()
