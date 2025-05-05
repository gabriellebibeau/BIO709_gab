library(ggplot2)
library(patchwork)

castor_clean <- c(
  10.28, 16.69, 7.24, 1.40, 1.73, 3.14, 1.85, 16.52, 3.70, 1.11,
  2.16, 12.75, 3.36, 14.80, 1.03, 6.08, 1.41, 8.55, 5.41, 1.04,
  5.86, 22.02, 3.50, 14.48, 9.83, 0.94, 2.03, 1.21, 2.15,
  0.75, 3.48, 4.77, 10.10, 11.58, 12.30, 1.66, 1.57, 3.05, 3.62,
  0.99, 1.22, 3.81, 6.03, 1.21, 1.18, 0.75, 1.35, 6.84, 2.91,
  2.75, 12.04, 1.02, 3.15, 1.19, 0.79, 1.10, 1.96, 1.27, 0.97,
  1.56, 6.94, 1.66, 0.64, 4.84, 6.71, 2.51, 0.97, 0.72, 0.59,
  0.70, 0.53, 0.64, 0.55, 0.68, 1.06, 0.76, 22.62, 15.59, 2.23
)


# Exponentielle
set.seed(24)
sim_exp <- rexp(120,0.25) + 0.5

a <- ggplot() +
  geom_histogram(aes(castor_clean), binwidth=1, fill="blue", color="black") +
  geom_histogram(aes(sim_exp), binwidth=1, bins = 12, fill="red", color="black", alpha = 0.5) +
  labs(title="Exponentielle", x="Values", y="Frequency")


# Log normale
set.seed(1)
sim_lno <- rlnorm(120, meanlog = -0.35, sdlog = 1.5)+0.5

b <- ggplot() +
  geom_histogram(aes(castor_clean), binwidth=1, fill="blue", color="black") +
  geom_histogram(aes(sim_lno), binwidth=1, bins = 12, fill="red", color="black", alpha = 0.5) +
  labs(title="Log normal", x="Values", y="Frequency")


# Gamma
set.seed(2)
sim_gam <- rgamma(120, shape = 1, scale=4) + 0.5

c <- ggplot() +
  geom_histogram(aes(castor_clean), binwidth=1, fill="blue", color="black") +
  geom_histogram(aes(sim_gam), binwidth=1, bins = 12, fill="red", color="black", alpha = 0.5) +
  labs(title="Gamma", x="Values", y="Frequency")


# Final plot
a+b+c
