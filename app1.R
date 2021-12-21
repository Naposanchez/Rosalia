
## UI function

ui <- navbarPage("AnÃ¡lisis de obras",
                 tabPanel("VisualizaciÃ³n",fluidPage(theme = shinytheme("flatly")),
                          tags$head(
                            tags$style(HTML(".shiny-output-error-validation{color: red;}"))),
                          pageWithSidebar(
                            headerPanel(
                              h4("RosalÃ­a de Castro", align="center")
                            ), # cierra headerPanel
                            fluidRow(
                              column(8,###
                                     sidebarPanel(width = 4,
                                                  radioButtons("radio", 
                                                               label =NULL,
                                                               choices = list("1. La hija del mar (1859)" = 1,
                                                                              "2. Flavio (1861)" = 2,
                                                                              "3. Ruinas (1866)" = 3,
                                                                              "4. El caballero de las botas azules (1867)" = 4,
                                                                              "5. El primer loco (1881)" = 5), # cierra list
                                                               selected = 3)# cierra radioButtons
                                     ), ### cierra sidebarPanel
                                     column(8, ###
                                            sidebarPanel(width = 8,
                                                         sliderInput("sectorh","seleccione la pÃ¡gina:",
                                                                     min = 1, max = 27, step= 1,
                                                                     value = 1)
                                            )###
                                            
                                     )### column(8,
                              ), # column(8,
                            ),### cierra fluidRow
                            
                            mainPanel(
                              hr(),
                              
                              headerPanel(
                                h4(verbatimTextOutput("texto"), align="center")
                              ), # cierra headerPanel
                              p("Texto de la pÃ¡gina seleccionada por cargar (pendiente de hacer)", target="_blank",".",style = "font-size:25px"),
                              hr(), 
                              
                              
                              tabsetPanel(
                                tabPanel("Palabras", plotOutput(outputId="plot1",  width="400px",height="1200px")), #,
                                tabPanel("Sentimientos", plotlyOutput(outputId="plot2",  width="1000px",height="1200px")),
                                tabPanel("Total de sentimientos", plotOutput(outputId="plot3",  width="800px",height="600px"))
                              )# termina tabsetPanel
                            ) # termina mainPanel
                            
                          )   #cierra pageWithSidebar
                          
                 ),# tabPanel("VisualizaciÃ³n
                 
                 
                 
                 tabPanel("InformaciÃ³n",
                          
                          
                          hr(), 
                          p("Este trabajo se vincula al proyecto financiado por FEDER / Ministerio de Ciencia, InnovaciÃ³n y Universidades, la Agencia Estatal de InvestigaciÃ³n / Proyecto Cartografias del afecto y usos publicos de la memoria: un analisis geoespacial de la obra de Rosalia de Castro (FFI2017-82742-P), financiado por el MINECO.",
                            a("mayor informaciÃ³n", href="https://www.compostelageoliteraria.org/", target="_blank"), ".",
                            style = "font-size:25px"),
                          hr(), 
                 ),
                 
                 
                 tabPanel("Desarrolladores",
                          p(a("Fernando Cabo Aseguinolaza", href="https://orcid.org/0000-0002-8255-2719", target="_blank"),style = "font-size:23px"),
                          p("e-mail: fernando.cabo@usc.es",style = "font-size:20px"),
                          p(a("MarÃ­a do Cebreiro RÃ¡bade Villar", href="https://orcid.org/0000-0003-4164-1659", target="_blank"),style = "font-size:23px"),
                          p("e-mail: m.rabade@usc.es",style = "font-size:20px"),
                          p(a("Laura Camino Plaza", href="https://orcid.org/0000-0001-6869-8829", target="_blank"),style = "font-size:23px"),
                          p("e-mail: laura.camino@usc.es",style = "font-size:20px"),
                          p(a("NapoleÃ³n Guillermo SÃ¡nchez ChÃ³ez", href="https://orcid.org/0000-0003-3238-2237", target="_blank"),style = "font-size:23px"),
                          p("e-mail: napoleonguillermo.sanchez@rai.usc.es",style = "font-size:20px"))
                 
)


server <- function(input, output) ({
  
  
  output$value <- renderText({ 
    paste("Usted selecciono el sentimiento:", input$porcen)
  })
  
  output$texto <- renderText({ 
    paste0("Texto: pÃ¡gina ", input$sectorh)
  })
  
  
  output$plot1 <- renderPlot({
    
    data10 %>%filter(paginas == paste0("V",input$sectorh) & valor>0)%>%
      
      ggplot(aes(x=valor,y=reorder(ID_pal,valor)))+
      geom_bar(stat="identity", size=1,alpha=0.7,width=0.4) +
      geom_text(
        aes(label = valor, size=2),
        vjust = 0.5)+
      labs(title= paste0("PÃ¡gina ",input$sectorh), y =NULL, x=NULL) +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5, size = 16),
            axis.text = element_text(color = "black", size = 14),
            legend.position = "none")
    
    
  })
  output$plot2 <- renderPlotly({
    plot_ly(
      x = colnames(get(paste0("pagina_",input$sectorh))), y = rownames(get(paste0("pagina_",input$sectorh))),
      z =get(paste0("pagina_",input$sectorh)),
      colors = colorRamp(c("white", "blue","cyan", "Black", "red")),
      
      type = "heatmap"
    )
    
  })
  
  output$plot3 <- renderPlot({
    
    ggplot(data=get(paste0("df_colum_",input$sectorh)), aes(x=reorder(sent,-V1), y=V1)) +
      geom_bar(stat="identity", fill="steelblue")+
      geom_text(aes(label=V1), vjust=1.6, color="black", size=5.5)+
      labs(title= paste0("PÃ¡gina ",input$sectorh))+
      xlab("Sentimientos")+
      ylab("Total")+
      theme_minimal()
    
    
  })
})

shinyApp(ui,server)


