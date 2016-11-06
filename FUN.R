gettweets <- function(screen_name, max_id= NULL, count= 200){
        apiurl <- "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name="
        baseurl <- paste0(apiurl, screen_name, "&count=", count)
        if (!is.null(max_id)) {
                fullurl <- paste0(baseurl, "&max_id=", max_id)
        } else fullurl <- baseurl
        resp <- GET(fullurl, sig)
        json <- content(resp)
        dat <- fromJSON(toJSON(json))
}