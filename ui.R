# Define UI for application that draws a histogram
fluidPage(

  # Application title
  titlePanel("Artist Popularity Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
<<<<<<< Updated upstream
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
=======
      selectizeInput("artists", label = "Select Artists:",
                  choices = unique(df$name), multiple = TRUE, options = list(maxItems = 12)),
      dateRangeInput("daterange", "Date range: ",
                     start = "2021-01-01",
                     end   = "2021-12-31",
                     min   = "2021-01-01",
                     max   = "2021-12-31")
>>>>>>> Stashed changes
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
