## Author: Scarlett Hwang
## Eviction OCR Research 
## June 25th, 2019

library(readr)

## read in files (TBA)
file <- read_file("text1.txt")
file_array <- c()
file_array <- append(file_array, file)

## word n-gram 
## passes every occurance to chart maker function
## params: sentence - the sentence we want to analyze
##         num - number of n-gram (2 for bigram)
word_ngram <- function(sentence, num) {
  # remove new lines
  sentence <- stringr::str_replace(sentence, '\n', ' ')
  # tokenize words
  text <- strsplit(sentence, ' ') %>% Reduce(c, .)
  ngram <- c()

  for (x in 1:length(text)) {
    if (nchar(text[x]) < 2)
      next
    splitted <- c(strsplit(text[x], ''))[[1]]
    for (letter in 1:(length(splitted)-1)) {
      ngram <- append(ngram, paste0(splitted[seq(letter, letter+num-1)], collapse = ""))
    }
  }
  freq_list(c(ngram))
}

## make frequency list
## recieve every occurance from word_ngram function and create a named vector list
## params: ngram - bigram pairs of passed text file
freq_list <- function(ngram) {
  v <- NULL
  # set start number (0) to all unique bigrams
  for (i in 1:length(ngram)) {
      v[ngram[i]] <- 0
  }
  # increment counts of a unique bigram
  for (i in 1:length(ngram)) {
    v[ngram[i]] <- v[ngram[i]] + 1
  }
  return(v)
}

# execute
word_ngram(file, 2)
