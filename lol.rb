require 'json'
str ="[[1, 2], [3, 4], [5, 6]]"
arr = JSON.parse(str) # => [[1, 2], [3, 4], [5, 6]]
puts arr[0] # => [1, 2]



