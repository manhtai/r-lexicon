library(shiny)
shinyUI(navbarPage(
	title = 'Lexicon',
	tabPanel('Nhấp vào tiêu đề để sắp xếp', dataTableOutput('mytable'))
))
