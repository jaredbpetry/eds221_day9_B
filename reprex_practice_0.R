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

#pick a dataset with capital letters but its much less bulky and other users won't have to load this package

#make sure what you copy to the clipboard is the code. once copied, run reprex() in console

#if you want to post it on a slack channel, there is a special code for that reprex(venue="slack)

#sharing a reprex in response to a question is also an awesome thing to do 

library(tidyverse)

warpbreaks |> 
  str_to_lower(wool)

#we know that we have to use mutate() if you want to update an existing column
#so make a reprex for the solution and share it
#paste it in the comment 

library(tidyverse) 

warpbreaks |>  
  mutate(str_to_lower(wool))


### A reprex with a synthesized data frame that will do the same thing 

library(tidyverse) 

surf_cats <- tribble(
  ~Surfer, ~injury_type, 
  "Kolohe", "scared to surf", 
  "Florence", "too skinny", 
  "toledo", "Stinky Style"
)

surf_cats_lower <- surf_cats |> 
  mutate(Surfer = str_to_lower(surf_cats$Surfer))