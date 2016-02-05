### Exercise 1: Get your favorite Band's bio from the Echonest API ###
library(jsonlite)

# Create a variable `api_key` that stores your api key
# Register your own API key here: https://developer.echonest.com/account/register
api_key <- "NZCQHGXNCUOOIU5NP"

# Create a variable that stores the name of your favorite artist
fav_artist <- "Coldplay"

# Substitute the spaces in your band-name with '+'s using the `gsub` function
gsub(' ', '+', fav_artist)

# Construct a seach query to hit the api.
# See documentation/examples: http://developer.echonest.com/docs/v4/artist.html#biographies
base_url <- "http://developer.echonest.com/api/v4/artist/biographies?"
url <- paste0(base_url, "api_key=", api_key, "&name=", fav_artist, "&format=json&results=100")

# Use fromJSON to retrieve the results
coldplay_info <- fromJSON(url)

# Get the text of the (first) biography available
coldplay_df <- coldplay_info$response$biographies
coldplay_df$text
names(flatten(coldplay_df))
