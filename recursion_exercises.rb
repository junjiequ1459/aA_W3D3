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

# p exponents_1(4, 4)
# p exponents_2(4, 4)
# p exponents_2(2, 9)

arr = [1,2,3]

class Array

    #want to return a new array, do not mutate existing array
    #internal arrays should be new objects
    #[1, [2], [3, [4]]]
    # return self if self.none? { |ele| ele.is_a?(Array) }

    #[1, [2], [3, [4]]]
    #


    def deep_dup

        new_arr = []

        self.each do |ele|
            if ele.is_a?(Array)
                new_arr << ele.deep_dup
            else
                new_arr << ele
            end
        end

        new_arr
    end
end

# p [1, [2], [3, [4]]].deep_dup

# arr[1] = [2]

# Step 1 outter shell [1, [2], [3, [4]]] , this contains arrays inside, iterate through these
# step 2: identify if an element is an array, if it is, call deep_dup.



# if sub_arr.is_a?(Array)
#   sub_arr.each { |e| e.is_a?(Array) } [1,2,3,[4],5]