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

arr = [1, 2, 3]

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

def fibonacci(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fibs = fibonacci(n - 1)
  fibs << fibs[-1] + fibs[-2]
end

def fibonacci_it(n)
  return [] if n == 0
  return [0] if n == 1

  new_arr = [0, 1]
  while new_arr.length < n
    new_arr << new_arr[-1] + new_arr[-2]
  end
  new_arr
end

# p fibonacci(13)

# p fibonacci_it(13)

def bsearch(arr, target)
  return nil if !arr.include? target

  idx_odd = (arr.length) / 2

  if arr[idx_odd] == target
    return idx_odd
  end

  if target < arr[idx_odd]
    bsearch(arr[0..idx_odd - 1], target)
  else
    bsearch(arr[idx_odd + 1..-1], target) + arr[0..idx_odd].length
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return if arr.length == 0
    return arr if arr.length == 1

    midpoint = arr.length / 2

    left = merge_sort(arr[0..midpoint-1])
    p left
    right = merge_sort(arr[midpoint..-1])
    p right

    merge(left,right)
end

def merge(arr1, arr2)
    merged = []
    max_length = (arr1.length + arr2.length)

    while arr1.length > 0 && arr2.length > 0
        if arr1[0] > arr2[0]
            merged << arr2[0]
            arr2.delete(arr2[0])
        else
            merged << arr1[0]
            arr1.delete(arr1[0])
        end
    end

    merged += arr1 + arr2

end

# p merge_sort([38,27,43,3,9,82,10])

