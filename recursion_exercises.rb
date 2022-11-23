def rec_range(start, finish)
  return [] if finish < start
  return [finish] if finish == start

  final = rec_range(start, finish - 1)

  final << start
end

def it_range(start, finish)
  return [] if finish < start
  (start..finish).map { |ele| ele }
end

# p it_range(1, 5)
# p rec_range(1, 5)

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exponents_1(i, pow)
  return 1 if pow == 0
  i * exponents_1(i, pow - 1)
end

# p exponents_1(4, 3)

def exponents_2(i, pow)
  return 1 if pow == 0
  if pow.even?
    pow_e = pow / 2
    i * exponents_2(i, pow_e)
  else
    pow_o = (pow - 1) / 2
    i * exponents_2(i, pow_o)
  end
end

p exponents_1(4, 4)
p exponents_2(4, 4)
p exponents_2(2, 9)

#i = 2 ,pow = 9
#2* exp2(2,4) = 16
#2* exp2(2,2) = 8
#2*exp2(2,1) = 4
#2*exp2(2,0) = 2
