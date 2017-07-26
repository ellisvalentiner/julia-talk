#!/usr/local/bin/julia

#=
Julia has a built-in package manager for installing add-on
functionality written in Julia.

The package manager is
  - declarative rather than imperative
=#

# Print what packages are installed, their version and state
Pkg.status()

# Declare a new requirement
Pkg.add("Distributions")

#=
Pkg.add first adds "Distributions" to your
  ~/.julia/v0.6/REQUIRE file
and then runs Pkg.resolve() to determine the
best set of packages
=#

# Verify Distributions was installed
Pkg.status()

# Package directory
Pkg.dir()

# Remove a requirement
Pkg.rm("Distributions")

# Update your packages
Pkg.update()

# Checkout, Pin, and Free
Pkg.checkout("DataFrames", v"0.10.0")
Pkg.pin("DataFrames", v"0.10.0")
Pkg.free("DataFrames")

#=
PkgDev for creating your own packages:
  - PkgDev.generate("PackageName", "License")
  - PkgDev.register("PackageName")
  - PkgDev.publish("PackageName")
=#
