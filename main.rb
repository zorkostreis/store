require_relative "lib/cart"
require_relative "lib/product_collection"

path_to_data = "#{__dir__}/data"

collection = ProductCollection.from_dir(path_to_data)
cart = Cart.new

puts "Добро пожаловать в наш магазин!"

user_choice = -1

until user_choice.zero?
  if user_choice.between?(1, collection.size)
    chosen_product = collection.product_by_index(user_choice - 1)

    chosen_product.amount -= 1
    cart << chosen_product

    puts <<~USER_CHOICE

      Вы выбрали: #{chosen_product}
      Всего товаров на сумму: #{cart.sum} руб.

    USER_CHOICE

    collection.update!
  end

  puts <<~COLLECTION

    Что хотите купить?

    #{collection}
    0. Выход

  COLLECTION

  print "Введите число: "
  user_choice = gets.to_i
end

puts <<~CART_TOTAL

  Вы купили:
  #{cart}

  С Вас — #{cart.sum} руб. Спасибо за покупку!
CART_TOTAL
