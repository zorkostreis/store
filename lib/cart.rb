class Cart
  def initialize
    @products = []
  end

  def <<(new_product)
    @products << new_product
  end

  def to_s
    @products
      .tally
      .map { |product, amount| "#{product}: #{amount} шт." }
      .join("\n")
  end

  def sum
    @products.sum(&:price)
  end
end
