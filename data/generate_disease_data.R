library(tibble)

set.seed(1)

disease <- tibble(
  status = sample(
    c("deceased", "recovered"), 
    size = 232, 
    replace = TRUE, 
    prob = c(0.2, 0.8)
  ) |> factor(),
  stay = pmax(1, round(rlnorm(232, 1.3 + (2 - as.numeric(status)) * 0.5))),
  age_means = 67 + 3*(2 - as.numeric(status)) + 0.2 * stay + (0.4*(2 - as.numeric(status))*stay),
  age = round(rnorm(232, age_means, 5))
) |>
  select(status, age, stay)

glm(status ~ stay*age, data = disease, family = binomial) |>
  summary()
lm(age ~ status*stay, disease) |>
  summary()

summary(disease)

hist(as.numeric(disease$status))
hist(as.numeric(disease$stay))
hist(as.numeric(disease$age))
sum(disease$stay == 0); max(disease$stay)

saveRDS(disease, file = "data/disease.RDS")
