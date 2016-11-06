source("auth.R")
source("FUN.R")
library(httr)
library(jsonlite)
library(dplyr)

myapp <- oauth_app("twitter", consumer_key, consumer_secret)
sig <- sign_oauth1.0(myapp, access_token, access_secret)

dat <- gettweets("bbcpersian")
dat <- select(dat, created_at, id_str, text, source, retweet_count, 
              favorite_count, favorited, retweeted, lang); df <- dat


while (!is.null(nrow(dat))&nrow(dat) == 200) {
        dat <- gettweets("bbcpersian", max_id = dat[200, 2])
        dat <- select(dat, created_at, id_str, text, source, retweet_count, 
                      favorite_count, favorited, retweeted, lang)
        df <- bind_rows(df, dat)
}