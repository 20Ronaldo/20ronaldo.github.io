# APP SHINY - PRUEBA F DE FISHER (ANOVA)
# ======================================

library(shiny)
library(ggplot2)
library(dplyr)
library(car)

# Interfaz de usuario
ui <- fluidPage(
  titlePanel("📊 App Shiny - Prueba F de Fisher (ANOVA)"),
  sidebarLayout(
    sidebarPanel(
      h4("Configuración de Datos"),
      numericInput("n_obs", "Observaciones por grupo:", value = 30, min = 10, max = 100),
      numericInput("media_A", "Media Grupo A:", value = 50, step = 1),
      numericInput("media_B", "Media Grupo B:", value = 65, step = 1),
      numericInput("media_C", "Media Grupo C:", value = 80, step = 1),
      numericInput("sd_grupos", "Desviación estándar:", value = 5, min = 1, max = 20),
      actionButton("analizar", "🎯 Ejecutar ANOVA", class = "btn-primary"),
      br(), br(),
      downloadButton("descargar_reporte", "📥 Descargar Reporte")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Resultados ANOVA",
                 h3("Resultados de la Prueba F de Fisher"),
                 verbatimTextOutput("resultado_anova"),
                 h4("Prueba Post-Hoc de Tukey"),
                 verbatimTextOutput("resultado_tukey")
        ),
        
        tabPanel("Gráficos",
                 h3("Visualización de Resultados"),
                 plotOutput("grafico_boxplot", height = "400px"),
                 plotOutput("grafico_tukey", height = "400px")
        ),
        
        tabPanel("Estadísticas Descriptivas",
                 h3("Resumen por Grupos"),
                 tableOutput("tabla_estadisticas"),
                 h4("Verificación de Supuestos"),
                 verbatimTextOutput("supuestos")
        ),
        
        tabPanel("Datos",
                 h3("Datos Generados"),
                 dataTableOutput("tabla_datos")
        )
      )
    )
  )
)

# Servidor
server <- function(input, output) {
  
  # Generar datos reactivos
  datos_reactivos <- eventReactive(input$analizar, {
    set.seed(123) # Para reproducibilidad
    
    data.frame(
      grupo = factor(rep(c("Grupo_A", "Grupo_B", "Grupo_C"), 
                         each = input$n_obs)),
      valor = c(
        rnorm(input$n_obs, input$media_A, input$sd_grupos),
        rnorm(input$n_obs, input$media_B, input$sd_grupos),
        rnorm(input$n_obs, input$media_C, input$sd_grupos)
      )
    )
  })
  
  # Modelo ANOVA reactivo
  modelo_anova <- reactive({
    datos <- datos_reactivos()
    aov(valor ~ grupo, data = datos)
  })
  
  # Resultado Tukey reactivo
  tukey_resultado <- reactive({
    TukeyHSD(modelo_anova())
  })
  
  # OUTPUT: Resultados ANOVA
  output$resultado_anova <- renderPrint({
    req(input$analizar)
    cat("=== PRUEBA F DE FISHER (ANOVA) ===\n\n")
    summary(modelo_anova())
  })
  
  # OUTPUT: Resultados Tukey
  output$resultado_tukey <- renderPrint({
    req(input$analizar)
    cat("=== PRUEBA POST-HOC DE TUKEY HSD ===\n\n")
    print(tukey_resultado())
  })
  
  # OUTPUT: Gráfico Boxplot
  output$grafico_boxplot <- renderPlot({
    req(input$analizar)
    datos <- datos_reactivos()
    
    ggplot(datos, aes(x = grupo, y = valor, fill = grupo)) +
      geom_boxplot(alpha = 0.7) +
      geom_jitter(width = 0.2, alpha = 0.5) +
      stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "red") +
      labs(title = "Distribución de Valores por Grupo",
           subtitle = "Puntos rojos = Media de cada grupo",
           x = "Grupos", y = "Valores") +
      theme_minimal() +
      scale_fill_brewer(palette = "Set2")
  })
  
  # OUTPUT: Gráfico Tukey
  output$grafico_tukey <- renderPlot({
    req(input$analizar)
    tukey <- tukey_resultado()
    
    par(mar = c(5, 8, 4, 2))
    plot(tukey, las = 1, col = "blue")
    title("Comparaciones Múltiples - Tukey HSD")
  })
  
  # OUTPUT: Tabla de estadísticas
  output$tabla_estadisticas <- renderTable({
    req(input$analizar)
    datos <- datos_reactivos()
    
    datos %>%
      group_by(grupo) %>%
      summarise(
        n = n(),
        Media = round(mean(valor), 2),
        Desviación = round(sd(valor), 2),
        Mínimo = round(min(valor), 2),
        Máximo = round(max(valor), 2),
        .groups = 'drop'
      )
  }, striped = TRUE, hover = TRUE, bordered = TRUE)
  
  # OUTPUT: Verificación de supuestos
  output$supuestos <- renderPrint({
    req(input$analizar)
    modelo <- modelo_anova()
    datos <- datos_reactivos()
    
    cat("=== VERIFICACIÓN DE SUPUESTOS DEL ANOVA ===\n\n")
    
    # Normalidad
    cat("1. NORMALIDAD (Shapiro-Wilk):\n")
    shapiro <- shapiro.test(residuals(modelo))
    cat("   p-value =", round(shapiro$p.value, 4))
    if(shapiro$p.value > 0.05) {
      cat(" ✅ Cumple supuesto de normalidad\n")
    } else {
      cat(" ❌ No cumple supuesto de normalidad\n")
    }
    
    # Homogeneidad de varianzas
    cat("\n2. HOMOGENEIDAD DE VARIANZAS (Levene):\n")
    levene <- leveneTest(valor ~ grupo, data = datos)
    cat("   p-value =", round(levene$`Pr(>F)`[1], 4))
    if(levene$`Pr(>F)`[1] > 0.05) {
      cat(" ✅ Cumple homogeneidad de varianzas\n")
    } else {
      cat(" ❌ No cumple homogeneidad de varianzas\n")
    }
  })
  
  # OUTPUT: Tabla de datos
  output$tabla_datos <- renderDataTable({
    req(input$analizar)
    datos_reactivos()
  }, options = list(pageLength = 10))
  
  # DOWNLOAD: Reporte descargable
  output$descargar_reporte <- downloadHandler(
    filename = function() {
      paste("reporte_anova_", Sys.Date(), ".txt", sep = "")
    },
    content = function(file) {
      writeLines(c(
        "REPORTE - PRUEBA F DE FISHER (ANOVA)",
        paste("Generado:", Sys.Date()),
        "=====================================",
        "",
        capture.output(summary(modelo_anova())),
        "",
        "PRUEBA TUKEY HSD:",
        capture.output(print(tukey_resultado())),
        "",
        "ESTADÍSTICAS DESCRIPTIVAS:",
        capture.output(aggregate(valor ~ grupo, data = datos_reactivos(), 
                                 FUN = function(x) c(Media = mean(x), SD = sd(x))))
      ), file)
    }
  )
}

# Ejecutar la aplicación
shinyApp(ui = ui, server = server)