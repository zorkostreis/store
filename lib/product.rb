class Product
  attr_reader :price, :amount

  def initialize(params)
    @price = params[:price]
    @left_count = params[:amount]
  end
end
