# 엑셀파일 가져오기
library(readxl)

forest_example_data <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/forest_example_data.xls")

colnames(forest_example_data) <- c("names", "city", "gubun", "area", 
                                   "number", "stay", "city_new",
                                   "code", "codename")
str(forest_example_data)
head(forest_example_data)

# freq() 함수로 시도별 휴양림 빈도 분석하기
library(descr)
freq(forest_example_data$city, plot = T, main = 'city')

# table() 함수로 시도별 휴양림 빈도분석하기
city_table <- table(forest_example_data$city)
city_table
barplot(city_table)

# count() 함수로 시도별 휴양림 빈도분석하고 내림차순 정렬하기
library(dplyr)
count(forest_example_data, city) %>% arrange(desc(n))

# 소재지_시도명 컬럼으로 시도별 분포 확인하기
count(forest_example_data, city_new) %>% arrange(desc(n))

# 제공기관명 컬럼으로 시도별 분포 확인하기
count(forest_example_data, codename) %>% arrange(desc(n))

# 엑셀 파일 가져오기
library(readxl)
entrance_xls <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/entrance_exam.xls")

str(entrance_xls)
head(entrance_xls)

# 컬럼명 변경과 띄어쓰기 제거하기
colnames(entrance_xls) <- c("country", "JAN", "FEB", "MAR", "APR", "MAY",
                            "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")

entrance_xls$country <- gsub(" ","", entrance_xls$country)
entrance_xls

# 1월 기준 상위 5개국 추출하기
entrance_xls %>% nrow()

top5_country <- entrance_xls[order(-entrance_xls$JAN),] %>% head(n=5)
top5_country

# 데이터 구조 재구화하기
library(reshape2)
top5_melt <- melt(top5_country, id.vars = 'country', variable.name = 'mon')
head(top5_melt)

# 선 그래프 그리기
library(ggplot2)

ggplot(top5_melt, aes(x= mon, y = value, group = country)) +
  geom_line(aes(color = country))

# 그래프 제목 지정하고 Y축 범위 지정하기
ggplot(top5_melt, aes(x = mon, y = value, group = country)) +
  geom_line(aes(color = country)) +
  ggtitle("2020년 국적별 입국 수 변화 추이") +
  scale_y_continuous(breaks = seq(0, 500000, 5000))

# 막대 그래프 그리기
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "dodge")

# 누적 막대 그래프 그리기
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "stack")

# 엑셀 파일 가져오기
library(readxl)

xlsdata <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/선별진료소_20211125194459.xls")
View(xlsdata)

# 데이터 칼럼 추출 및 열 이름 변경하기
data_raw <- xlsdata[,c(2:5)]
head(data_raw)

names(data_raw)
names(data_raw) <- c("state", "city", "name", "addr")
names(data_raw)

# state 칼럼 빈도 확인하기
table(data_raw$state)
barplot(table(data_raw$state))

# 대전시 선별진료소 추출하기
daejeon_data <- data_raw[data_raw$state == "대전",]
head(daejeon_data)

nrow(daejeon_data)

# 데이터 세트에서 선별진료소 위도와 경도 데이터 가져오기
library(ggmap)

ggmap_key <- "사용자 API 키 입력하기"
register_google(ggmap_key)

daejeon_data <- mutate_geocode(data = daejeon_data, location = addr,
                               source = 'google')

head(daejeon_data)
head(daejeon_data$lon)

# 대전시 지도 시각화하기
daejeon_map <- get_googlemap('대전', maptype = 'roadmap', zoom = 11)
ggmap(daejeon_map) +
  geom_point(data = daejeon_data,
             aes(x = lon, y = lat, color = factor(name)), size = 3)

# 마커로 위치 표시하고 위치 이름 넣기
daejeon_data_marker <- data.frame(daejeon_data$lon, daejeon_data$lat)
daejeon_map <- get_googlemap('대전', maptype = 'roadmap',
                             zoom = 11, markers = daejeon_data_marker)
ggmap(daejeon_map) +
  geom_text(data = daejeon_data, aes(x = lon, y = lat),
            size = 3, label = daejeon_data$name)

# 엑셀 파일 가져오기
library(readxl)
dustdata <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/dustdata.xlsx")

View(dustdata)
str(dustdata)

# 성북구와 중구 데이터만 추출하기
library(dplyr)
dustdata_anal <- dustdata[, c("날짜", "성북구", "중구")]
View(dustdata_anal)

is.na(dustdata_anal)
sum(is.na(dustdata_anal))

# 지역별 미세먼지 농도의 기술통계량 구하기
library(psych)

describe(dustdata_anal$성북구)
describe(dustdata_anal$중구)

# 성북구와 중구 미세먼지 농도 상자 그리기
boxplot(dustdata_anal$성북구, dustdata_anal$중구,
        main = "finedust_compare", xlab = "AREA", names = c("성북구","중구"),
        ylab = "FINEDUST_FM", col = c("blue", "green"))

# f 검정으로 지역별 미세먼지 농도의 분산 차이를 결정하기
var.test(dustdata_anal$중구, dustdata_anal$성북구)

# t 검정으로 지역별 미세먼지 농도의 평균 차이를 검정하기
t.test(dustdata_anal$중구, dustdata_anal$성북구, var.equal = T )

# 엑셀 파일 가져오기
library(readxl)
exdata1 <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/sample1.xlsx")
exdata1

# 경기, 서울, 제주 지역 Y20_CNT를 상자 그림으로 그리기
boxplot(formula = Y20_CNT ~ AREA, data = exdata1)

# 분산분석으로 세 집단 간 평균 차이 검정하기(1)
anova(lm(Y20_CNT ~ AREA, data = exdata1))

# 분산분석으로 세 집단 간 평균 차이 검정하기(2)
oneway.test(data = exdata1, Y20_CNT ~ AREA, var.equal = T)