library(readr)

file <- read_file("text1.txt")
file_array <- c()
file_array <- append(file_array, file)

## word n-gram 
## passes every occurance to chart maker function
## params: sentence - the sentence we want to analyze
##         num - number of n-gram (2 for bigram)
word_ngram <- function(sentence, num) {
  sentence <- stringr::str_replace(sentence, '\n', ' ')
  text <- strsplit(sentence, ' ') %>% Reduce(c, .)
  ngram <- c()
  for (x in 1:length(text)) {
    if (nchar(text[x]) < 2)
      next
    splitted <- c(strsplit(text[x], ''))[[1]]
    # print(splitted)
    for (letter in 1:(length(splitted)-1)) {
      ngram <- append(ngram, paste0(splitted[seq(letter, letter+num-1)], collapse = ""))
    }
  }
  return(c(ngram))
}

print(word_ngram(file, 2))

## make frequency list
## recieve every occurance from word_ngram function and create a data frame 
freq_list <- function(word_ngram) {
  data_frame <- data.frame(...)
}