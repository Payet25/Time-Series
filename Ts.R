#1
y <- ts(scan("wensum.dat")) plot(y, type="b")

#2
ym = matrix(y, ncol=12,byrow=TRUE)
col.means=apply(ym,2,mean)
plot(col.means,type="b",xlab="Month", ylab="Mean",
     main="Monthly Means Plot for Flow")
#3 and 4
diff12 = diff(y, 12)
diff1and12 = diff(diff12,1)
plot(diff1and12, type="b")
#5
acf2(diff1and12, 48)
#6 
sarima(y,0,1,1,0,1,1,12,details=F)
sarima(y,1,1,0,0,1,1,12,details=F)
sarima(y,1,1,1,0,1,1,12,details=F)
sarima(y,1,1,1,0,1,2,12,details=F)

#8
sarima.for(y, 24, 1,1,1,0,1,2,12)