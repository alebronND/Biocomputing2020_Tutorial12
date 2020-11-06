# Exercise 10 - Analysis and plotting
# set location of file (working directory)
setwd("/Users/alebron/Biocomputing2020_Tutorial12")
# loads text file onto data
data=read.delim(file="slr02.txt", header=TRUE, sep="\t")
# changes name of columns; data is on the number of chirps according to the temperature (https://mathbits.com/MathBits/TISection/Statistics2/linearREAL.htm)
colnames(data)=c("chirps", "temperature")
# loads library
library(ggplot2)
# creates ggplot
ggplot(data=data, aes(x=temperature, y=chirps))+
  geom_point(size=2, shape=23)+
  # adds trendline
  geom_smooth(method=lm)

# Second part
# loads data from data.txt 
data2=read.delim(file="data.txt", header=TRUE, sep=",")
# loads libraries
library(ggplot2)
# creates ggplot with means 
mean_plot=ggplot(data=data2, aes(x=region, y=observations, fill=region))+
  stat_summary(fun.y="mean", geom="bar")+
  ggtitle("Mean per Region")
# creates ggplot with all observations
observation_plot=ggplot(data=data2, aes(x=region, y=observations, color=region))+
  geom_jitter(size=0.1)+
  ggtitle("Observations per Region")
# creates empty plot (placeholder) for next step
blankPlot= ggplot()+
  geom_blank(aes(1,1))+
  theme(plot.background = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(), 
        axis.text.y = element_blank(),
        axis.ticks = element_blank()
  )
# installs package and loads library
install.packages("gridExtra")
library("gridExtra")

# puts all plots in one place
grid.arrange(mean_plot, blankPlot, observation_plot, 
             ncol=2, nrow=2, widths=c(1.4, 1.4), heights=c(4, 4))


# Yes, they show different stories. One plot tells you the overall mean of each region, which doesn't say anything about the minimum/maximumm value and the distribution of the values. 
# The scatter plot, on the other hand, tells you how the values are distributed and it gives you a better idea of all of the values, and not just the mean. 
