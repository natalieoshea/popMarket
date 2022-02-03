# Define UI for application that draws a histogram
fluidPage(

  # Application title
  titlePanel("Artist Popularity Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("artists", label = "Select Artists:",
                  choices = unique(df$name), multiple = TRUE)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
)
