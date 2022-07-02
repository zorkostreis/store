class ProductCollection
  attr_accessor :products

  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book},
    disk: {dir: 'disks', class: Disk}
  }

  def self.from_dir(path_to_data)
    products  = []

    PRODUCT_TYPES.each do |type, product_info|
      product_paths = Dir["#{path_to_data}/#{product_info[:dir]}/*.txt"]

      product_paths.each do |product_path|
        products << product_info[:class].from_file(product_path)
      end
    end

    self.new(products)
  end

  def initialize(products)
    @products = products
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.title }
    when :price
      @products.sort_by! { |product| product.price }
    when :amount
      @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :dec

    self
  end
end