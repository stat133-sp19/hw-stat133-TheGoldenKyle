## **Data Dictionary** (*nba2018-players.csv*)


#### *Variables:*

- **team name:** Name of the team that the player was playing for when the shot was made. *(character)*
- **game date:** Date of the game when the player made the shot. *(character MM/DD/YY)*
- **season:** Year of the season when the shot was made. *(integer)*
- **period:** Period of game when the shot was made. Each game consists of 4 equally time periods. *(integer)*
- **minutes_remaining:** Minutes remaining in the period when the shot was made. There are 12 minutes per period. *(integer)*
- **seconds_remaining:** Number of seconds added to the minutes_remaining that are remaining in the period. *(integer)*
- **shot_made_flag:** Indicates whether the shot was made or whether it was missed. "y" and "n" respectively *(character)*
- **action_type:** Type of action used by the player leading up to the shot. *(character)*
- **shot_type:** What type of shot was shot. *(character)*
- **shot_distance:** Distance the player was from the basket when taking the shot measured in feet. *(integer)*
- **opponent:** Team that the player was playing against when taking the shot. *(character)*
- **x:** Number of inches horizontally that the player was away from the center vertical line of the court. Negative values represent positions on the left side of the vertical line and positive values represent positions on the right side of the vertical line. The total length of the half court is 564 inches. *(integer)*
- **y:** Number of inches vertically that the player was away from the center of the half court. Negative values represent positions below below the center of the half court and positive values represent positions above the center of the half court. The total height of the half court is 300 inches. *(integer)*
