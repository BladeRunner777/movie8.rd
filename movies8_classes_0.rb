#Movie должно быть хранилищем данных об отдельном фильме, облегчающим к нему доступ
class Movie
  # использую константу названий
  NAMES_OF_FIELS = ['http', 'name', 'year','country','date','genre','duration','rating','Director','Stars']
  attr_reader :line,*NAMES_OF_FIELS
	
  def initialize(line)
    @line = line.chomp
    NAMES_OF_FIELS.zip(@line.split("|")).each{|x|instance_variable_set("@"+x[0], x[1])}
    @duration = duration.to_i  #только одно поле глючит!
  end
  # разобьем актеров по запятой!
  def stars_to_array
		@Stars.chomp.split(',')  	
  end
  # обработаем месяц, в котором выпущен фильм, в строку
  def month
    require 'date'
  	return begin "In month " + Date.strptime(@date, '%Y-%m').mon.to_s rescue 'no month' end
  end
  # есть ли у этого фильма жанр...?
  def has_genre?(name)
    @genre.include?(name)
  end
end