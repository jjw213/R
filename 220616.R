library(readxl)
library(dplyr)
library(reshape2)
#
exam_Data <- read_excel("middle_mid_exam.xlsx")
melt_test2<-melt(mid,id.vars = c("ID","CLASS"),
                 measure.vars = "MATHEMATICS")
melt_test1<-melt(mid,id.vars = c("ID","CLASS"),
                 measure.vars = "ENGLISH")
aq_dcast<-dcast(melt_test2,ID~ CLASS)
aq_dcast2<-dcast(melt_test1,ID~ CLASS)
View(aq_dcast)

MATH_AVG<-mean(aq_dcast$class1)
aq_dcast %>% summarize(class1=mean(aq_dcast$class1))
ENG_AVG<-mean(aq_dcast2$class1)
aq_dcast2 %>% summarize(ENG_AVG=mean(aq_dcast2$class1))
#
MATH_SCORE = select(exam_Data,ID,CLASS,MATHEMATICS)
MATH<-dcast(MATH_SCORE,ID~CLASS)
MATH<-dcast(MATH_SCORE,ID~CLASS, value.var = "MATHEMATICS")
MATH
ENG_SCORE = select(exam_Data,ID,CLASS,ENGLISH)
ENG<-dcast(ENG_SCORE,ID~CLASS, value.var = "ENGLISH")

#3 
summarise(MATH,mean(class1),mean(class2),mean(class3))
summarise(MATH,sum(class1),sum(class2),sum(class3))
summarise(ENG,mean(class1),mean(class2),mean(class3))
summarise(ENG,sum(class1),sum(class2),sum(class3))
exam_Data %>% group_by(CLASS) %>% summarise(수학평균 = mean(MATHEMATICS))
exam_Data %>% group_by(CLASS) %>% summarise(수학총점 = sum(MATHEMATICS))

#4
count(filter(MATH,class1>=80))
filter(MATH,class1>=80) %>% summarise(n())

#5
arrange(exam_Data,desc(MATHEMATICS), ENGLISH)

#6
exam_Data %>% filter(MATHEMATICS >= 80 & ENGLISH >=85) %>% summarise(n())
