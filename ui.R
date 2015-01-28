library(shiny)
shinyUI(navbarPage(
	title = 'Lexicon',
	tabPanel("http://github.com/statvn/lexicon",dataTableOutput('mytable'))
))
