base::rm(list = ls())

# 직접 데이터 입력하기
ID <- c(1, 2, 3, 4, 5)
ID

SEX <- c("F", "M", "F", "M", "F")
SEX

DATA <- data.frame(ID = ID, SEX = SEX)
View(DATA)

# TXT 파일 가져오기
ex_data <- read.table("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.txt", encoding = "EUC-KR",
                      fileEncoding = "UTF-8")
View(ex_data)

# 변수명 지정하기
ex_data1 <- read.table("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.txt", encoding = "EUC-KR",
                       fileEncoding = "UTF-8", header = TRUE)
View(ex_data1)

# 변수명으로 사용할 행이 없을때
varname <- c("ID", "SEX", "AGE", "AREA")
ex1_data <- read.table("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.txt", encoding = "EUC-KR",
                       fileEncoding = "UTF-8", col.names = varname)
View(ex1_data)

# 행 스킵하여 가져오기
ex_data2 <- read.table("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.txt", encoding = "EUC-KR",
                       fileEncoding = "UTF-8",
                       header = TRUE, skip =2)
View(ex_data2)

# 행 개수 지정하여 가져오기
ex_data3 <- read.table("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.txt", encoding = "EUC-KR",
                      fileEncoding = "UTF-8",
                      header = TRUE, nrows = 7)
View(ex_data3)

# 데이터 구분자 지정하여 가져오기
ex_data4 <- read.table("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.txt", encoding = "EUC-KR",
                       fileEncoding = "UTF-8",
                       header = TRUE, sep = ",")
View(ex_data4)

# CSV 파일 가져오기
ex_data <- read.csv("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.csv")
View(ex_data)

# readxl 패키지 설치 및 로드하기
install.packages('readxl')
library(readxl)


# 엑셀 파일 가져오기
excel_data_ex <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.xlsx")
View(excel_data_ex)

# XML 패키지 설치 및 로드하기
install.packages("XML")
library(XML)

# XML 파일 가져오기
xml_data <- xmlToDataFrame("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.xml")
View(xml_data)

# jsonlite 패키지 설치 및 로드하기
install.packages("jsonlite")
library(jsonlite)

# JSON 파일 가져오기
json_data <- fromJSON("C:/Users/JAMJAM/Desktop/R_Studio_Practice/data_ex.json")
str(json_data)

# 내장 데이터 세트 가져오기
data("iris")
iris

# 데이터 구조 확인하기
str(iris)

# 데이터 세트 칼럼 및 관측치 확인하기
ncol(iris)
nrow(iris)
dim(iris)

# 데이터 세트 칼럼명 확인하기
ls(iris)

# 데이터 앞부분 값 확인하기
head(iris)

# 데이터 뒷부분 값 확인하기
tail(iris, n =3)

# 평균,중앙값 구하기
mean(iris$Sepal.Length)
median(iris$Sepal.Length)

# 최솟값,최댓값,범위 구하기
min(iris$Sepal.Length)
max(iris$Sepal.Length)
range(iris$Sepal.Length)

# 사분위수 구하기
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, probs = 0.25)
quantile(iris$Sepal.Length, probs = 0.5)
quantile(iris$Sepal.Length, probs = 0.75)
quantile(iris$Sepal.Length, probs = 0.8)

# 분산과 표준편차 구하기
var(iris$Sepal.Length)
sd(iris$Sepal.Length)

# psych 패키지 설치 및 로드하기
install.packages("psych")
library(psych)

# 첨도와 왜도 구하기
kurtosi(iris$Sepal.Length)
skew(iris$Sepal.Length)

# descr 패키지 설치 및 로드하기
install.packages("descr")
library(descr)

# 빈도분석하기
freq_test <- freq(iris$Sepal.Length, plot = F)
freq_test

# descr 패키지 설치 및 로드하기
install.packages("descr")
library(descr)

# 엑셀 파일 가져오기
library(readxl)
exdata1 <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/sample1.xlsx")
exdata1

# 막대 그래프 그리기
freq(exdata$SEX, plot = T, main = '성별(barplot)')

# 빈도 분포를 구하고 막대 그래프 그리기
dist_sex <- table(exdata1$SEX)
dist_sex
barplot(dist_sex)

# 막대 그래프 축 범위와 제목 지정하기
barplot(dist_sex, ylim = c(0,14), main = "BARPLOT", xlab = "SEX",
        ylab = "FREQUENCY",
        names = c("Female", "Male"))

# 막대 그래프 색상 변경하기
barplot(dist_sex, ylim = c(0,14), main = "BARPLOT", xlab = "SEX",
        ylab = "FREQUENCY", names = c("Female", "Male"),
        col = c("pink","navy"))

# 상자 그림 그리기
boxplot(exdata1$Y21_CNT, exdata1$Y20_CNT)

# 상자 그림 축 범위, 제목 지정하기
boxplot(exdata1$Y21_CNT,
        exdata1$Y20_CNT,
        ylim = c(0,60),
        main = "boxplot",
        names = c("21년건수",
                  "20년건수"))

# 상자 그림 색상 변경하기
boxplot(exdata1$Y21_CNT,
        exdata1$Y20_CNT,
        ylim = c(0,60),
        main = "boxplot",
        names = c("21년건수",
                  "20년건수"),
        col = c("green",
                "yellow"))

# 히스토그램 그리기
hist(exdata1$AGE, xlim = c(0,60), ylim =c(0,7), main = "AGE분포")

# 파이차트 그리기
data(mtcars)
x <- table(mtcars$gear)
pie(x)

# 줄기 잎 그림 그리기
x <- c (1, 2, 3, 4, 7, 8, 8, 5, 9, 6, 9)
stem(x)

stem(x, scale = 0.5)

# 산점도 그리기
data(iris)
plot(x = iris$Sepal.Length, y = iris$Petal.Width)

# 산점도 행렬 그리기 
data(iris)
pairs(iris)

# psych 패키지로 산점도 행렬 그리기
install.packages("psych")
library(psych)
data(iris)
pairs.panels(iris)