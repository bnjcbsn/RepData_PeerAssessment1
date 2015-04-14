## load and preprocess

rough<-read.csv("activity.csv")
library("dplyr")
daystep<-summarize(group_by(rough, date), s=sum(steps), m=mean(steps), j=median(steps))



## What is mean total number of steps taken per day?
hist(daystep$s)



## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?

