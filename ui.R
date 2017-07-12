shinyUI(
  fluidPage(id = "main",
            tags$head(
              tags$link(rel = "stylesheet", type = "text/css", href = "css/bootstrap.cosmo.min.css"),
              tags$link(rel = "stylesheet", type = "text/css", href = "css/custom.css"),
              tags$script(src = "js/script.js")
              ),
            leafletOutput("map", width = "100%", height = "100%"),
            absolutePanel(id = "controls", class = "panel panel-default small", fixed = FALSE, draggable = TRUE,
                          h4("Volcano Data and Information"),
                          h5("Magnitude"),
                          hr(),
                          checkboxInput(inputId = "showpanel",
                                        label = "Show control panel",
                                        value = FALSE),
                          conditionalPanel(condition = "input.showpanel == true",
                                           sliderInput("fmag", "Magnitude",
                                                       min = 0, max = 1000, value = c(0, 1000), ticks = FALSE),
                                           #sliderInput("fdepth", "Depth",
                                           #             min = 0, max = 1000, value = c(0, 1000), ticks = FALSE),
                                           sliderInput("fyear", "Year",
                                                        min = as.Date("1499","%Y"),
                                                        max = as.Date("2017","%Y"),
                                                        value = c(as.Date("1499","%Y"),as.Date("2017-12-31","%Y")),
                                                      timeFormat="%Y", ticks = FALSE),
                                           checkboxInput(inputId = "showplates",
                                                         label = "Show plates boundaries",
                                                         value = FALSE),
                                           checkboxInput(inputId = "showdata",
                                                         label = "Show data",
                                                         value = FALSE),
                                           conditionalPanel(condition = "input.showdata == true",
                                                            DT::dataTableOutput("table")
                                                            )
                                           ),
                          hr(),
                          p(class = "pull-right",
                            "Information by",
                            a(href = "https://www.ngdc.noaa.gov/hazard/volcano.shtml", "NOAA", target = "_blank"),
                            " | Repo here ",
                            a(href = "https://github.com/NotengoID/volcanoes", icon("github"), target = "_blank")
                            )
                          )
            )
  )