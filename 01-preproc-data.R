library(tidyverse)

d1 <- read_csv("orig/20210114-tablas-licenciamiento-sunedu.csv") %>%
  mutate_if(
    is.character,
    str_trim
  ) %>%
  mutate(
    Universidad = str_replace_all(
      Universidad,
      c(
        "SOCIEDAD ANÓNIMA CERRADA" = "S.A.C.",
        "S\\.A\\.C$" = "S.A.C.",
        " SAC$" = "S.A.C."
      )
    )
  )
d2 <- read_csv("orig/Licenciamiento Institucional_6.csv") %>%
  mutate_if(
    is.character,
    str_trim
  ) %>%
  mutate(
    NOMBRE = str_replace_all(
      NOMBRE,
      c(
        "SOCIEDAD ANÓNIMA CERRADA" = "S.A.C.",
        "S\\.A\\.C$" = "S.A.C.",
        " SAC$" = "S.A.C."
      )
    )
  )

d12 <- d1 %>%
  full_join(
    d2,
    by = c("Universidad" = "NOMBRE")
  )

write_csv(
  d12,
  file = "proc/sunedu-datos-combinados-crudo.csv"
)
