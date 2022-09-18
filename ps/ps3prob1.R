## @knitr download

moderators <- c("MODERATOR", "SCHIEFFER", "SCHIEFFER", "LEHRER", "HOLT", "WALLACE")

candidates <- list(c(Dem = "GORE", Rep = "BUSH"),
                   c(Dem = "KERRY", Rep = "BUSH"),
                   c(Dem = "OBAMA", Rep = "MCCAIN"),
                   c(Dem = "OBAMA", Rep = "ROMNEY"),
                   c(Dem = "CLINTON", Rep = "TRUMP"),
                   c(Dem = "BIDEN", Rep = "TRUMP"))

titles <- c("October 3, 2000: The First Gore-Bush Presidential Debate",
            "October 13, 2004: The Third Bush-Kerry Presidential Debate",
            "October 15, 2008: The Third McCain-Obama Presidential Debate",
            "October 3, 2012: The First Obama-Romney Presidential Debate",
            "September 26, 2016: The First Clinton-Trump Presidential Debate",
            "September 29, 2020: Presidential Debate")

library(rvest)
library(stringr)
library(assertthat)

url <- "https://debates.org/voter-education/debate-transcripts"

yrs <- seq(2000, 2020, by = 4)

main  <- read_html(url)
listOfANodes <- html_nodes(main, xpath = "//a[@href]")
labs <- sapply(listOfANodes, html_text)
selected <- match(titles, labs)
debate_urls <- sapply(listOfANodes, html_attr, "href")[selected]

## 2020 transcript has full URL instead of relative URL -- argh!
debate_urls <- gsub("https://www.debates.org", "", debate_urls, fixed = TRUE)

n <- length(debate_urls)

assert_that(n == length(grep("^/voter-education", debate_urls)))
assert_that(n == length(yrs))

## @knitr extract

debates_html <- lapply(paste0("https://debates.org", debate_urls), read_html)

get_content <- function(html) {
    # get core content containing debate text
    contentNode <- html_nodes(html, xpath = "//div[@id = 'content-sm']")
    if(length(contentNode) > 1)
        stop("Check why there are multiple chunks of content.")
    text <- html_text(contentNode[[1]])
    # sanity check:
    print(html_text(html_nodes(contentNode[[1]], xpath = "//h1")[[1]]))
    return(text)
}

debates_bodies <- sapply(debates_html, get_content)

## sanity checks
print(substring(debates_bodies[1], 1, 1000))
print(substring(debates_bodies[6], 1, 1000))
lengths <- sapply(debates_bodies, nchar, USE.NAMES = FALSE)
assert_that(min(lengths) > 70000 && max(lengths) < 120000)
