###################################################################################

sink()  
rm(list=ls(all=TRUE),envir=globalenv())	
cat("\014")	


pacotes = c("shiny", "shinydashboard", "shinythemes", "shinyjs", "plotly", "shinycssloaders","tidyverse","shinyWidgets",
            "scales", "knitr", "kableExtra", "ggfortify","FNN","readxl", "gridExtra", "ggplot2")


package.check <- lapply(pacotes, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
  }
})


library(shinyWidgets)
library(dplyr)
library(gridExtra)
library(plotly)
library(plot3D)
library(rgl)


data10 <- readRDS("pal_pag_ruinas.rds")


for(i in 1:27) { # Creamos objetos  'pagina_1', 'pagina_2', ... 'pagina_27' 
  nam <- paste("pagina",i, sep="_")
  assign(nam, readRDS(file=paste0("pagina_",i,".rds")))
}


sum_colum_1 <- colSums(pagina_1)
sum_colum_2 <- colSums(pagina_2)
sum_colum_3 <- colSums(pagina_3)
sum_colum_4 <- colSums(pagina_4)
sum_colum_5 <- colSums(pagina_5)
sum_colum_6 <- colSums(pagina_6)
sum_colum_7 <- colSums(pagina_7)
sum_colum_8 <- colSums(pagina_8)
sum_colum_9 <- colSums(pagina_9)
sum_colum_10 <- colSums(pagina_10)

sum_colum_11 <- colSums(pagina_11)
sum_colum_12 <- colSums(pagina_12)
sum_colum_13 <- colSums(pagina_13)
sum_colum_14 <- colSums(pagina_14)
sum_colum_15 <- colSums(pagina_15)
sum_colum_16 <- colSums(pagina_16)
sum_colum_17 <- colSums(pagina_17)
sum_colum_18 <- colSums(pagina_18)
sum_colum_19 <- colSums(pagina_19)
sum_colum_20 <- colSums(pagina_20)

sum_colum_21 <- colSums(pagina_21)
sum_colum_22 <- colSums(pagina_22)
sum_colum_23 <- colSums(pagina_23)
sum_colum_24 <- colSums(pagina_24)
sum_colum_25 <- colSums(pagina_25)
sum_colum_26 <- colSums(pagina_26)
sum_colum_27 <- colSums(pagina_27)

#sum_colum_1

df_colum_1 <- as.data.frame(as.matrix(sum_colum_1))
df_colum_2 <- as.data.frame(as.matrix(sum_colum_2))
df_colum_3 <- as.data.frame(as.matrix(sum_colum_3))
df_colum_4 <- as.data.frame(as.matrix(sum_colum_4))
df_colum_5 <- as.data.frame(as.matrix(sum_colum_5))
df_colum_6 <- as.data.frame(as.matrix(sum_colum_6))
df_colum_7 <- as.data.frame(as.matrix(sum_colum_7))
df_colum_8 <- as.data.frame(as.matrix(sum_colum_8))
df_colum_9 <- as.data.frame(as.matrix(sum_colum_9))
df_colum_10 <- as.data.frame(as.matrix(sum_colum_10))

df_colum_11 <- as.data.frame(as.matrix(sum_colum_11))
df_colum_12 <- as.data.frame(as.matrix(sum_colum_12))
df_colum_13 <- as.data.frame(as.matrix(sum_colum_13))
df_colum_14 <- as.data.frame(as.matrix(sum_colum_14))
df_colum_15 <- as.data.frame(as.matrix(sum_colum_15))
df_colum_16 <- as.data.frame(as.matrix(sum_colum_16))
df_colum_17 <- as.data.frame(as.matrix(sum_colum_17))
df_colum_18 <- as.data.frame(as.matrix(sum_colum_18))
df_colum_19 <- as.data.frame(as.matrix(sum_colum_19))
df_colum_20 <- as.data.frame(as.matrix(sum_colum_20))

df_colum_21 <- as.data.frame(as.matrix(sum_colum_21))
df_colum_22 <- as.data.frame(as.matrix(sum_colum_22))
df_colum_23 <- as.data.frame(as.matrix(sum_colum_23))
df_colum_24 <- as.data.frame(as.matrix(sum_colum_24))
df_colum_25 <- as.data.frame(as.matrix(sum_colum_25))
df_colum_26 <- as.data.frame(as.matrix(sum_colum_26))
df_colum_27 <- as.data.frame(as.matrix(sum_colum_27))

##################################

df_colum_1$sent<-rownames(df_colum_1)
df_colum_2$sent<-rownames(df_colum_2)
df_colum_3$sent<-rownames(df_colum_3)
df_colum_4$sent<-rownames(df_colum_4)
df_colum_5$sent<-rownames(df_colum_5)
df_colum_6$sent<-rownames(df_colum_6)
df_colum_7$sent<-rownames(df_colum_7)
df_colum_8$sent<-rownames(df_colum_8)
df_colum_9$sent<-rownames(df_colum_9)
df_colum_10$sent<-rownames(df_colum_10)

