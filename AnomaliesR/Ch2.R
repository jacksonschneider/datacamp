# View the contents of the wine data
head(wine)
# Scatterplot of wine pH against alcohol
plot(pH ~ alcohol, data = wine)

# Calculate the 5 nearest neighbors distance
wine_nn <- get.knn(wine, k = 5)
# View the distance matrix
head(wine_nn$nn.dist)
# Distance from wine 5 to nearest neighbor
wine_nn$nn.dist[5, 1]
# Row index of wine 5's nearest neighbor 
wine_nn$nn.ind[5, 1]
# Return data for wine 5 and its nearest neighbor
wine[c(5,1751),]

# Calculate the 5 nearest neighbors distance
wine_nn <- get.knn(wine, k = 5)
# Create score by averaging distances
wine_nnd <- rowMeans(wine_nn$nn.dist)
# Print row index of the most anomalous point
which.max(wine_nnd)