#Q(a)-(d)

#a
library(MASS)
?Boston
dim(Boston)

#b
pairs(Boston)

#c
plot(Boston$age, Boston$crim)
# Older homes, more crime
plot(Boston$dis, Boston$crim)
# Closer to work-area, more crime
plot(Boston$rad, Boston$crim)
# Higher index of accessibility to radial highways, more crime
plot(Boston$tax, Boston$crim)
# Higher tax rate, more crime
plot(Boston$ptratio, Boston$crim)

#d
par(mfrow=c(1,3))
hist(Boston$crim[Boston$crim>1], breaks=25)
# most cities have low crime rates, but there is a long tail: 18 suburbs appear
# to have a crime rate > 20, reaching to above 80
hist(Boston$tax, breaks=25)
# there is a large divide between suburbs with low tax rates and a peak at 660-680
hist(Boston$ptratio, breaks=25)
# a skew towards high ratios, but no particularly high ratios


#Q(e)-(h)
# (e)
dim(subset(Boston, chas == 1))

# (f)
median(Boston$ptratio)

# (g)
t(subset(Boston, medv == min(Boston$medv)))
summary(Boston)
# Not the best place to live, but certainly not the worst.

# (h)
dim(subset(Boston, rm > 7))
dim(subset(Boston, rm > 8))
summary(subset(Boston, rm > 8))
summary(Boston)
# relatively lower crime (comparing range), lower lstat (comparing range)
subset(Boston, rm > 8)
