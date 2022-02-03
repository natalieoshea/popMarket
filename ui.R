# Define UI for application that draws a histogram
fluidPage(

  # Application title
  titlePanel("Artist Popularity Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectizeInput("artists", label = "Select Artists:",
                  choices = unique(df$name), multiple = TRUE,
                  options = list(maxItems = 4))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
)
