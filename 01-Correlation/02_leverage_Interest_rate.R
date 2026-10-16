#=============================================================
# 1. Manage the data
#=============================================================

#Enter the data
leverage<-c(0.1,0.4,0.5,0.8,1.0,1.8,2.0,2.5,2.8,3.0)
interest_rate<-c(2.8,3.4,3.5,3.6,4.6,6.3,10.2,19.7,31.3,42.9)

#Combine the data into a data frame
data<-data.frame(leverage,interest_rate)

#Display the original data
print(data)
View(data)

#Save the dataset as a CSV file
write.csv(data,"leverage_interest.csv",row.names=FALSE)


#=============================================================
# 2. Original data
#=============================================================


#Calculate Pearson correlation for original data
r_original<-cor(leverage,interest_rate,method="pearson")

#Try this>Print result but with name on it: use cat("The value of x is =",x ). cat=concatenate
cat("Pearson correlation (original data) =",round(r_original, 4), "\n")

#Scatter plot of original data
plot(leverage,interest_rate,
     main="Pearson Corrrelation Plot: Leverage Ratio vs Interest Rate",
     xlab="Leverage Ratio (X)",
     ylab="Interest Rate (Y)",
     pch=19,
     col="steelblue")

legend("topleft",legend=paste("Pearson r = " ,round(r_original,4)),bty="n")


#=============================================================
# 3. Transform data
#=============================================================

#Apply natural logarithm transformation to Y
ln_interest_rate<-log(interest_rate)

#Add tansformed data to the data frame above: data$column_name<-value
data$ln_interest_rate<-ln_interest_rate

#Display transformed data
print(data)

#Calculate Pearson correlation after transformation
r_transformed<-cor(leverage,ln_interest_rate,method="pearson")

cat("Pearson correlation (after log transformation) = ",round(r_transformed,4),"\n")

#Scatter plot after log transformation
plot(leverage,ln_interest_rate,
     main="Pearson Correlation After Log Transformation",
     xlab="Leverage Ration (X)",
     ylab="ln(Interest Rate)",
     pch=19,
     col="maroon")

legend("topleft",legend=paste("Pearson r = "),round(r_transformed,4),bty="n")


#Compare the correlation coefficient in a table
comparison <- data.frame(
  Method = c("Original Data", "After Log Transformation"),
  Pearson_Correlation = c(
    round(r_original, 4),
    round(r_transformed, 4)
  )
)

print(comparison)

#Display both scatter plots side by side
par(mfrow = c(1, 2))

plot(leverage, interest_rate,
     main = "Original Data",
     xlab = "Leverage Ratio (X)",
     ylab = "Interest Rate (Y)",
     pch = 19,
     col = "orange")

legend("topleft",
       legend = paste("r =", round(r_original, 4)),
       bty = "n")

plot(leverage, ln_interest_rate,
     main = "After Log Transformation",
     xlab = "Leverage Ratio (X)",
     ylab = "ln(Interest Rate)",
     pch = 19,
     col = "purple")

legend("topleft",
       legend = paste("r =", round(r_transformed, 4)),
       bty = "n")

# Reset plotting layout
par(mfrow = c(1, 1))
