#!/usr/local/bin/julia

using RDatasets: dataset
using DecisionTree

iris = dataset("datasets", "iris")

head(iris)

features = Array.(iris[:, 1:4])
labels = Array(iris[:, 5])

# Single Tree
model = build_tree(labels, features)
print_tree(model)

# Random Forest
# - 2 random features
# - 10 trees
# - 0.5 portion of samples per tree (optional)
# - maximum tree depth of 6 (optional)
model = build_forest(labels, features, 2, 10, 0.5, 6)

# Predict on new data
newdata = [5.9,3.0,5.1,1.9]
apply_forest(model, newdata)

# Estimate predicted probabilities for each class
apply_forest_proba(model, newdata, ["setosa", "versicolor", "virginica"])

# Cross-validatino for random forests
accuracy = nfoldCV_forest(labels, features, 2, 10, 3, 0.5)
