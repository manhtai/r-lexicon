library(shiny)
shinyUI(navbarPage(
	title = 'Lexicon',
	tabPanel("http://github.com/hochanh/lexicon",dataTableOutput('mytable'))
))
