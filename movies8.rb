require_relative 'movies8_classes_1.rb'

# Запрашиваю имя файла с клавиатуры пользователем
puts "Input the name of file:"
name_of_file = gets.chomp # отсекаю перенос строки!

# реализация бонуса из прошлого задания
if !File.exist?(name_of_file)
  puts "File not found: " + name_of_file
  exit
end

require 'ostruct'

m = MoviesList.new(name_of_file)

# 5 самых длинных фильмов
puts
puts "The five longest movies are..."
m.five_longest.each {|movie|
  puts movie.name + " ==> " + movie.duration.to_s + " min."}

#все комедии, отсортированные по дате выхода
puts
puts "The oldest comedies are..."
m.comedies.each {|movie| 
  puts movie.name + " ==> " + movie.genre + " date " + movie.date.to_s
} 

#список всех режиссёров по алфавиту (без повторов!)
puts
puts "Directors are..."
p m.directors
#количество фильмов, снятых не в США.
puts
puts "Not in the USA was made " + m.not_in_USA.size.to_s + " movies."

#1.Вывести количество фильмов, сгруппированных по режиссёру, использовать метод group by
puts
puts "Directors and a number of movies:"
p m.movies_by_director
#2.Вывести количество фильмов, в котором снялся каждый актёр
puts
puts "Actors and a number of movies:"
p m.actor_total
#Вывести статистику по месяцам — в каком сколько фильмов снято (вне зависимости от года), использовать библиотеку date
puts
puts "Month statistics:"
p m.month_statistics