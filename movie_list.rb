require_relative 'movie.rb'

#Переписать задание 4, сделав два класса: Movie и MoviesList
class MoviesList
  #MovieList должен уметь - разобрать данные из файла и превратить их в набор объектов Movie;
  def initialize(name_of_file)
  	@movies = File.readlines(name_of_file).map {|line|Movie.new(line)}
  end
  def longest(count = 5)
    @movies.sort_by(&:duration).reverse.first(count)
  end
  def by_genre(genre)
    @movies.select{|elem|elem.has_genre?(genre)}.sort_by(&:date)
  end  	
  def directors
    @movies.map(&:director).uniq.sort
	end
	def not_from(country='USA')
    @movies.reject{|elem|elem.country==country}
  end
  def directors_in_movies
    @movies.group_by(&:director).map { |k,v| [k, v.size] }.sort
  end
  def actor_in_movies
    @movies.map{|elem|elem.stars}.flatten.group_by{|elem|elem}.map{|k,v|[k,v.size]}.sort
  end 
  def month_in_movies
    # обработаем месяц, в котором выпущен фильм, в строку
    @movies.group_by{|elem| "In month " + elem.month}.map { |k,v| [k, v.size] }.sort
  end
end