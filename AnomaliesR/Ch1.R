#Part 1 

# Explore contents of dataset
head(river)
boxplot(river$nitrate)

# Plot a histogram of the nitrate column
hist(river$nitrate, xlab = "Nitrate concentration", breaks = 40)

# Apply Grubbs' test to the river nitrate data
grubbs.test(river$nitrate)
# Use which.max to find row index of the max
which.max(river$nitrate)
# Runs Grubbs' test excluding row 156
grubbs.test(river$nitrate[-156])
# Print the value tested in the second Grubbs' test
max(river$nitrate[-156])

# Show the time series of nitrate concentrations with time
plot(nitrate ~ index, data = river, type = "o")
# Calculate the mean nitrate by month
monthly_mean <- tapply(river$nitrate, river$months, FUN = mean)
monthly_mean
# Plot the monthly means 
plot(monthly_mean, type = "o", xlab = "Month", ylab = "Monthly mean")
# Create a boxplot of nitrate against months
boxplot(nitrate ~ months, data = river)

# Run Seasonal-Hybrid ESD for nitrate concentrations
AnomalyDetectionVec(x = river$nitrate, period = 12, direction = 'both', plot = T)

# Use Seasonal-Hybrid ESD for nitrate concentrations
river_anomalies <- AnomalyDetectionVec(x = river$nitrate, period = 12, direction = 'both', plot = T)
# Print the anomalies
river_anomalies$anoms
# Print the plot
print(river_anomalies$plot)