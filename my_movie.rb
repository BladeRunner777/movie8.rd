require_relative 'movie.rb'

class MyMovie < Movie 
  attr_reader :rating2, :weight
  
  def my_rating(count)
    @rating2 = count
  end

  #Все фильмы в MyMovieList должны быть четырёх классов, унаследованных от Movie: AncientMovie (фильм 1900-1945), ClassicMovie (1945-1968), ModernMovie (1968-2000) и NewMovie (2000 по сегодняшний день)
  def self.create(line)
    year = line.split('|')[2].to_i
    if year < 1945
      AncientMovie.new(line)
    elsif year < 1968
      ClassicMovie.new(line)
    elsif year < 2000
      ModernMovie.new(line)
    else
      NewMovie.new(line)
    end
  end
  
end

class AncientMovie < MyMovie
  def recommendation
    @weight = 1
    @name + " — old movie " + @year.to_s
  end
end

class ClassicMovie  < MyMovie
  def recommendation
    @weight = 2
    @name + " — classic movie. Director — " + @director #+ " Movies of director: " + list.directors_creatives(@director, 10)
  end
end

class ModernMovie < MyMovie
  def recommendation
    @weight = 3
    @name + " — modern movie. Stars: " + @stars.to_s
  end
end

class NewMovie < MyMovie
  def recommendation
    @weight = 4
    @name + " — new movie. IMDb rating:" + @rating
  end
end