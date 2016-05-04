require_relative 'movies8_classes_0.rb'

#Переписать задание 4, сделав два класса: Movie и MoviesList
class MoviesList
  #MovieList должен уметь - разобрать данные из файла и превратить их в набор объектов Movie;
  def initialize(name_of_file)
  	@name_of_file = name_of_file
  	@array_of_movie = File.readlines(name_of_file).map {|line|Movie.new(line)}
  end
  def five_longest
    @array_of_movie.sort_by(&:duration).reverse.first(5)
  end
  def comedies
    @array_of_movie.select{|elem|elem.has_genre?('Comedy')}.sort_by(&:date)
  end  	
  def directors
    @array_of_movie.map(&:Director).uniq.sort
	end
	def not_in_USA
    @array_of_movie.reject{|elem|elem.country=="USA"}
  end
  def movies_by_director
    @array_of_movie.group_by(&:Director).map { |k,v| [k, v.size] }.sort
  end
  def actor_total
    @array_of_movie.map{|elem|elem.stars_to_array}.flatten.group_by{|elem|elem}.map{|k,v|[k,v.size]}.sort
  end 
  def month_statistics
    @array_of_movie.group_by{|elem| elem.month }.map { |k,v| [k, v.size] }.sort
  end
end