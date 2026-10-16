# ==================================================
# Manage the Data
# ==================================================

#Enter the data
X<-c(30,50,50,20,10,40)
Y<-c(200,400,300,200,100,300)

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
