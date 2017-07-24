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


"""
Wrapper for producing a Random Forest model
"""
function RandomForest(x, y, ntrees=10)
  features = Array.(x)
  labels = Array(y)

  nfeatures = size(features)[2] |> sqrt |> floor |> Int
  model = build_forest(labels, features, nfeatures, ntrees)
  return(model)
end

model = RandomForest(iris[:, 1:4], iris[:, 5], 50)

# Predict on new data
newdata = [5.9,3.0,5.1,1.9]
apply_forest(model, newdata)

# Estimate predicted probabilities for each class
apply_forest_proba(model, newdata, ["setosa", "versicolor", "virginica"])

# Cross-validation for random forests
accuracy = nfoldCV_forest(labels, features, 2, 10, 3, 0.5)
