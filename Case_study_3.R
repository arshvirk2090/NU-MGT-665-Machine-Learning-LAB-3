# Load necessary libraries
library(cluster)
library(factoextra)

# Function to simulate student features
simulate_student_features <- function(n = 100) {
  # Set the random seed
  set.seed(260923)
  
  # Generate unique student IDs
  student_ids <- seq(1, n)
  
  # Simulate student engagement
  student_engagement <- rnorm(n, mean = 50, sd = 10)
  
  # Simulate student performance
  student_performance <- rnorm(n, mean = 60, sd = 15)
  
  # Combine the data into a data frame
  student_features <- data.frame(
    student_id = student_ids,
    student_engagement = student_engagement,
    student_performance = student_performance
  )
  
  # Return the data frame
  return(student_features)
}

# Function to perform KMeans clustering with varying K and return the WSS
find_optimal_k <- function(data, max_k = 10) {
  wss <- numeric(max_k)
  for (i in 1:max_k) {
    kmeans_result <- kmeans(data, centers = i, nstart = 25)
    wss[i] <- kmeans_result$tot.withinss
  }
  return(wss)
}

# Define the function for unsupervised learning
perform_unsupervised_learning <- function(student_features) {
  # Perform PCA for dimensionality reduction
  pca_result <- prcomp(student_features[, -1], scale. = TRUE)
  
 
    # Scatter plot of student features
  plot(student_features$student_engagement, student_features$student_performance,
       xlab = "Student Engagement", ylab = "Student Performance",
       main = "Student Features Scatter Plot", pch = 19, col = "darkblue")
  
  # Find optimal number of clusters (K) for KMeans
  wss_values <- find_optimal_k(pca_result$x)
  plot(1:length(wss_values), wss_values, type = "b", 
       xlab = "Number of Clusters (K)", ylab = "Within-cluster Sum of Squares (WSS)",
       main = "Elbow Method for Optimal K in KMeans")
  
  # Based on the elbow method, choose the optimal K
  optimal_k <- 3  # Change this based on the elbow plot or other criteria
  
  # Perform KMeans clustering with optimal K
  kmeans_result <- kmeans(pca_result$x, centers = optimal_k, nstart = 25)
  
  # Visualize the clustering results with scatter plot
  plot(pca_result$x[,1], pca_result$x[,2], 
       col = kmeans_result$cluster, pch = 19,
       xlab = "Principal Component 1", ylab = "Principal Component 2",
       main = "KMeans Clustering of Student Features",
       cex.main = 0.8)
  points(kmeans_result$centers[,1], kmeans_result$centers[,2], 
         col = 1:optimal_k, pch = 8, cex = 2)
  legend("topright", legend = paste("Cluster", 1:optimal_k), col = 1:optimal_k, pch = 19, cex = 0.8)
  
  # Perform hierarchical clustering
  hierarchical_result <- hclust(dist(pca_result$x))
  
  # Cut the dendrogram to obtain clusters
  dendrogram_cut <- cutree(hierarchical_result, k = optimal_k)
  
  # Plot dendrogram with cluster cuts
  plot(hierarchical_result, hang = -1, cex = 0.6, main = "Hierarchical Clustering Dendrogram")
  rect.hclust(hierarchical_result, k = optimal_k, border = 2:4)
  
  # Print cluster assignments
  cat("Hierarchical Clustering - Cluster Assignments:\n")
  print(dendrogram_cut)
}

# Simulate student features
student_features <- simulate_student_features(n = 100)

# Perform unsupervised learning
perform_unsupervised_learning(student_features)
