
mechaTable <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
View(mechaTable)
library(tidyverse)
library(dplyr)
str(mechaTable)
head(mechaTable)
library(ggplot2)
cor(mechaTable)

# rename columns for easier reading
mechaTable <- mechaTable %>% rename(vl = 'vehicle length', vw='vehicle weight', sa= 'spoiler angle',
                      gc='ground clearance')
head(mechaTable)

# Generate multiple regression model 
lm <- lm(mpg ~ vl + vw + sa + gc + AWD,data=mechaTable) 
lm
summary(lm)

# Check Multiple Regression Assumptions!
install.packages('car')
# 1. Independence of errors (logical argument)
# 2. Normally distributed errors. - Examine a QQ plot
library(car)
qqPlot(lm)
# We can assum normality as the points fall under the refernce line

# 3. Linearity (0 conditional mean). - Examine resid plot
residualPlot(lm) # residuals must be close to 0
plot(lm)
# 4. Homoskedasticity (constant conditional variance).  
plot(lm, 3)
lm


# Susension Coil test 
suspCoil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
head(suspCoil)

# 1. Print a summary statistics table for suspension coil's pounds-per-inc continuous variables
summary(suspCoil$PSI)
plt <- ggplot(suspCoil, aes(x=PSI))
plt+geom_density()