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
  age = round(rnorm(232, 67 - (2 - as.numeric(status)) * 5, 5))
) |>
  select(status, age, stay)

glm(status ~ stay + age, data = disease, family = binomial) |>
  summary()

summary(disease)

hist(as.numeric(disease$status))
hist(as.numeric(disease$stay))
hist(as.numeric(disease$age))
sum(disease$stay == 0); max(disease$stay)

saveRDS(disease, file = "data/disease.RDS")
