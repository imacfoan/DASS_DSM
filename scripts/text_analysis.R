


reviews <- read_csv("data/reviews.csv")

positive_reviews <- reviews %>%
  filter(score == 1) %>%
  pull(review)  

text_doc <- Corpus(VectorSource(positive_reviews))

# Preprocess the text in the corpus
text_doc <- tm_map(text_doc, tolower)
text_doc <- tm_map(text_doc, removePunctuation)
text_doc <- tm_map(text_doc, removeNumbers)
text_doc <- tm_map(text_doc, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(text_doc) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

top_words <- df %>%
  arrange(desc(freq)) %>%
  head(100)

# Now generate the word cloud with these top 100 words

wordcloud2(data = top_words, size = 0.7, color ='random-dark')


##########################################



library(tokenizers)

# Tokenization
df_tokenized <- reviews %>%
  unnest_tokens(word, text)

# Term frequency
df_term_freq <- df_tokenized %>%
  count(document_id = row_number(), word, sort = TRUE)

# Calculate TF-IDF
df_tfidf <- df_term_freq %>%
  bind_tf_idf(word, document_id, n)

# Spread words into features for the logistic regression model
library(tidyr)
df_tfidf_wide <- df_tfidf %>%
  pivot_wider(names_from = word, values_from = tf_idf, values_fill = list(tf_idf = 0))