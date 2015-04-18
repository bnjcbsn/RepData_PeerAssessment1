## load and preprocess

rough<-read.csv("activity.csv")
library("dplyr")
daystep<-summarize(group_by(rough, date), s=sum(steps), m=mean(steps), j=median(steps))



## What is mean total number of steps taken per day?
hist(daystep$s)

stepmean<-mean(daystep$s, na.rm = TRUE)
sprintf(stepmean, fmt='%#.2f')
stepmedian<-median(daystep$s, na.rm = TRUE)
stepmedian


## What is the average daily activity pattern?
intstep<-summarize(group_by(rough, interval), ave=mean(steps, na.rm = TRUE))
plot(intstep, type='l')


## Imputing missing values
totnas<-sum(is.na(rough$steps))
library("plyr")
impute.mean <- function(x) replace(x, is.na(x), mean(x, na.rm = TRUE))
impsteps<-ddply(rough, ~ interval, transform, steps = impute.mean(steps))
impsteps<-impsteps[order(impsteps$date), ]
detach("package:plyr", unload=TRUE)
smostep<-summarize(group_by(impsteps, interval), ave=mean(steps))
plot(smostep, type='l')


## Are there differences in activity patterns between weekdays and weekends?

