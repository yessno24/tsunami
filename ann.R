library(neuralnet)
library(nnet)
library(readxl)
library(caret)
library(xlsx)

data = read_excel("F://Pak Kristoko/RataIndeks.xlsx")

df_data <- data[ , 31:36]
#menghitung jumlah baris data
n <- nrow(df_data)

ntrain <- round(n*0.70)

set.seed(314)

#normalisasi data supaya cocok menggunakan ANN
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

tindex <- as.data.frame(lapply(df_data, normalize))

maxmindf <- sample(n, ntrain)

# Training and Test Data
train_data <- tindex[maxmindf,] #75%
test_data <- tindex[,c(1:6)]


nn <- neuralnet(SAVI19 ~ ., 
                data=train_data, 
                hidden=1, 
                linear.output=TRUE, 
                threshold=0.01)

nn.results <- compute(nn, test_data)

#restore data
new.results <- (nn.results$net.result*(max(df_data$SAVI19) -
                min(df_data$SAVI19))) + 
                min(df_data$SAVI19)

results <- data.frame(prediction = new.results)

write.xlsx(results, "F://Pak Kristoko/Hasil Prediksi New/annSAVI20.xlsx")
