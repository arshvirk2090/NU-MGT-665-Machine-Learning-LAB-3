# Student Clustering and Dimensionality Reduction

This repository contains R code for performing dimensionality reduction and clustering on student features data, along with a brief analysis of the results and their implications for learning analytics.

## Code Overview

- `simulate_student_features.R`: R script to simulate student features data.
- `unsupervised_learning.R`: R script to perform dimensionality reduction (PCA) and clustering (KMeans and hierarchical clustering) on student features data.

## How to Use

1. **Simulate Student Features**: Run `simulate_student_features.R` to generate simulated student features data.

2. **Perform Unsupervised Learning**: Run `unsupervised_learning.R` to perform dimensionality reduction and clustering on the simulated data.

## Dimensionality Reduction and Clustering Approach

1. **Dimensionality reduction**: The approach utilized Principal Component Analysis (PCA) for reducing the dimensionality of the data (Shi 2021). PCA transforms the original features into a lower-dimensional space while preserving the variance in the data. This was done using the prcomp function in R.

2. **Clustering Approach**: KMeans clustering was chosen as the clustering algorithm. The optimal number of clusters was determined using the elbow method, which plots the within-cluster sum of squares (WSS) against the number of clusters. The "elbow point" indicates the optimal number of clusters where adding more clusters does not significantly improve the WSS (Adiwijaya 2018). Davies-Bouldin Index (DBI) was calculated to evaluate the quality of clustering.
  
## Results and Analysis
  
- **Number of clusters identified**: Based on the elbow method, the optimal number of clusters was determined to be 3.
- **Characteristics of each cluster**: Clusters were visualized in a scatter plot where each point represented a student. Clusters were differentiated by color. Additionally, cluster centers were plotted to illustrate the central tendency of each cluster. In hierarchical clustering, the dendrogram was cut into 3 clusters.
- **Insights gained**: The analysis provided insights into how students can be grouped based on their engagement and performance. Cluster 1 seemed to represent high-performing and highly engaged students, Cluster 2 had moderately performing and engaged students, and Cluster 3 consisted of lower-performing and less engaged students.


## Implications for Learning Analytics

•	**Tailored interventions**: Identifying clusters allows for targeted interventions. For instance, resources and support can be directed towards Cluster 3 students to improve their engagement and performance.
•	**Predictive modeling**: Clustering can serve as a basis for predictive modeling. By understanding the characteristics of each cluster, educational institutions can develop models to predict student outcomes and provide proactive support.
•	**Curriculum design**: Insights from clustering can inform curriculum design by identifying areas where adjustments are needed to better cater to the needs of different student groups.
•	**Continuous improvement**: Regular analysis of student clusters enables continuous improvement in teaching methodologies and support systems, leading to enhanced learning outcomes.



## References 

- Shi, C., Wei, B., Wei, S., Wang, W., Liu, H., & Liu, J. (2021). A quantitative discriminant method of elbow point for the optimal number of clusters in clustering algorithm. Eurasip Journal on Wireless Communications and Networking, 2021, 1-16.
- Adiwijaya, W. U., Lisnawati, E., Aditsania, A., & Kusumo, D. S. (2018). Dimensionality reduction using principal component analysis for cancer detection based on microarray data classification. Journal of Computer Science, 14(11), 1521-1530.
