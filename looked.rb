# сохранять для каждого фильма «я это уже посмотрел», оценка в баллах;
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