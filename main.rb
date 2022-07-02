require_relative "lib/product"
require_relative "lib/film"
require_relative "lib/book"
require_relative "lib/disk"
require_relative "lib/product_collection"

path_to_data = "#{__dir__}/data"

collection = ProductCollection.from_dir(path_to_data)

puts "Добро пожаловать в наш магазин!"
puts

chosen_product_numbers = []
user_choice = -1
sum = 0

until user_choice.zero?
  if user_choice.between?(1, collection.products.size) && collection.products[user_choice - 1].amount.positive?
    collection.products[user_choice - 1].amount -= 1
    sum += collection.products[user_choice - 1].price

    chosen_product_numbers << user_choice - 1

    puts "Вы выбрали: #{collection.products[user_choice - 1]}"
    puts "Всего товаров на сумму: #{sum} руб."
    puts
  end

  puts "Что хотите купить?"

  collection.products.each.with_index(1) do |product, indx|
    puts "\t#{indx}. #{product}"
  end
  puts "\t0. Выход"

  user_choice = gets.to_i
end

puts
puts "Вы купили:"

chosen_product_numbers.each do |number|
  puts collection.products[number]
end

puts
puts "С Вас — #{sum} руб. Спасибо за покупку!"
