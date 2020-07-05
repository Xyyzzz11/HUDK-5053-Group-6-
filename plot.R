D<-read.csv("HUDK5053 Team 6 Survey.csv")
#remove columns that I don't need
D1<-D[,c(3,21:45)]
D2<-D1[,-c(3:7,9,10,12,13,15,16,18,20,22:26)]
write.csv(D2,"/Users/mazixuan/Desktop/HUDK 5053 Dashboard/survey.csv")
# re-scored the answers and then upload
D3<-read.csv("survey_scored.csv")
head(D3)
#add up respectively the score for the questions() with words on the slides, 
#and score for the questions without words on the slides
D3$ww_sum<-D3$ww1+D3$ww2+D3$ww3
D3$w0_sum<-D3$w.o1+D3$w.o2.1+D3$w.o.2.2+D3$w.o3
write.csv(D3,"/Users/mazixuan/Desktop/HUDK 5053 Dashboard/rescored_survey.csv")

D4<-read.csv("result.csv")
#run boxplot
boxplot(Sum_of_score ~ Is.there.words.on.the.slides,data = D4)

#run t-test
#Ho:the difference between the two groups is 0
#Ha:the difference between the two groups is not 0
#assume equal variances
t.test(Sum_of_score ~ Is.there.words.on.the.slides, mu=0, alt="two.sided", conf=0.95, paired=F,data=D4) 
#

