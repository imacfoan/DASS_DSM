#a
college <- read.csv("https://www.statlearning.com/s/College.csv")
#b
rownames(college) <- college[, 1]
college <- college[, -1]

head(college)

#c
#i)
summary(college)

#ii)
pairs(college[,3:12])

# because the first two columns are not numerical vectors
#Please carefully check the data when you have similar errors

#iii) plot side by side boxplots of Outstate versus Private (Private universities have more out of state students):

class(college$Private)
#Character vectors cannot be used in most statistical functions in R, since they don't define groups.
college$Private <- ifelse(college$Private=="Yes", 1, 0)
#we need to convert the Character vector 'private' to numerical vector.
plot(college$Private, college$Outstate)

#iv)
Elite <- rep("No", nrow(college))
Elite[college$Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
college <- data.frame(college, Elite)

summary(Elite)

# plot side by side boxplots of Outstate versus Elite (Elite universities have more out of state students):
plot(college$Elite, college$Outstate)

#v)

par(mfrow=c(2,2))
hist(college$Apps)
hist(college$perc.alumni, col=2)
hist(college$S.F.Ratio, col=3, breaks=10)
hist(college$Expend, breaks=100)

#vi)
#for example

college[which.max(college$Top10perc), ]  # what is the university with the most students in the top 10% of class


acceptance_rate <- college$Accept/college$Apps

college[which.min(acceptance_rate), ]  # what university has the smallest acceptance rate

college[which.max(acceptance_rate), ]  # what university has the most liberal acceptance rate