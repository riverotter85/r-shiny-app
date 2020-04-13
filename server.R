# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

demographic <- counties$white
color <- "green3"
legend.title <- "Population Density"
min <- 0
max <- 100

head(counties)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      demographic <- switch(input$var,
             "Percent White" = counties$white,
             "Percent Black" = counties$black,
             "Percent Hispanic" = counties$hispanic,
             "Percent Asian" = counties$asian)
      
      min <- input$range[1]
      max <- input$range[2]
      
      percent_map(demographic, color, legend.title, min, max)
    })
      
  }
)
    