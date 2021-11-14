library(class)
library(readxl)
library(caret)
library(xlsx)

df_data = read_excel("F://Pak Kristoko/RataIndeks.xlsx")
View(df_data)
df_data = df_data[ , 31:37]

df_data <- as.data.frame(df_data)

set.seed(123)

dat.d <- sample(1:nrow(df_data),size=nrow(df_data)*0.70,replace = FALSE) #random selection of 70% data

# Training and Test Data
train_data <- df_data[dat.d,] #70%
test_data <- df_data[,]

train_data_labels <- df_data[dat.d,7]
test_data_labels <- df_data[,7]

NROW(train_data_labels)

#KNN
knn.k <- knn(train=train_data, test=test_data, cl=train_data_labels, k=1)

results <- data.frame(prediction = knn.k)

write.xlsx(results, "F://Pak Kristoko/Hasil Prediksi New/k1_savi_21.xlsx")

knn.k <- knn(train=train_data, test=test_data, cl=train_data_labels, k=2)

results <- data.frame(prediction = knn.k)

write.xlsx(results, "F://Pak Kristoko/Hasil Prediksi New/k2_savi_21.xlsx")

