require_relative "lib/product"
require_relative "lib/film"
require_relative "lib/book"

film_paths = Dir["#{__dir__}/data/films/*.txt"]
book_paths = Dir["#{__dir__}/data/books/*.txt"]

films =
  film_paths.map do |film_path|
    Film.from_file(film_path)
  end

books =
  book_paths.map do |book_path|
    Book.from_file(book_path)
  end

films.each { |film| puts film }
books.each { |book| puts book }
