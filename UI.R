library(shiny)


## Define the UI
shinyUI(
  pageWithSidebar(
    
    ## Application Title
    headerPanel("My First Shiny App"),
    
    sidebarPanel(
      
      selectInput("Distribution","Please Select Distribution Type",choices=c("Normal","Exponential")),
      
      sliderInput("sampleSize", "Please select your Sample Size",min=100,max=3000,value=500,step=100),
      
      conditionalPanel(condition="input.Distribution == 'Normal'",
                       textInput("Mean","Please Select the Mean",10),
                       textInput("sd", "Please Select the Standard Deviation",3)),
      
      conditionalPanel(condition="input.Distribution == 'Exponential'",
                       textInput("lambda","Please select the exponential lambda",1))),
    
    mainPanel(
      plotOutput("myPlot")
    )
    
    
  )
)