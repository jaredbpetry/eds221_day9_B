---
title: "kable tables"
format: html
editor: visual
---


## kable table whatthe is that?


::: {.cell}

```{.r .cell-code}
#install.packages("kableExtra")
library(tidyverse) 
```

::: {.cell-output .cell-output-stderr}
```
── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
✔ ggplot2 3.3.6     ✔ purrr   0.3.4
✔ tibble  3.1.8     ✔ dplyr   1.0.9
✔ tidyr   1.2.0     ✔ stringr 1.4.0
✔ readr   2.1.2     ✔ forcats 0.5.1
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
```
:::

```{.r .cell-code}
library(lterdatasampler) 
library(kableExtra)
```

::: {.cell-output .cell-output-stderr}
```

Attaching package: 'kableExtra'

The following object is masked from 'package:dplyr':

    group_rows
```
:::
:::


create a summary table of mean maple seedling height cm\^2 by watershed and year


::: {.cell}

```{.r .cell-code}
hbr_summary <- hbr_maples |> 
  group_by(watershed, year) |> 
  summarise(mean_height = round(mean(stem_length, na.rm = TRUE), 1), 
            sd_height = round(sd(stem_length, na.rm = TRUE), 1))
```

::: {.cell-output .cell-output-stderr}
```
`summarise()` has grouped output by 'watershed'. You can override using the
`.groups` argument.
```
:::
:::


there ar like a million ways to create tables in R that look good enough to publish in a paper or something that you want

use package "kableExtra"

make a nicer table! (uses html to make it look pretty)

use round function to keep sig figs in line... original data was only measured in tenths of a centimeter


::: {.cell}

```{.r .cell-code}
hbr_summary |> 
  kable(col.names = c("Watershed", "Year", "Mean Seedling Height (sq. cm)", "SD seedling height (sq. cm)")) |> 
  kable_styling(bootstrap_options = "striped") |> 
  column_spec(1, bold = TRUE, background = "purple")
```

::: {.cell-output-display}
`````{=html}
<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Watershed </th>
   <th style="text-align:right;"> Year </th>
   <th style="text-align:right;"> Mean Seedling Height (sq. cm) </th>
   <th style="text-align:right;"> SD seedling height (sq. cm) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: purple !important;"> Reference </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 81.0 </td>
   <td style="text-align:right;"> 13.9 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: purple !important;"> Reference </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:right;"> 85.9 </td>
   <td style="text-align:right;"> 15.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: purple !important;"> W1 </td>
   <td style="text-align:right;"> 2003 </td>
   <td style="text-align:right;"> 87.9 </td>
   <td style="text-align:right;"> 14.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;background-color: purple !important;"> W1 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:right;"> 97.5 </td>
   <td style="text-align:right;"> 13.8 </td>
  </tr>
</tbody>
</table>

`````
:::
:::

