# CH5-1 dplyr 패키지
# dplyr 패키지 설치 및 로드하기
install.packages("dplyr")
library(dplyr)

# mtcars 데이터 세트 구조 확인하기
nrow(mtcars)
str(mtcars)

# 조건에 맞는 데이터 추출하기
filter(mtcars, cyl == 4)

# 두 가지 조건에 맞는 데이터를 필터링하기
filter(mtcars, cyl >= 6 & mpg > 20)

# 지정한 변수만 추출하기
head(select(mtcars, am, gear))

# 오름차순 정렬하기
head(arrange(mtcars,wt))

# 오름차순 정렬한 후 내림차순 정렬하기
head(arrange(mtcars, mpg, desc(wt)))

# 새로운 열 추가하기
head(mutate(mtcars, years = "1974"))
head(mutate(mtcars, mpg_rank = rank(mpg)))

# 중복 값 제거하기
distinct(mtcars, cyl)
distinct(mtcars, gear)

# 여러 개 열에서 중복 값 제거하기
distinct(mtcars, cyl, gear)

# 데이터 요약하기
summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))
summarise(mtcars, mean(cyl), min(cyl), max(cyl))

# 그룹별로 요약하기
gr_cyl <- group_by(mtcars,cyl)
summarise(gr_cyl, n())

gr_cyl <- group_by(mtcars,cyl)
summarise(gr_cyl, n_distinct(gear))

# 샘플 데이터 10개 추출하기
sample_n(mtcars, 10)

# 전체 데이터의 20%를 샘플로 추출하기
sample_frac(mtcars, 0.2)

# 파이프 연산자로 그룹별 요약하기
group_by(mtcars, cyl) %>% summarise(n())

# 파이프 연산자 없이 순위 기준으로 정렬하기
mp_rank <- mutate(mtcars, mpg_rank = rank(mpg))
arrange(mp_rank, mpg_rank)

# 파이프 연산자를 사용하여 순위 기준으로 정렬하기
mutate(mtcars, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)

# CH5-2 데이터 가공하기
# 필요한 데이터 추출하기
library(dplyr)
library(readxl)
exdata1 <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/Sample1.xlsx")
exdata1

# 선택한 변수 추출하기
exdata1 %>% select(ID)

# 선택한 변수 여러 개 추출하기
exdata1 %>% select(ID, AREA, Y21_CNT)

# 선택한 변수 제외하고 추출하기
exdata1 %>% select(-AREA)
exdata1 %>% select(-AREA, -Y21_CNT)

# 조건에 만족하는 데이터만 추출하기
exdata1 %>% filter(AREA == '서울')
exdata1 %>% filter(AREA == '서울' & Y21_CNT >= 10)

# 오름차순 정렬하기
exdata1 %>% arrange(AGE)

# 내림차순 정렬하기
exdata1 %>% arrange(desc(Y21_CNT))

# 중첩 정렬하기
exdata1 %>% arrange(AGE, desc(Y21_AMT))

# 변수 값 합산하기
exdata1 %>% summarise(TOT_Y21_AMT = sum(Y21_AMT))

# 변수 값을 그룹별로 합산하기
exdata1 %>% group_by(AREA) %>% summarise(SUM_Y21_AMT = sum(Y21_AMT))

# 엑셀 파일 불러오기
install.packages("readxl")
library(readxl)
m_history <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/Sample2_m_history.xlsx")
f_history <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/Sample3_f_history.xlsx")
View(m_history)
View(f_history)

# 테이블을 세로로 결합하기
exdata_bindjoin <- bind_rows(m_history, f_history)
View(exdata_bindjoin)

# 엑셀 파일 불러오기
library(readxl)
jeju_y21_history <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/Sample4_y21_history.xlsx")
jeju_y20_history <- read_excel("C:/Users/JAMJAM/Desktop/R_Studio_Practice/Sample5_y20_history.xlsx")
View(jeju_y20_history)
View(jeju_y21_history)

# 첫 번째 테이플 기준으로 가로 결합하기
bind_col <- left_join(jeju_y21_history, jeju_y20_history, by = "ID")
View(bind_col)

# 키 변수가 동일할 때만 가로 결합하기
bind_col_inner <- inner_join(jeju_y21_history, jeju_y20_history, by = "ID")
View (bind_col_inner)

# 키 변수를 기준으로 모두 가로 결합하기
bind_col_full <- full_join(jeju_y21_history, jeju_y20_history, by = "ID")
View(bind_col_full)