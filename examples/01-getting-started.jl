#!/usr/local/bin/julia

# Obligatory worldly salutation
println("o hai world")

#=
Use can use block comments
=#

#=
Maths
=#

# Unary operators
1 + 2 - 4 * 3 / 5 ^ 6 % 7

#=
Bitwise operator
=#

# Not
~true
# And
true & false
# Or
false | true
# Xor
true ⊻ false
# Logical shift
true >>> false
# Arithmetic shift
true >> false
# Logical/arithmetic shift
true << true

#=
Every binary arithmetic and bitwise operator also has an
updating version that assigns the result of the operation
back into its left operand.
=#

# Comparative operatations
1_000 == 1000

# Built-in specials
pi
e
π == pi

# Functions that look like maths
f(x) = x^2 + 2π
f(3)

#=
Strings
=#
typeof('x')
typeof("x")
Int('x')
str = "oh hai wurld"
str[1]
str[4:12]
str[end]

#=
Functions
=#
function f(x, y)
  x + y
end
f(3, 4)

f(x, y) = x + y
f(4, 5)

#=
Arrays
=#
[1, 2, 3, 4, 5]
collect(1:5)

letters = collect('a':'z')
letters[1]

1:5 .* 2
length(letters)

[1 2 3; 4 5 6]
[[1, 2, 3] [4, 5, 6]]
Array(1:3)
Array([1 3 4])

eye(5)
[(i,j) for i=1:3 for j=1:i]
reshape(1:16, 4, 4)

#=
Control flow
=#
















# EOF
