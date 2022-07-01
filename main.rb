require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'

leon = Film.new(price: 290, amount: 4)

puts leon.price
