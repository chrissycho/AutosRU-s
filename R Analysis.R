x <- 3
numlist <-c(0,1,2,3,4,5,6,7,8,9)

demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

install.packages("tidyverse")
install.packages("jsonlite")
library(jsonlite)
?fromJSON()
demo_table2 <- fromJSON(txt='demo.json')
x <- c(3, 3, 2, 2, 5, 5, 8, 8, 9)
x[3]
demo_table[3, "Year"]
demo_table[3,3]
filter_table <- demo_table2[demo_table2$price > 10000,]
filter_table
?subset()

#filter by price and drivetrain
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) 
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)
?sample()
demo_table[sample(1:nrow(demo_table),3),]
library(tidyverse)
?mutate()
#add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 
#create summary table
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer))
#create summary table with multiple columns
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n())
?gather()
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)
#Reshape to a long data
long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)
wide_table <- long_table %>% spread(key="Metric",value="Score")
all.equal(demo_table3, wide_table)
table <- wide_table[,order(colnames(wide_table))]
table2 <- demo_table3[,order(colnames(demo_table3))]
?ggplot()
head(mpg)

#BAR GRAPH 
#Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=class))
#Plot a bar plot
plt + geom_bar()
#create summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n()) 
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) 
plt + geom_col() #plot a bar plot
#plot bar plot with labels
plot2 <- plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") 
#rotate x-axis labels 45 degrees
plot2 + theme(axis.text.x=element_text(angle=45,hjust=1)) 

#LINE GRAPH 
#create summary table
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy)) 
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) 
# Generate line plot
plt+geom_line()
#add line plot with labels
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) 

#SCATTER PLOT
#create a ggplot object
plt <- ggplot(mpg,aes(x=displ,y=cty))
#add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") 

#SCATTER PLOT GROUPED BY ADDITIONAL VARIABLES
#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class))
#add scatter plot with labels
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class") 
#more aesthetics
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive")
mpg_org <-mpg

#scatter plot with size
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv, size=cty))
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive", size="Size")

#BOX PLOT
plt <- ggplot(mpg,aes(y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() #add boxplot
#Multiple boxplots
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot and rotate x-axis labels 45 degrees
#aesthetics to boxplot
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy, colour=manufacturer))
plt + geom_boxplot(outlier.colour="red", outlier.shape=1) + theme(axis.text.x=element_text(angle=45,hjust=1)) 
?mpg

#Heatmap
#create summary table
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy))
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
#create heatmap with labels
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle 
                           Year",fill="Mean Highway (MPG)") 
#Another example of heatmap for model, year
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy)) #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)")+theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #add heatmap with labels #rotate x-axis labels 90 degree

# Adding Layers to plots
# 1) adding additional information on the same data
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
#add boxplot
plt + geom_boxplot() + 
  theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
  geom_point() #overlay scatter plot on top
# 2) Adding different information but complementary
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ)) #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot
# Provide Statistics on the above data
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ))
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
  geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

# Long-format "Faceting"
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees
# Faceting by each MPG type compare all the ratings in city and all in highway
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
 theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

