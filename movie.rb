require 'date'

#Movie должно быть хранилищем данных об отдельном фильме, облегчающим к нему доступ
class Movie
  # использую константу названий
  NAMES_OF_FIELDS = %w[http name year country date genre duration rating director stars]
  attr_reader :line,*NAMES_OF_FIELDS
	
  def initialize(line)
    @line = line.chomp
    NAMES_OF_FIELDS.zip(@line.split("|")).each{|x|instance_variable_set("@"+x[0], x[1])}
    @duration = duration.to_i  #из длительности просто вытащу цифры 
    @stars = stars.chomp.split(',')    # всегда будем использовать актеров, разбитых на запятые!
  end
  
  def month
  	#return begin "In month " + Date.strptime(@date, '%Y-%m').mon.to_s rescue 'no month' end
    if @date.size >= 7
      # красивые названия месяцев! 
      return Date.strptime(@date, '%Y-%m').mon
    else
      return 0
    end
  end

  # есть ли у этого фильма жанр...?
  def has_genre?(name)
    @genre.include?(name)
  end
end