# ==============================================================
# 1. Manage the data
# ==============================================================

# Enter the data: c()
claim<-c(2.1,2.4,2.5,3.2,3.6,3.8,4.1,4.2,4.5,5.0)
payment<-c(2.18,2.06,2.54,2.61,3.67,3.25,4.02,3.71,4.38,4.45)

#To combine the data into data frame: data.frame()
data<-data.frame(claim,payment)

#Display & view the dataset: print(), View()
print(data)
View(data)

#Save the data> 1) set working directory 2)use function:write.csv
write.csv(data,"claim_payment.csv",row.names=FALSE)

# ==============================================================
# 2. Pearscon Correlation
# ==============================================================

# Calculate Pearson correlation value: cor(x,y, method="pearson")
r<-cor(claim,payment, method="pearson")
print(round(r,4))

# Scatter Plot for Pearson Correlation: plot(x,y)
plot(claim,payment,
     main="Pearson Correlation:Claim vs Payment",
     xlab="Claim(X)",
     ylab="Payment(Y)",
     pch=19,
     col="steelblue")

# Add correlation value on the plot: bty=box type for legend, n=no
legend("topleft",legend=paste("Pearson r=",round(r,4)),bty="n")


#Pearson correlation test: cor.test(x,y,method="pearson)
resultP<-cor.test(claim, payment, method="pearson")
print(resultP)



# ==============================================================
# 3. Spearman Rank Correlation
# ==============================================================

#Calculate ranks
Rank_X<-rank(claim)
Rank_Y<-rank(payment)

#Combine ranks into a data frame
rank_data<-data.frame(Rank_X,Rank_Y)

#Display the ranks
print(rank_data)


#Calculate Spearman Rank Correlation value: cor(x,y, method="spearman")
rho<-cor(claim,payment,method="spearman")
print(round(rho,4))

#Scatter plot for Spearman (Use rank data)
plot(Rank_X,Rank_Y,
     main="Spearman Rank Plot",
     xlab="Rank of Claim",
     ylab="Rank of Payment",
     pch=19,
     col="maroon")

#Spearman Correlation test: cor.test(x,y,method="spearman")
resultS<-cor.test(claim,payment,method="spearman")
print(resultS)
resultS$p.value


# ==============================================================
# 4. Kendall's Tau Correlation
# ==============================================================

#Calculate Kendall tau: cor(x,y,method="kendall")
tau<-cor(claim,payment,method="kendall")
print(round(tau,4))

#Scatter plot for Kendall's tau: plot(x,y)
plot(claim,payment,
     main="Kendall's Tau: Claim and Payment",
     xlab="Claim(X)",
     ylab="Payment(Y)",
     pch=19,
     col="darkgreen")

#Kendall's tau correlation test
resultK<-cor.test(claim,payment,method="kendall")
print(resultK)


