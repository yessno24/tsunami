library(readxl)
library(forecast)

df_data = read_excel("F://Pak Kristoko/Hasil Prediksi New/svmSAVI20.xlsx")

# Calculating MSE
MSE.knn <- sum((df_data$actual_2020 - df_data$prediction_2020)^2)/47
MSE.knn

accuracy(df_data$prediction_2020, df_data$actual_2020)
