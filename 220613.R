# R code 입력 후 실행
print("Hello World!") # "Hello World!" 출력
print("Hello BigData!")

help()
help(print)

x <- 10
print (x1)
x1 <- c(10, 20, 30)
print (x1)
x2 <- c(10:15)
print (x2)
x3 <- seq(10,15)
x4 <- seq(1,10,by=4)
print(x4)
y <- "HI"
print(y)
y1 <- c("Hello" , "Hi" , "Hello~~!")
print(y1)

#-------------------------------------------------------------------
ex_vector1 <- c(-1, 0, 1) #데이터 -1, 0, 1을 ex_vector1에 할당
#숫자형 벡터 (실수형 벡터) ==> 연산도 가능 
print(ex_vector1)
str(ex_vector1) #변수의 속성을 확인한다. str()
length(ex_vector1) #벡터 ex_vector1의 길이

ex_vector2 <-c("Hello", "Hi~!") #문자 데이터 Hello, Hi~!를 ex_vector2에 할당
print(ex_vector2)
ex_vector3 <- c("1", "2", "3")
print(ex_vector3)
#문자 데이터를 따옴표 ("" 또는 '') 로 감싸서 표현
str(ex_vector2)

#논리형 벡터 logical vector 값이 TRUE FALSE
ex_vector4 <- c(TRUE, FALSE, TRUE, FALSE)
print(ex_vector4)
str(ex_vector4) # 데이터 타입, 길이, 값 다 알려준다.
typeof(ex_vector4) #타입만 정확하게 알려주는 함수 

remove(ex_vector1) #rm(ex_vector1)도 가능
print(ex_vector1)

x<-c(1,2,3,4,5,6) #벡터 x 생성
matrix(x , nrow = 2 , ncol = 3) #벡터를 통해 행렬 생성
matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2, byrow = T) #행이 3개, 열이 2개로 데이터 순서가 왼쪽에서 오른쪽으로 변경됨

y <- c(1,2,3,4,5,6)
array(y, dim=c(2,2,3)) #변수 y를 2+2 행렬, 3차원 배열 

list1 <- list(c(1,2,3), "Hello")
print(list1)
str(list1)
list2 <- c("5", 5)
str(list2) #문자열이 하나라도 포함되어 있으면 나머지도 문자로 인식됨

#데이터 프레임 구성을 위한 벡터 변수 생성
ID <-c(1:10)
SEX <-c("F", "M", "F", "M", "M", "F", "F", "F", "F","M")
AGE <-c(50, 40, 30, 20, 10, 60, 50, 20, 30, 39)
AREA<-c("서울", "경기", "제주", "서울", "경북", "전남", "서울", "제주", "경남", "경기")

#데이터 프레임
dataframe_ex <- data.frame(ID, SEX, AGE, AREA) #
print(dataframe_ex)
str(dataframe_ex)


#4,5문제
ID<-c("1","2","3","4","5")
MID_EXAM<-c(10,25,100,75,30)
CLASS<-c("1반","2반","3반","1반", "2반")

examples_test<- data.frame(ID, MID_EXAM, CLASS)
print(examples_test)

ID <- c(1,2,3,4,5)
View(example_test)

install.packages("readxl") # readxl 패키지 설치
library(readxl) #readxl 패키지 로드

excel_data_ex <- read_excel("data_ex.xls")
View(excel_data_ex)

ex_data <- read.table("data_ex.txt")
View(ex_data)

ex_data <- read.table("data_ex1.txt")
View(ex_data)

ex_data <- read.table("data_ex1.txt", header=TRUE, sep=",", fileEncoding = "utf-8")
View(ex_data)

varname <- c("ID","SEX", "AGE","AREA")
ex2_data <- read.table("data_ex2.txt", sep=",",col.names = varname, fileEncoding = "utf-8")
View(ex2_data)
#텍스트 파일에 header 정보 미포함시 우리가 임의로 header 이름을 정해서 넣는 옵션 : col.names


ID <- c(1,2,3,4,5)
SEX <- c("F", "M","F", "M", "M")

data_ex <- data.frame(ID =ID, SEX =SEX)
View(data_ex)
#rda 확장자는 r전용 확장자자
save(data_ex, file="data_ex.rda")
load("data_ex.rda")
View(data_ex)

#자주 사용하는 데이터 형식 csv .. 
write.csv(data_ex, file="data_ex_ex.csv")
#csv : comma seperated values
write.table(data_ex, file="data_ex_ex.txt")

1+2
5-3
3*7
20/4
-1+3

20%/%7 # 20을 7로 나눈 몫몫
20%%7 #20을 7로 나눈 나머지지
6^2 #6의 제곱 
6**2 #6의 제곱
2^10 #2의 10제곱
2**10 #2의 10제곱

5 > 3
5 >= 6
5 < 3
5 <= 6
5 == 5
5 != 5