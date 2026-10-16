# ==================================================
# Manage the Data
# ==================================================

#Enter the data
X<-c(10,20,20,30,40,50)
Y<-c(100,200,300,300,400,500)

#Combine data into a data frame
data<-data.frame(X,Y)

#Display the original data
print(data)

# ==================================================
# Spearman Rank Correlation with Ties
# ==================================================

rho_spearman<-cor(X,Y,method="spearman")
cat("Spearman Correlation (R built-in method) = ",round(rho_spearman,4),"\n")

#NOTE: cor(X, Y, method = "spearman") use average ranks for tied observations 
#and calculate the Pearson correlation between the ranks.


# ==================================================
# Kendall's Tau Correlation with Ties
# ==================================================

tau<-cor(X,Y,method="kendall")
cat("Kendall's Tau = ",round(tau,4),"\n")
