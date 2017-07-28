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
f(x) = x^2 + 2x
f(3)

#=
Strings
=#
typeof('x')
typeof("x")
Int('x')
str = "oh hai wurld"
str[1]
str[4:5]
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


foo(x::Int) = println("$x is an integer")

@time foo(5)
@time foo(π)
foo(x::String) = println("$x is a string")

#=
Arrays
=#
A = [1, 2, 3, 4, 5]
collect(1:5)
[i for i in 1:5]

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

eye(Int, 10) .* collect(1:10:100)

#=
Control flow
=#

# Compound expressions
z = begin
  x = 1
  y = 2
  x + y
end

z = (x = 1; y = 2; x + y)

# Conditional expressions
if x < y
    println("x is less than y")
elseif x > y
    println("x is greater than y")
else
    println("x is equal to y")
end

x < y ? "less than" : "not less than"

# While loop
i = 1
while true
  println(i)
  if i >= 5
    break
  end
  i += 1
end

# For loop
for i = 1:10
  if i % 3 != 0
    continue
  end
  println(i)
end

# Try-catch
f(x) =
  try
    sqrt(x)
  catch
    sqrt(complex(x, 0))
end

"""
# Tasks aka Coroutines aka Green Threads

Tasks are a control flow feature that allows computations to be suspended and
resumed in a flexible manner.
"""

"""
# Project Euler

## Problem 9: Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

```math
a^2 + b^2 = c^2
```

For example, 32 + 42 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
"""

"Generates Pythagorean triplets."
function pythagorean_triplet_producer(ch::Channel)
  m = 2
  while true
    for n = 1:(m-1)
      a = 2*m*n
      b = m^2 - n^2
      c = m^2 + n^2
      put!(ch, [a, b, c])
    end
    m += 1
  end
end

"Solves the 9th Projec Euler programming problem."
function pr009()
  chnl = Channel(pythagorean_triplet_producer)
  while true
    a = take!(chnl)
    if sum(a) == 1_000
      return prod(a)
    end
  end
end

@printf "Time elapsed:\t%4.8f\n" @elapsed pr009()





# EOF