df_colum_11$sent<-rownames(df_colum_11)
df_colum_12$sent<-rownames(df_colum_12)
df_colum_13$sent<-rownames(df_colum_13)
df_colum_14$sent<-rownames(df_colum_14)
df_colum_15$sent<-rownames(df_colum_15)
df_colum_16$sent<-rownames(df_colum_16)
df_colum_17$sent<-rownames(df_colum_17)
df_colum_18$sent<-rownames(df_colum_18)
df_colum_19$sent<-rownames(df_colum_19)
df_colum_20$sent<-rownames(df_colum_20)


df_colum_21$sent<-rownames(df_colum_21)
df_colum_22$sent<-rownames(df_colum_22)
df_colum_23$sent<-rownames(df_colum_23)
df_colum_24$sent<-rownames(df_colum_24)
df_colum_25$sent<-rownames(df_colum_25)
df_colum_26$sent<-rownames(df_colum_26)
df_colum_27$sent<-rownames(df_colum_27)



#####################

## UI function

ui <- navbarPage("Análisis de obras",
                 tabPanel("Visualización",fluidPage(theme = shinytheme("flatly")),
                            tags$head(
                            tags$style(HTML(".shiny-output-error-validation{color: red;}"))),
                            pageWithSidebar(
                            headerPanel(
                                       h4("Rosalía de Castro", align="center")
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
                                                               sliderInput("sectorh","seleccione la página:",
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
                             p("Texto de la página seleccionada por cargar (pendiente de hacer)", target="_blank",".",style = "font-size:25px"),
                              hr(), 
                           
                           
                           tabsetPanel(
                            tabPanel("Palabras", plotOutput(outputId="plot1",  width="400px",height="1200px")), #,
                            tabPanel("Sentimientos", plotlyOutput(outputId="plot2",  width="1000px",height="1200px")),
                            tabPanel("Total de sentimientos", plotOutput(outputId="plot3",  width="800px",height="600px"))
                          )# termina tabsetPanel
                           ) # termina mainPanel
                         
                         )   #cierra pageWithSidebar
                        
                         ),# tabPanel("Visualización
               

                       
                 tabPanel("Información",
                          
                          
                          hr(), 
                          p("Este trabajo se vincula al proyecto financiado por FEDER / Ministerio de Ciencia, Innovación y Universidades, la Agencia Estatal de Investigación / Proyecto Cartografias del afecto y usos publicos de la memoria: un analisis geoespacial de la obra de Rosalia de Castro (FFI2017-82742-P), financiado por el MINECO.",
                            a("mayor información", href="https://www.compostelageoliteraria.org/", target="_blank"), ".",
                            style = "font-size:25px"),
                          hr(), 
                          ),
                 
                 
                 tabPanel("Desarrolladores",
                          p(a("Fernando Cabo Aseguinolaza", href="https://orcid.org/0000-0002-8255-2719", target="_blank"),style = "font-size:23px"),
                          p("e-mail: fernando.cabo@usc.es",style = "font-size:20px"),
                          p(a("María do Cebreiro Rábade Villar", href="https://orcid.org/0000-0003-4164-1659", target="_blank"),style = "font-size:23px"),
                          p("e-mail: m.rabade@usc.es",style = "font-size:20px"),
                          p(a("Laura Camino Plaza", href="https://orcid.org/0000-0001-6869-8829", target="_blank"),style = "font-size:23px"),
                          p("e-mail: laura.camino@usc.es",style = "font-size:20px"),
                          p(a("Napoleón Guillermo Sánchez Chóez", href="https://orcid.org/0000-0003-3238-2237", target="_blank"),style = "font-size:23px"),
                          p("e-mail: napoleonguillermo.sanchez@rai.usc.es",style = "font-size:20px"))

)
                 

server <- function(input, output) ({
  
  
  output$value <- renderText({ 
    paste("Usted selecciono el sentimiento:", input$porcen)
  })
  
  output$texto <- renderText({ 
                  paste0("Texto: página ", input$sectorh)
                  })
  
   
  output$plot1 <- renderPlot({
      
      data10 %>%filter(paginas == paste0("V",input$sectorh) & valor>0)%>%
      
      ggplot(aes(x=valor,y=reorder(ID_pal,valor)))+
      geom_bar(stat="identity", size=1,alpha=0.7,width=0.4) +
      geom_text(
        aes(label = valor, size=2),
        vjust = 0.5)+
      labs(title= paste0("Página ",input$sectorh), y =NULL, x=NULL) +
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
      labs(title= paste0("Página ",input$sectorh))+
      xlab("Sentimientos")+
      ylab("Total")+
      theme_minimal()
   
    
  })
})

shinyApp(ui,server)


