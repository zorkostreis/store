require_relative "lib/product"
require_relative "lib/film"
require_relative "lib/book"
require_relative "lib/disk"
require_relative "lib/product_collection"

path_to_data = "#{__dir__}/data"

collection = ProductCollection.from_dir(path_to_data)

puts "Добро пожаловать в наш магазин!"
puts

chosen_product_indices = []
user_choice = -1
sum = 0

until user_choice.zero?
  if user_choice.between?(1, collection.size) && collection.product_amount_by_index(user_choice - 1).positive?
    collection.product_by_index(user_choice - 1).amount -= 1
    sum += collection.product_price_by_index(user_choice - 1)

    chosen_product_indices << user_choice - 1

    puts "Вы выбрали: #{collection.product_by_index(user_choice - 1)}"
    puts "Всего товаров на сумму: #{sum} руб."
    puts
  end

  puts "Что хотите купить?"

  puts collection
  puts "\t0. Выход"

  user_choice = gets.to_i
end

puts
puts "Вы купили:"

chosen_product_indices.each do |index|
  puts collection.product_by_index(index)
end

puts
puts "С Вас — #{sum} руб. Спасибо за покупку!"
