library(shiny)
lexicon <- read.csv("lexicon.txt", header=F, stringsAsFactors=F)
colnames(lexicon) <- c("EN","VI")
shinyServer(function(input, output) {
	output$mytable <- renderDataTable(lexicon, options = list(pageLength = 25))
	})
