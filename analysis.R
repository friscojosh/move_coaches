library(tidyverse)
library(nflfastR)

## Final drive in the title game against Chicago in North Dallas Forty
play1 <- tibble::tibble(
  "season" = 1979,
  'home_team' = 'North Dallas Bulls',
  'posteam' = 'North Dallas Bulls',
  'roof' = 'outdoors',
  'half_seconds_remaining' = 120,
  'yardline_100' = 25,
  'down' = 1,
  'ydstogo' = 10,
  'posteam_timeouts_remaining' = 1,
  'defteam_timeouts_remaining' = 3
)

play2 <- tibble::tibble(
  "season" = 1979,
  'home_team' = 'North Dallas Bulls',
  'posteam' = 'North Dallas Bulls',
  'roof' = 'outdoors',
  'half_seconds_remaining' = 80,
  'yardline_100' = 28,
  'down' = 2,
  'ydstogo' = 13,
  'posteam_timeouts_remaining' = 1,
  'defteam_timeouts_remaining' = 3
)

play3 <- tibble::tibble(
  "season" = 1979,
  'home_team' = 'North Dallas Bulls',
  'posteam' = 'North Dallas Bulls',
  'roof' = 'outdoors',
  'half_seconds_remaining' = 65,
  'yardline_100' = 28,
  'down' = 3,
  'ydstogo' = 13,
  'posteam_timeouts_remaining' = 0,
  'defteam_timeouts_remaining' = 3
)

play4 <- tibble::tibble(
  "season" = 1979,
  'home_team' = 'North Dallas Bulls',
  'posteam' = 'North Dallas Bulls',
  'roof' = 'outdoors',
  'half_seconds_remaining' = 24,
  'yardline_100' = 18,
  'down' = 1,
  'ydstogo' = 10,
  'posteam_timeouts_remaining' = 0,
  'defteam_timeouts_remaining' = 3
)

play5 <- tibble::tibble(
  "season" = 1979,
  'home_team' = 'North Dallas Bulls',
  'posteam' = 'North Dallas Bulls',
  'roof' = 'outdoors',
  'half_seconds_remaining' = 16,
  'yardline_100' = 28,
  'down' = 1,
  'ydstogo' = 20,
  'posteam_timeouts_remaining' = 0,
  'defteam_timeouts_remaining' = 3
)

play6 <- tibble::tibble(
  "season" = 1979,
  'home_team' = 'North Dallas Bulls',
  'posteam' = 'North Dallas Bulls',
  'roof' = 'outdoors',
  'half_seconds_remaining' = 1,
  'yardline_100' = 15,
  'down' = 2,
  'ydstogo' = 7,
  'posteam_timeouts_remaining' = 0,
  'defteam_timeouts_remaining' = 3
)

play1_ep <- nflfastR::calculate_expected_points(play1)
play2_ep <- nflfastR::calculate_expected_points(play2)
play3_ep <- nflfastR::calculate_expected_points(play3) 
play4_ep <- nflfastR::calculate_expected_points(play4) 
play5_ep <- nflfastR::calculate_expected_points(play5) 
play6_ep <- nflfastR::calculate_expected_points(play6) 

drive <- play1_ep %>%
  bind_rows(play2_ep, play3_ep, play4_ep, play5_ep, play6_ep) %>%
  mutate(epa = lead(ep) - ep,
         epa = ifelse(is.na(epa), 6 - ep, epa))

write_csv(drive, "ndf_drive.csv")
