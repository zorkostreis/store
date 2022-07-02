class Film < Product
  attr_accessor :name, :director, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true)

    self.new(
      name: lines[0],
      director: lines[1],
      year: lines[2],
      price: lines[3],
      amount: lines[4]
    )
  end

  def initialize(params)
    super

    @name = params[:name]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм «#{@name}», #{@year}, режиссёр - #{@director}, #{super}"
  end

  def update(params)
    super
    @name = params[:name] if params[:name]
    @director = params[:director] if params[:director]
    @year = params[:year] if params[:year]
  end
end
