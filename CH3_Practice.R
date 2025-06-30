base::rm(list = ls())

# 숫자와 문자 변수 생성하기
x <- 10
x
y <- "HI"
y

# Hello World 문자 출력하기
print("Hello World")

# 1부터 100까지 더한 값 출력하기
a <- sum(1:100)
a

# 오늘 날짜 출력하기
Sys.Date()

rm(list = ls())


# 숫자 3개 곱하기
multi_three_return <- function(x,y,z) {
  res <- x*y*z
  return(res)
}
multi_three_return(3,5,6)

# return() 함수 사용하는 이유
multi_three_return <- function(x,y,z){
  res <- x*y*z
  return(res)
}

# 함수 호출
multi_three_return(3,5,6)

# 변수에 저장한 후 출력
a <- multi_three_return(3,5,6)
a

# cat()을 사용하여 사용자 정의 함수 생성
multi_three_cat <- function(x,y,z) {
  res <- x*y*z
  cat(res)
}

# 함수 호출
multi_three_cat(3,5,6)

# 변수에 저장한 후 출력
b <- multi_three_cat(3,5,6)
b

# reshape2 패키지 설치하기
install.packages("reshape2")
install.packages("reshape2")

# 설치한 패키지 로드하기
library(reshape2)

# 설치한 패키지 삭제하기
remove.packages("reshape2")

# 변수에 값을 할당하기
A <- 2
A
B = 10
B

C = D <- 5
C
D

G <- E = 10

sum(x<-1)
x
sum(y = 1)
y

# 논리 연산자로 진릿값 확인하기
x <- 1:3
y <- 3:1 
(x > 0) & (y > 1)
(x > 0) : (y > 1)

# 조건문으로 짝수 홀수 구분하기
a <- 10
if(a%% 2 == 0) {
  print("짝수입니다")
} else {
  print("홀수입니다")
}

# 조건문으로 학점 구분하기
b <- 80
if (b>= 90) {
  print("A 학점입니다")
} else if ( b>=80) {
  print("B 학점입니다")
} else {
  print ("c 학점입니다")
}

# for 함수로 구구단 2단 출력하기
for (i in 1:9) {
  a <- 2*i
  print(a)
}

# for 함수로 구구단 2단에서 9단까지 출력하기
for (i in 2:9) {
  for (j in 1: 9) {
    print(paste(i, "*", j, "=", i*j))
  }
}

# apply() 함수로 행렬 값 계산하기
x <- matrix(1:4, 2, 2)
x

apply(x,1,sum)
apply(x,2,min)
apply(x,1,max)

# iris 데이터 세트 구조 확인하기
str(iris)
View(iris)

# apply() 함수로 iris 데이터 세트 값 처리하기
apply(iris[, 1:4], 2, sum)
apply(iris[, 1:4], 2, mean)
apply(iris[, 1:4], 2, min)
apply(iris[, 1:4], 2, max)
apply(iris[, 1:4], 2, median)

lapply(iris[, 1:4], sum)
sapply(iris[, 1:4], mean)