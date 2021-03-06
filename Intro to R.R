# ---
# title: "01 - Intro to R"
# author: "Stephen Blatti"
# date: "October 7, 2017"
# output: pdf_document
# ---
# 
# ```{r setup, include=FALSE}
# knitr::opts_chunk$set(echo = TRUE)
# ```
# 
# 1. Calculate the following numerical results to three decimal places:
# a) (7 - 8) + 5^3 - 5 / 6 + sqrt(62)
# b) ln 3 + sqrt(2)sin(pi) - e^3
# ```{r}
# #a
round( (7 - 8) + 5^3 - 5 / 6 + sqrt(62),3 )
#b
round( log(3) + sqrt(2)*sin(pi) - exp(3),3 )
#```

# 3. Create a vector named Treatment with the entries "Treatment One" appearing 20 times, "Treatment Two" appearing 18 times, and "Treatment Three" appearing 22 times.
# 
#```{r}
Treatment <- rep(c("Treatment One", "Treatment Two", "Treatment Three"), c(20, 18, 22))
xtabs(~Treatment)
# ```
# 
# 5. Vectors, sequences, and logical operators
# ```{r}
# #b Create the vectors u = (1,2,5,4) and v = (2,2,1,1) using the c() and scan() fctns.
u = c(1,2,5,4)
v = c(2,2,1,1)
# #c find which component of u is equal to 5
which(u == 5)
# #i calculate the scalar product (dot product) of q = (3,0,1,6) and r = (1,0,2,4)
q = c(3,0,1,6) 
r = c(1,0,2,4)
q %*% r
# 
# #j Define the matrix X whose rows are the vectors u and v
X = matrix(rbind(u,v),2,4)
# #or X = rbind(u,v)
# 
# #k Define the matrix Y whose columns are the vectors u and v
Y = cbind(u,v)
# 
# #l Find the matrix product  X by Y and name is W
(W = X %*% Y)
# 
# #m Compute the inverse matrix of W and the transpose of that inverse
solve(W)
t( solve(W))
# ```
# 
# 7. The data frame wheatUSA2004 from the PASWR package has the USA wheat harvested crop surfaces in 2004 by states. It has 2 variables, STATE for state and ACRES for 1000s of acres.
# a) Attach the data frame wheatUSA2004 and use the fctn row.names() to define the states as the row names.
# ```{r}
library(PASWR2)
STATES = WHEATUSA2004$states
row.names(WHEATUSA2004) = STATES
head(WHEATUSA2004)
# ```
# b) Define a new var called ha for the surface area given in hectors where 1 acre = 0.40468564224 hectares.
# ```{r}
WHEATUSA2004$ha <- WHEATUSA2004$acres * 0.40468564224
head(WHEATUSA2004)
# ```
# c) Sort the file according to the harvested surface area in acres.
# ```{r}
sort_wheatUSA2004 <- WHEATUSA2004[order(WHEATUSA2004$acres), ]
head(sort_wheatUSA2004)
# ```
# 
# d) Which states fall in the top 10% of states for harvested surface area?
# ```{r}
top10 <- quantile(WHEATUSA2004$acres, prob = 0.9)
result <- WHEATUSA2004[WHEATUSA2004$acres > top10, ]
row.names(result)
# ```
# e) Save the contents of wheatUSA2004 in a new file called wheatUSA.txt. Then, remove wheatUSA2004 from your workspace and check that the contents of wheatUSA2004 can be recovered from wheatUSA.txt.
# ```{r}
dump("WHEATUSA2004", "WHEATUSA.txt")
rm(WHEATUSA2004)
source("WHEATUSA.txt")
head(WHEATUSA2004)
# ```
# f) Use the command write.table() to store the contents of wheatUSA2004 in a file with the namw wheatUSA.dat  
# ```{r}
write.table(WHEATUSA2004, "WHEATUSA.dat")
# ```
# g) Find the total harvested surface area in acres for the bottom 10% of states.
# ```{r}
bottom10 <- quantile(WHEATUSA2004$acres, prob = 0.1)
result <- WHEATUSA2004[WHEATUSA2004$acres < bottom10, ]
result
total_HA <- sum(result[, "acres"])
total_HA 
# ```
# 
# 
# 9. Use the data frame EPIURALf to answer the following questions:
# 
# a) How many patients have been treated with the Hamstring Stretch?
# ```{r}
head(EPIDURALF)
xtabs(~treatment, data = EPIDURALF)
xtabs(~treatment, data = EPIDURALF)[1]
# ```
# b) What proportion of the patients treated with Hamsrting Stretch were classified as each of easy, difficult, and impossible?
# ```{r}
Treatment1 <- xtabs(~treatment + ease, data = EPIDURALF)
Treatment1
prop.table(Treatment1[1, ]) * 100
# ```
# c) What proportion of the patients classified as easy to palpitate were assigned to the Traditional Sitting position?
# ```{r}
Treatment1
prop.table(Treatment1[, "Easy"])[2] * 100
# ```
# d) What is the mean weight for each cell in a contingency table created with the var's Ease and Treatment?
# ```{r}
head(EPIDURALF)
tapply(EPIDURALF$kg, list(EPIDURALF$ease, EPIDURALF$treatment), mean)
# ```
# e) What proportion of the patients have a body mass index (BMI = kg/(cm/100)^2) less than 25 and are classified as Easy to palpitate?
# ```{r}
EPIDURALF$BMI <- EPIDURALF$kg/(EPIDURALF$cm/100)^2
EPIDURALF[1:5, 3:8]
mean(EPIDURALF$ease =="Easy" & EPIDURALF$BMI < 25) * 100
# ```
# 11. Use a for loop to convert a sequence of temperatures (18 to 28 by 2) from degrees centigrade to degrees fahrenheit.
# ```{r}
for (celsius in seq(from = 18, to = 28, by = 2)) { 
 print(c(celsius, 9/5 * celsius + 32))
 }
# ```





















