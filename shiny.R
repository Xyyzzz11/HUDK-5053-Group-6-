library(shiny)
library(wordcloud2)
shinyApp(
  ui=shinyUI(fluidPage(
    
    #using default clicked word input id
    wordcloud2Output("my_wc", width = "50%", height = "400px"),
    #using custom clicked word input id
    wordcloud2Output("my_wc2", width = "50%", height = "400px"),
    
    verbatimTextOutput("print"),
    verbatimTextOutput("print2")
  
    )),
  server=shinyServer(function(input,output,session){
    
   # figPath = system.file("examples/a.png",package = "wordcloud2")
    dreamcareer = read.csv("dreamCareer.csv")
    output$my_wc  = renderWordcloud2(wordcloud2(data = dreamcareer, size = 0.4,color = rainbow(10)))
    #output$my_wc2 = renderWordcloud2(wordcloud2(dreamcareer))
    
    #using default clicked word input id
    output$print  = renderPrint(input$my_wc_clicked_word)
    #using custom clicked word input id
    #output$print2 = renderPrint(input$my_wc2_clicked_word)
  })
)

