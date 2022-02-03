# load libraries
library(shiny)
<<<<<<< Updated upstream
=======
library(tidyverse)

# load data
df <- read_csv("data/spotify.csv") %>%
  mutate(`01/18/2022 08:14:43` = as.character(`01/18/2022 08:14:43`))

# pivot data into long format and fix minor data issues
df_long <- df %>%
  pivot_longer(-c("id", "name"),
               names_to = "date",
               values_to = "popularity") %>%
  # fix NA issue and set to numeric
  mutate(popularity = ifelse(popularity == "n/a", NA, as.integer(popularity)),
         # set date format using lubridate package (package::function syntax)
         date = lubridate::mdy_hms(date),
         # convert to short date format
         date = lubridate::as_date(date)
  ) %>%
  # filter data to only include artists from summer 2021
  # filter(date >= "2021-05-31" & date <= "2021-09-06") %>%
  arrange(date, desc(popularity))

# save custom theme
theme_custom <- function(...) {
  # default minimal theme
  theme_minimal() +
    # set additional custom theme options
    theme(
      # remove legend
      legend.position = "none",
      # axis labels are somewhat unnecessary so let's remove them
      axis.title = element_blank(),
      # add some padding below title/subtitle
      plot.title = element_text(margin = margin(0, 0, 5, 0), face = "bold"),
      plot.subtitle = element_text(margin = margin(0, 0, 15, 0)),
      plot.caption = element_text(margin = margin(15, 0, 0, 0)),
      # align title and subtitle with plot margins
      plot.title.position = "plot",
      # set background color
      plot.background = element_rect(fill = "grey90"),
      panel.background = element_rect(fill = "grey90",
                                      # make bounding box grey too
                                      colour = "grey90"),
      # change color of panel grid to white
      panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                      colour = "white"),
      panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                      colour = "white"),
      # set to mono font for fun and make dark grey
      text = element_text(family = "mono", color = "grey20"),
      ...
    )
}
>>>>>>> Stashed changes
