require_relative 'movie_list.rb'

class MyMoviesList < MoviesList
  
  #4 разных классов! 
  def initialize(name_of_file)
    @movies = File.readlines(name_of_file).map {|line|MyMovie.create(line)}
  end
  
  # сохранять для каждого фильма «я это уже посмотрел», оценка в баллах;
  def looked(number_of_movie, personal_rating)
    @movies[number_of_movie-1].my_rating(personal_rating)
  end

  def level
    weight = 1
    @movies.grep(AncientMovie).each{|i|i.my_weight(weight)}
    weight = 2
    @movies.grep(ClassicMovie).each{|i|i.my_weight(weight)}
    weight = 3
    @movies.grep(ModernMovie).each{|i|i.my_weight(weight)}
    weight = 4
    @movies.grep(NewMovie).each{|i|i.my_weight(weight)}
  end

  # выдавать рекомендацию: 5 случайных фильмов, которые пользователь ещё не смотрел; фильмы с более высоким рейтингом должны выдаваться с большей вероятностью (но должна быть вероятность получить любой фильм);
  def random_old(count=5)
    #p у разных классов фильмов должен быть разный «вес», в зависимости от твоих предпочтений, и при выдаче рекомендации на вечер MyMoviesList должен учитывать И IMDB-рейтинг фильма, и этот в
    @movies.select{|elem|elem.rating2!=nil}.sort_by{|i|i.rating2.to_i* i.rating.to_i * i.weight * rand}.first(count)
  end 
  #выдавать рекомендацию: 5 случайных фильмов, которые пользователь уже видел и они ему понравились (вероятность получить такой фильм тем больше, чем выше пользователь оценил и чем давнее его видел);
  def random_new(count=5)
    #p у разных классов фильмов должен быть разный «вес», в зависимости от твоих предпочтений, и при выдаче рекомендации на вечер MyMoviesList должен учитывать И IMDB-рейтинг фильма, и этот в
    @movies.reject{|elem|elem.rating2}.sort_by{|i|i.rating2.to_i * i.rating.to_i * i.weight * rand}.first(count)
  end 
  # режиссёр такой-то (ещё 10 его фильмов в спике)
  def directors_creatives(director, count=10)
    @movies.select{|elem|elem.director==@director}.sort_by(&:date).first(10).map(&:name)
  end

  def name_year(number)
    @movies[number].name + " (" + @movies[number].year + ")"
  end
end