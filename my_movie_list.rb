require_relative 'movie_list'

class MyMoviesList < MoviesList
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
  # выдавать рекомендацию: 5 случайных фильмов, которые пользователь ещё не смотрел; фильмы с более высоким рейтингом должны выдаваться с большей вероятностью (но должна быть вероятность получить любой фильм);
  def random_old(count=5)
    #p @movies.select{|elem|elem.rating2!=nil}.map(&:name)
    @movies.select{|elem|elem.rating2!=nil}.sort_by{|i|i.rating2.to_i * rand}.first(count)
  end 
  #выдавать рекомендацию: 5 случайных фильмов, которые пользователь уже видел и они ему понравились (вероятность получить такой фильм тем больше, чем выше пользователь оценил и чем давнее его видел);
  def random_new(count=5)
    @movies.reject{|elem|elem.rating2}.sort_by{|i|i.rating2.to_i * rand}.first(count)
  end 
  # режиссёр такой-то (ещё 10 его фильмов в спике)
  def directors_creatives(director, count=10)
    @movies.select{|elem|elem.director==@director}.sort_by(&:date).first(10).map(&:name)
  end
end