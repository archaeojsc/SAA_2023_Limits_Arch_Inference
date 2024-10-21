# Function to calculate surprisal for a probability p
surprisal <- function(p) {
  # Handle edge cases where p is 0 or 1 to avoid log(0) issues
  if (p == 0) {
    return(NA)  # Infinite surprisal for impossible events
  } else if (p == 1) {
    return(0)  # Zero surprisal for certain events
  } else {
    return(-log2(p))
  }
}

# Function to plot surprisal for heads and tails against biased coin
# probabilities
plot_surprisal_vs_prob <- function() {
  # Generate a sequence of probabilities from 0 to 1
  p_values <- seq(0.01, 1, by = 0.01)
  
  # Calculate the surprisal for heads (I(p)) and tails (I(1-p)) for each
  # probability
  surprisal_heads <- sapply(p_values, surprisal)
  surprisal_tails <- sapply(1 - p_values, surprisal)
  
  # Plot surprisal for heads
  plot(
    p_values,
    surprisal_heads,
    type = "l",
    xlab = "Probability of Heads (p)",
    ylab = "Shannon Surprisal (I)",
    main = "Shannon Surprisal vs. Biased Coin Probability",
    col = "black",
    lty = "solid",
    lwd = 2,
    ylim = c(0, max(
      surprisal_heads, surprisal_tails, na.rm = TRUE
    ))
  )
  
  # Add surprisal for tails to the plot
  lines(p_values,
        surprisal_tails,
        col = "black",
        lty = "dotted",
        lwd = 2)
  
  abline(v = 0.5, lty = "dashed")
  
  text(
    x = 0.48,
    y = 3,
    srt = 90,
    cex = 0.8,
    labels = "'Fair' Coin -- [p=0.5]",
    col = "black"
  )
  
  
  # Add a legend
  legend(
    "topright",
    legend = c("Surprisal (Heads)", "Surprisal (Tails)"),
    lty = c("solid", "dotted"),
    lwd = 2
  )
}

# Example usage to generate the plot
plot_surprisal_vs_prob()
