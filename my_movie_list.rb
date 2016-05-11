require_relative 'movie_list.rb'

class MyMoviesList < MoviesList
  
  #4 разных классов! 
  def initialize(name_of_file)
    @movies = File.readlines(name_of_file).map {|line|MyMovie.create(line)}
  end
  
  # сохранять для каждого фильма «я это уже посмотрел», оценка в баллах;
  def looked
    a=true
    while a==TRUE
      puts 'Enter the number of movie You looked, from 1 to ' + @movies.size.to_s + ': (0 - exit)'
      number_of_movie = gets.to_i
      if number_of_movie==0
        puts 'See you later!'
        a=false
      elsif number_of_movie>=@movies.size
        puts 'This is too big number! By!'
        a=false 
      else
        puts '=>' + @movies[number_of_movie].name_year + ' Whay is your personal rating?  From 1 to 10: '
        personal_rating = gets.to_i
        if (1..10).to_a.include?(personal_rating)
          @movies[number_of_movie-1].my_rating(personal_rating)
        else
          p "Wrong rating!"
        end
        puts
      end
    end
  end

  def level
    puts
    puts "Enter level of Ancient Movie (1..4)"
    weight = gets.to_i
    @movies.select{|elem|elem.class.to_s=='AncientMovie'}.each{|i|i.my_weight(weight)}
    puts
    puts "Enter level of Classic Movie (1..4)"
    weight = gets.to_i
    @movies.select{|elem|elem.class.to_s=='ClassicMovie'}.each{|i|i.my_weight(weight)}
    puts
    puts "Enter level of Modern Movie (1..4)"
    weight = gets.to_i
    @movies.select{|elem|elem.class.to_s=='ModernMovie'}.each{|i|i.my_weight(weight)}
    puts
    puts "Enter level of New Movie (1..4)"
    weight = gets.to_i
    @movies.select{|elem|elem.class.to_s=='NewMovie'}.each{|i|i.my_weight(weight)}

    @movies.map(&:weight)
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
end