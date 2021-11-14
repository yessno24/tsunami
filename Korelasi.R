library(ggplot2)
library(GGally)
library(readxl)
library(caret)

df_data = read_excel("F://Pak Kristoko/Kulonprogo.xlsx")

ggplot <- function (...) 
  ggplot2 :: ggplot (...) 

unlockBinding ("ggplot", parent.env (asNamespace ("GGally")))
assign ("ggplot", ggplot, parent.env (asNamespace ("GGally")))

graph_corr <- ggpairs (df_data, mapping = aes (color = Vulnerability_Level), 
                       column = c ('NDVI', 
                                   'NDWI', 
                                   'MNDWI', 
                                   'NDBI', 
                                   'SAVI',
                                   'Vulnerability_Level'), 
                       columnLabels = c ('NDVI', 
                                         'NDWI', 
                                         'MNDWI', 
                                         'NDBI', 
                                         'SAVI',
                                         'Vulnerability Level')) 
graph_corr <- graph_corr + theme_bw ()

for(i in 1:graph_corr$nrow) {
  for(j in 1:graph_corr$ncol){
    graph_corr[i,j] <- graph_corr[i,j] + 
      scale_fill_manual(values=c("#866cc4", "#ae41c4", "#e344a6")) +
      scale_color_manual(values=c("#866cc4", "#ae41c4", "#e344a6"))  
  }
}
graph_corr
