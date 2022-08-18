#-------- Practicing Reprex------#


#NOT A REPREX
library(tidyverse) 
library(palmerpenguins) 

penguins |> 
  select(species, body_mass_g, flipper_length_mm, year) |> 
  filter(species == "Chinstrap") |> 
  str_to_lower(species) |> 
  group_by(island) |> 
  summarize(mean(body_mass_g, na.rm = TRUE), 
            mean(flipper_length_mm, na.rm = TRUE))


### A REPREX

#can't convert a column to lowercase... make a simple example of this 

