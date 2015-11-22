data(iris)

set.seed(1234)
kc <- kmeans(iris[, 1:4], 3)  # K-Means clustering algorithm

shinyServer(
        function(input, output) {
                # Get the preferred colors
                inColors <- reactive({
                        switch(input$pColors,
                               "in.brg" = 0,
                               "in.rgb" = 1,
                               "in.gbp" = 2)
                })
                
                # Plot original plot by Species
                output$oPlot <- renderPlot({
                        plot(iris[, input$varX], iris[, input$varY], 
                             col = as.integer(iris$Species) + inColors(),
                             xlab = input$varX, ylab = input$varY,
                             main = paste("Plot of", input$varX, 
                                          "and", input$varY, "by Species"))
                })
                
                # Plot clustering plot by K-Means
                output$cPlot <- renderPlot({
                        plot(iris[, input$varX], iris[, input$varY], 
                             col = as.integer(kc$cluster) + inColors(),
                             xlab = input$varX, ylab = input$varY,
                             main = paste("Plot of", input$varX, 
                                          "and", input$varY, "by K-Mean Clustering"))
                })
        }
)