library(e1071)
library(readxl)
library(xlsx)

df_data = read_excel("F://Pak Kristoko/RataIndeks.xlsx")

df_data = df_data[ , 31:36]

n <- nrow(df_data)

ntrain <- round(n*0.70)

set.seed(314)

tindex <- sample(n, ntrain)

train_data <- df_data[tindex,]
test_data <- df_data[ , c(1:6)]

pred <- svm(SAVI19 ~ ., data = train_data, type = "eps-regression",na.action = na.omit)

predictsvm <-predict(pred,newdata=test_data)

results <- data.frame(prediction = predictsvm)

write.xlsx(results, "F://Pak Kristoko/Hasil Prediksi New/svmSAVI20.xlsx")

