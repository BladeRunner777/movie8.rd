# сохранять для каждого фильма «я это уже посмотрел», оценка в баллах;
# И чтобы ВСЕ штуки про рейтинг были в отдельном модуле.
module Looked
  def Looked.into(list)
    # забираю у пользователя возможность оценивать фильмы: только методами, только хардкор!
    list.rate('Titanic', 3)
    list.rate('The Matrix', 5)
    list.rate('Fight Club', 9)
    list.rate('Lord of the Rings', 6) 
    list.rate('The Shawshank Redemption', 12) 
    list.rate('The Godfather: Part II', 10) 
    puts
    puts "The five NEW random movies are..."
    list.random_new(5).each {|movie| puts movie.recommendation}
    puts
    puts "The five OLD random movies, you seen ..."
    list.random_old(5).each {|movie| puts "Personal rating " + movie.recommendation}

  end
end

=begin
#Рекомендация 5 новых!
puts
puts "The five NEW random movies are..."
#m.random_new(5).each {|movie| puts movie.class}

#Рекомендация 5 старых
puts
puts "The five OLD random movies, you seen ..."
=end


# не поняли художника! оставляю в комментариях потомкам!
=begin
module Looked
  def Looked.into(m)
    a=true
    while a==TRUE
      puts 'Enter the number of movie You looked, from 1 to ' + m.size.to_s + ': (0 - exit)'
      number_of_movie = gets.to_i
      if number_of_movie==0
        puts 'See you later!'
        a=false
      elsif number_of_movie>=m.size
        puts 'This is too big number! By!'
        a=false 
      else
        puts '=>' + m.name_year(number_of_movie) + ' Whay is your personal rating?  From 1 to 10: '
        personal_rating = gets.to_i
        if (1..10).to_a.include?(personal_rating)
          m.looked(number_of_movie-1, personal_rating)
        else
          p "Wrong rating!"
        end
        puts
      end
    end
  end
end
=end