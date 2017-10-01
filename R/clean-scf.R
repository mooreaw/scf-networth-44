library(tidyverse)
library(haven)

scf <- 
  bind_rows(
    "2007" = read_dta("data/rscfp2007.dta"),
    "2010" = read_dta("data/rscfp2010.dta"),
    "2013" = read_dta("data/rscfp2013.dta"),
    "2016" = read_dta("data/rscfp2016.dta"),
    .id = "year"
  ) %>%
  select(
    year,
    yy1 = YY1,
    y1  = Y1,
    wgt,
    race,
    networth
  )

scf$race <- factor(
  scf$race,
  levels = c(1:3, 5),
  labels = c("White", "Black", "Hispanic", "Other")
)

write_csv(scf, "data/scf-0716-networth.csv")
