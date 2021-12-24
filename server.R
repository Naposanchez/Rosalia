
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