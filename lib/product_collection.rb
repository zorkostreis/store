require_relative "film"
require_relative "book"
require_relative "disk"

class ProductCollection
  attr_accessor :products

  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book},
    disk: {dir: 'disks', class: Disk}
  }

  def self.from_dir(path_to_data)
    products = []

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

  def to_s
    @products
      .map.with_index(1) { |product, indx| "#{indx}. #{product}" }
      .join("\n")
  end

  def size
    @products.size
  end

  def product_by_index(index)
    @products[index]
  end

  def sort!(params)
    @products.sort_by!(&params[:by])

    @products.reverse! if params[:order] == :dec

    self
  end

  def update!
    @products.select! { |product| product.amount.positive? }

    self
  end
end
