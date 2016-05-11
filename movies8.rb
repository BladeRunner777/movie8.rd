require_relative 'movie_list.rb'
require_relative 'my_movie_list.rb'

# Запрашиваю имя файла с клавиатуры пользователем
puts "Input the name of file:"
name_of_file = gets.chomp # отсекаю перенос строки!

# реализация бонуса из прошлого задания
if !File.exist?(name_of_file)
  puts "File not found: " + name_of_file
  exit
end

require 'ostruct'

m = MyMoviesList.new(name_of_file)

# 5 самых длинных фильмов
puts
puts "The five longest movies are..."
m.longest().each {|movie|
  puts movie.name + " ==> " + movie.duration.to_s + " min."}

#все комедии, отсортированные по дате выхода
puts
puts "The oldest comedies are..."
m.by_genre('Comedy').each {|movie| 
  puts movie.name + " ==> " + movie.genre + " date " + movie.date
} 

#список всех режиссёров по алфавиту (без повторов!)
puts
puts "Directors are..."
p m.directors
#количество фильмов, снятых не в США.
puts
puts "Not in the USA was made " + m.not_from('USA').size.to_s + " movies."

#1.Вывести количество фильмов, сгруппированных по режиссёру, использовать метод group by
puts
puts "Directors and a number of movies:"
p m.directors_in_movies
#2.Вывести количество фильмов, в котором снялся каждый актёр
puts
puts "Actors and a number of movies:"
p m.actor_in_movies
#Вывести статистику по месяцам — в каком сколько фильмов снято (вне зависимости от года), использовать библиотеку date
puts
puts "Month statistics:"
p m.month_in_movies

#Ввожу те которые уже посмотрел!
puts
puts "Let`s make your own rating!"
m.looked

#Рекомендация 5 новых!
puts
puts "The five NEW random movies are..."
#m.random_new(5).each {|movie| puts movie.class}
m.random_new(5).each {|movie| puts movie.recommendation}

#Рекомендация 5 старых
puts
puts "The five OLD random movies, you seen ..."
m.random_old(5).each {|movie|puts "Personal rating " + movie.recommendation}