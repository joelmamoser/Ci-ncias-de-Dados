install.packages("microdatasus")

library(microdatasus)
dados_sih <- fetch_datasus(year_start = 2022, 
                           year_end = 2022, 
                           month_start = 1,
                           month_end = 3,
                           uf = "SC", 
                           information_system = "SIH-SP")


# Incluir a coluna "MUNIC_RES" diretamente no conjunto de dados
dados_sih$MUNIC_RES <- NA_integer_
dados_sih <- process_sih(dados_sih, municipality_data = TRUE)

write.csv2(dados_sih,
           file = "SIH-SP-SC-2022_9.csv",
           row.names = FALSE)

View(dados_sih)
