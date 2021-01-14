## Datos de licenciamiento de Universidades (SUNEDU, Perú)

Los datos combinan la información que se tenía en Abril del 2020 en datos abiertos (https://www.datosabiertos.gob.pe/dataset/sunedu-estado-licenciamiento-universidades), con la extracción manual ("scraping") de las tablas que muestran el avance de licenciamiento (https://www.sunedu.gob.pe/avances-licenciamiento/, descargado el 2021-01-14)

Los datos originales se guardan en los archivos:

- Datos abiertos:
  - `orig/Licenciamiento Institucional_6.csv`  (datos)
  - `Licenciamiento Institucional - Diccionario_0.pdf` (documentación)
- Extracción manual:
  - `orig/20210114-tablas-licenciamiento-sunedu.csv`

Los datos originales se combinaron generando el archivo `proc/sunedu-datos-combinados-crudo.csv`, el cual fue procesado usando OpenRefine (ver operaciones en: `proc/openrefine-operations.json`) para generar el archivo `proc/sunedu-datos-combinados-crudo-csv-openrefine-editado.csv`

De este último se ha generado dos archivos que consolidan la información:

- `datos/sunedu-licenciamiento-20210114.csv`
- `datos/sunedu-licenciamiento-20210114.rds` (formato RDS)

Estos datos tienen la siguiente estructura:

```
> skimr::skim(sunedu)
── Data Summary ────────────────────────
                           Values
Name                       sunedu
Number of rows             147   
Number of columns          12    
_______________________          
Column type frequency:           
  character                8     
  numeric                  4     
________________________         
Group variables            None  

── Variable type: character ───────────────────────────────────────────────────────────────────────
  skim_variable          n_missing complete_rate   min   max empty n_unique whitespace
1 nombre                         0         1        16    76     0      147          0
2 gestion                        0         1         7     7     0        2          0
3 departamento                   0         1         3    13     0       25          0
4 provincia                      4         0.973     3    23     0       48          0
5 distrito                       4         0.973     3    22     0       82          0
6 estado                         2         0.986    17    37     0        3          0
7 grupo                          2         0.986     7     7     0        9          0
8 nota_estado_abril_2020         4         0.973     7    55     0        7          0

── Variable type: numeric ─────────────────────────────────────────────────────────────────────────
  skim_variable          n_missing complete_rate   mean    sd    p0   p25   p50    p75   p100 hist 
1 codigo                         4         0.973  75.0  43.7    1    36.5  77   112.   149    ▇▇▇▇▇
2 latitud                        4         0.973 -11.3   3.23 -18.0 -12.5 -12.1  -9.10  -3.59 ▂▂▇▃▂
3 longitud                       4         0.973 -76.0   2.67 -80.7 -77.1 -77.0 -74.7  -69.2  ▃▇▂▂▁
4 periodo_licenciamiento         4         0.973   4.08  3.16   0     0     6     6     10    ▅▁▇▁▁
> 
> skimr::skim(sunedu)
── Data Summary ────────────────────────
                           Values
Name                       sunedu
Number of rows             147   
Number of columns          12    
_______________________          
Column type frequency:           
  character                8     
  numeric                  4     
________________________         
Group variables            None  

── Variable type: character ───────────────────────────────────────────────────────────────────────────
  skim_variable          n_missing complete_rate   min   max empty n_unique whitespace
1 nombre                         0         1        16    76     0      147          0
2 gestion                        0         1         7     7     0        2          0
3 departamento                   0         1         3    13     0       25          0
4 provincia                      4         0.973     3    23     0       48          0
5 distrito                       4         0.973     3    22     0       82          0
6 estado                         2         0.986    17    37     0        3          0
7 grupo                          2         0.986     7     7     0        9          0
8 nota_estado_abril_2020         4         0.973     7    55     0        7          0

── Variable type: numeric ─────────────────────────────────────────────────────────────────────────────
  skim_variable          n_missing complete_rate   mean    sd    p0   p25   p50    p75   p100 hist 
1 codigo                         4         0.973  75.0  43.7    1    36.5  77   112.   149    ▇▇▇▇▇
2 latitud                        4         0.973 -11.3   3.23 -18.0 -12.5 -12.1  -9.10  -3.59 ▂▂▇▃▂
3 longitud                       4         0.973 -76.0   2.67 -80.7 -77.1 -77.0 -74.7  -69.2  ▃▇▂▂▁
4 periodo_licenciamiento         4         0.973   4.08  3.16   0     0     6     6     10    ▅▁▇▁▁
```

