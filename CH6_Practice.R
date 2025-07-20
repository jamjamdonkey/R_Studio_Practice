# ggplot2 패키지 설치 및 로드하기
install.packages("ggplot2")
library(ggplot2)

# 그래프 기본 틀 생성하기
str(airquality)
ggplot(airquality, aes (x = Day, y = Temp))

# 산점도 그리기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point()

# 산점도 점 크기와 색상 변경하기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point(size = 3, color = "red")

# 선 그래프 그리기
ggplot(airquality, aes(x = Day, y = Temp)) + 
  geom_line()

# 막대 그래프 그리기
ggplot(mtcars, aes(x = cyl)) + geom_bar(width = 0.5)

# 누적 막대 그래프 그리기
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear)))

# 선버스트 차트 그리기
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar()

# 도넛 모양의 선버스트 차트 그리기
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar(theta = "y")

# 상자 그림 그리기
ggplot(airquality, aes(x = Day, y = Temp, group = Day)) +
  geom_boxplot()

# 히스토그램 그리기
ggplot(airquality, aes(Temp)) +
  geom_histogram()

# 선 그래프와 산점도 함께 그리기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_line() +
  geom_point()

# 선 그래프 컬러와 산점도 점 크기 변경하기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_line(color = "red") +
  geom_point(size = 3)

# ggplot2 패키지 로드 및 economics 데이터 세트 구조 확인하기
library(ggplot2)
str(economics)

# 그래프에 사선 그리기
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_abline(intercept = 12.18671, slope = -0.0005444)

# 그래프에 평행선 그리기
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))

# 그래프에 수직선 그리기
library(dplyr)

x_inter <- filter(economics, psavert == 
                    min(economics$psavert))$date

ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_vline(xintercept = x_inter)

# 그래프에 텍스트 입력하기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point() +
  geom_text(aes(label = Temp, vjust = 0, hjust = 0))

# 그래프에 사각형 그리기
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21,
           alpha = 0.5, fill = "skyblue")

# 그래프에 화살표 그리기
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21,
           alpha = 0.5, fill = "skyblue") +
  annotate("segment", x = 2.5, xend = 3.7, y =10, yend = 17,
           color = "red", arrow = arrow())

# 그래프에 도형과 텍스트를 함께 표시하기
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21,
           alpha = 0.5, fill = "skyblue") +
  annotate("segment", x = 2.5, xend = 3.7, y =10, yend = 17,
           color = "red", arrow = arrow()) +
  annotate("text", x =2.5, y = 10, label = "point")

# 그래프와 축 제목 추가하기
ggplot(mtcars, aes(x = gear)) + geom_bar() +
  labs(x = "기어수", y = "자동차수", title = "변속기 기어별 자동차 수")

# 엑셀 파일 가져오기
library(readxl)
exdata1 <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/Sample1.xlsx")
exdata1

# 상관분석하여 두 변수 간의 상관관계 확인하기
cor.test(exdata1$Y20_CNT, exdata1$Y21_CNT)

# 회귀분석하여 절편과 기울기 구하기
reg_result <- lm(Y21_CNT ~ Y20_CNT, data = exdata1)
reg_result

# ggmap 패키지 설치 및 로드하기
install.packages("ggmap")
library(ggmap)

# 구글 지도에서 부산시 지도 가져오기_카드 등록하기 귀찮아서 Stadiamap으로 함
library(ggmap)

register_stadiamaps(key = "1dec3ae2-60f1-4ae1-a414-f4c2d6015f21")  # Stadia Maps 활성화


busan_map <- get_stadiamap(
  bbox = c(left = 128.80, bottom = 35, right = 129.25, top = 35.3),
  zoom = 13,
  maptype = "stamen_terrain"
)

ggmap(busan_map)


# 서울 시청 위치에 빨간색 점 찍기
ggmap(seoul_map) +
  geom_point(aes(x = 126.978, y = 37.5665), color = "red", size = 4)  # 시청 위치

# 서울시 주요 구 위에 라벨 붙이기
library(ggplot2)
coord <- data.frame(
  name = c("강남구", "노원구", "영등포구"),
  lon = c(127.0474, 127.061, 126.9104),
  lat = c(37.5172, 37.6543, 37.5172)
)

ggmap(seoul_map) +
  geom_point(data = coord, aes(x = lon, y = lat), color = "green", size = 3) +
  geom_text(data = coord, aes(x = lon, y = lat, label = name), vjust = -1)



