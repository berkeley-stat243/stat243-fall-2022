M <- sapply(rpois(n, lambda), max, 2) # number of covariate measure times
L <- sapply(rpois(n, lambda), max, 2) # number of response measurement times

S <- lapply(M, runif) # covariate times
T <- lapply(L, runif) # response times

min_dist_T_to_S <- mapply(
  function(s, m, t, l) {
    apply(as.matrix(dist(c(s, t)))[1:m, (m + 1):(m + l)], 2, min)
  }, S, M, T, L,
  SIMPLIFY = FALSE
)

S_dists <- lapply(S, dist)
T_dists <- lapply(T, dist)

dist_to_chol <- function(dist_mat, for_eps = FALSE, no_corr = FALSE) {
  if (no_corr) {
    ## no correlation (for testing)
    n_t <- dim(as.matrix(dist_mat))[1]
    cov_mat <- matrix(0, nrow = n_t, ncol = n_t)
  } else if (for_eps) {
    ## time correlation for additive noise epsilon
    cov_mat <- as.matrix(2^(-dist_mat))
  } else {
    ## time correlation for covariates X
    cov_mat <- as.matrix(exp(-dist_mat))
  }
  diag(cov_mat) <- 1
  return(chol(cov_mat))
}
chol_eps <- lapply(T_dists, dist_to_chol, for_eps = TRUE)
chol_S <- lapply(S_dists, dist_to_chol)
chol_T <- lapply(T_dists, dist_to_chol)

mvn_chol <- function(U) crossprod(U, rnorm(dim(U)[1]))

X <- lapply(chol_S, mvn_chol)
X_for_Y <- lapply(chol_T, mvn_chol)
eps <- lapply(chol_eps, mvn_chol)
stopifnot(all(sapply(Y, length) == sapply(eps, length)))

beta0 <- 0.5
beta1 <- 1.5

Y <- lapply(seq_along(X_for_Y), function(i) {
  beta0 + X_for_Y[[i]] * beta1 + eps[[i]]
})

sim_X <- tibble::tibble(subject = seq_along(L),
                        time = S,
                        min_dist = 0,
                        obs = X,
                        obs_type = "X") %>%
  unnest(cols = c(time, obs))

sim_Y <- tibble::tibble(subject = seq_along(L),
                        time = T,
                        min_dist = min_dist_T_to_S,
                        obs = Y,
                        obs_type = "Y") %>%
  unnest(cols = c(time, obs, min_dist))

epan <- function(x) 0.75 * sapply((1 - x^2), max, 0)
epan_kern <- function(d, h) epan(d / h) / h

sim_data <- dplyr::bind_rows(sim_X, sim_Y) %>%
  arrange(subject, time) %>%
  mutate(subject = as.factor(subject),
         obs = as.vector(obs),
         obs_type = as.factor(obs_type),
         obs_weight = if_else(obs_type == "X", 1,
                              epan_kern(min_dist, 0.15)))

ggplot(sim_data %>% filter(subject %in% sample(1:n, 4)),
       aes(x = time, y = obs, color = subject,
           linetype = obs_type, shape = obs_type)) +
  geom_line(aes(group = interaction(subject, obs_type))) +
  geom_point(aes(group = interaction(subject, obs_type),
                 size = obs_weight), alpha = 0.5) +
  guides(size = "none",
         shape = guide_legend(override.aes = list(size = 5, linetype = 0))) +
  facet_grid(rows = vars(subject)) +
  scale_colour_brewer(palette = "Dark2") +
  theme_bw(base_size = 20)
