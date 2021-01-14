library(tidyverse)

raw_df <- read_csv("proc/sunedu-datos-combinados-crudo-csv-openrefine-editado.csv")

df <- raw_df %>%
  mutate(
    Estado = str_replace(Estado, "LICENCIADA", "LICENCIA OTORGADA"),
    TIPO_GESTION = str_replace_all(TIPO_GESTION,
                                   c("DO" = "DA", "CO$" = "CA")),
    gestion = if_else(
      is.na(`Tipo de Gestión`),
      TIPO_GESTION,
      `Tipo de Gestión`
    ),
    departamento = if_else(
      is.na(DEPARTAMENTO_LOCAL),
      Región,
      DEPARTAMENTO_LOCAL
    )
  ) %>%
  rename(
    nota_estado_abril_2020 = ESTADO_LICENCIAMIENTO
  ) %>%
  janitor::clean_names() %>%
  rename(
    provincia = provincia_local,
    distrito = distrito_local,
    nombre = universidad,
    codigo = codigo_entidad,
    latitud = latitud_ubicacion,
    longitud = longitud_ubicacion
  ) %>%
  select(
    nombre,
    codigo,
    gestion,
    departamento,
    provincia,
    distrito,
    latitud,
    longitud,
    estado,
    periodo_licenciamiento,
    grupo,
    nota_estado_abril_2020
  )

write_csv(
  df,
  file = "datos/sunedu-licenciamiento-20210114.csv"
)

saveRDS(
  df,
  file = "datos/sunedu-licenciamiento-20210114.rds"
)
