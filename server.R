library(shiny)
lexicon <- read.csv("lexicon.txt", 
										sep=";", header=F, stringsAsFactors=F)
colnames(lexicon) <- c("En","Vi","Chú thích")
shinyServer(function(input, output) {
	output$mytable <- renderDataTable(lexicon, options = list(pageLength = 25))
	})
