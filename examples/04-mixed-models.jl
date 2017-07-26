#!/usr/local/bin/julia

using MixedModels
using RDatasets: dataset

"""
# InstEval

Data are from a special evaluation of lecturers by students at the Swiss Federal
Institute for Technology–Zürich (ETH–Zürich). There are nearly 75,000 evaluations
by 2,972 students on a total of 1,128 instructors.
"""
InstEval = dataset("lme4", "InstEval")

DataFrames.printtable(InstEval)

# Define a formula
f = @formula(Y ~ 1 + Dept*Service + (1 | S) + (1 | D))
typeof(f)

# Create a LinearMixedModel
m = lmm(f, InstEval)
typeof(m)

# Fit a statistical model in-place
fittedmodel = fit!(m)
typeof(fittedmodel)

print(fittedmodel)
