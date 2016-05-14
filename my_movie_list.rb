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

  # устанавливаю фильму, найденному по названию, рейтинг
  def rate(the_name, count)
    @movies.select{|i|i.name==the_name}.each{|i|i.my_rating(count)}
  end

  # выдавать рекомендацию: 5 случайных фильмов, которые пользователь ещё не смотрел; фильмы с более высоким рейтингом должны выдаваться с большей вероятностью (но должна быть вероятность получить любой фильм);
  def random_old(count=5)
    #p у разных классов фильмов должен быть разный «вес», в зависимости от твоих предпочтений, и при выдаче рекомендации на вечер MyMoviesList должен учитывать И IMDB-рейтинг фильма, и этот в
    @movies.select{|elem|elem.rating2!=nil}.sort_by{|i|i.rating2.to_i* i.rating.to_i * i.class_weight.to_i * rand}.first(count)
  end 
  #выдавать рекомендацию: 5 случайных фильмов, которые пользователь уже видел и они ему понравились (вероятность получить такой фильм тем больше, чем выше пользователь оценил и чем давнее его видел);
  def random_new(count=5)
     #+ " Movies of director: " + m2.directors_creatives(@director)
    #p у разных классов фильмов должен быть разный «вес», в зависимости от твоих предпочтений, и при выдаче рекомендации на вечер MyMoviesList должен учитывать И IMDB-рейтинг фильма, и этот в
    @movies.reject{|elem|elem.rating2}.sort_by{|i|i.rating2.to_i * i.rating.to_i * i.class_weight.to_i * rand}.first(count)
  end 
  # режиссёр такой-то (ещё 10 его фильмов в спике)
  def directors_creatives(director, for_movie, count=10)
    if for_movie.is_a?(ClassicMovie)
      @movies.select{|elem|elem.director==director && elem!=for_movie}.first(count).map(&:name).to_s
    else
      ''
    end
  end

  def name_year(number)
    @movies[number].name + " (" + @movies[number].year + ")"
  end
end