# Define server logic required to draw a histogram
function(input, output) {

  final_df <- reactive({
    req(input$artists)

    # filter data to only selected artists
    final_df <- df_long %>%
      filter(name %in% input$artists)

    # set factor levels
    # final_df$name <- factor(final_df$name, levels = input$artists)
  })

  output$plot <- renderPlot({
    # aesthetics set in ggplot() are global and applied to the whole plot
    ggplot(final_df(), aes(x = lubridate::date(date), y = popularity)) +
      # aesthetics applied to a specific geom only apply to that layer
      # slightly larger line under colored line gives impression of black outline
      geom_line(color = "black", size = 2) +
      geom_line(aes(color = name), size = 1.2) +
      # set title
      labs(title = "Change in artist popularity over Summer 2021",
           subtitle = "Top 12 artists from Memorial Day to Labor Day",
           caption = "Data: Spotify API") +
      # set color palette (can also use scale_color_manual for more control)
      scale_color_brewer(palette = "Paired") +
      # set y axis to whole numbers
      scale_y_continuous(breaks = scales::pretty_breaks()) +
      theme_custom() +
      # give each name it's own panel
      facet_wrap(~name)
  })
}
