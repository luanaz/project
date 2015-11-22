shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Iris Data Set K-Means Clustering"),
                sidebarPanel(
                        # Choose two variables to plot
                        helpText("This Shiny application implements K-Means clustering",
                                 "on iris data set, and compares clustering plot with",
                                 "original species plot by two customerized variables.The",
                                 "comparing plots are shown on the right tabset panel."),
                        helpText("1. Choose two variables:"),
                        selectInput("varX", "Choose the first variable:", 
                                    choices = c("Sepal.Length", "Sepal.Width",
                                                "Petal.Length", "Petal.Width")),
                        selectInput("varY", "Choose the second variable:", 
                                    choices = c("Sepal.Width", "Sepal.Length",
                                                "Petal.Length", "Petal.Width")),
                        helpText("2. Choose colors to indicate species and clustering:"),
                        # Choose preferred colors
                        radioButtons("pColors", "Choose preferred colors:", 
                                     choices = c("black, red, green" = "in.brg",
                                                 "red, green, blue" = "in.rgb",
                                                 "green, blue, pale blue" = "in.gbp"))
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Original Plot by Species", plotOutput("oPlot")),
                                tabPanel("Clustering Plot by K-Means", plotOutput("cPlot"))
                        )
                )
        )
)