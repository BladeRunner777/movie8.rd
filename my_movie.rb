require_relative 'movie.rb'

class MyMovie < Movie 
  attr_reader :rating2
  def my_rating(count)
    @rating2 = count
  end

  def name_year
    @name + " (" + @year + ")"
  end

  #Все фильмы в MyMovieList должны быть четырёх классов, унаследованных от Movie: AncientMovie (фильм 1900-1945), ClassicMovie (1945-1968), ModernMovie (1968-2000) и NewMovie (2000 по сегодняшний день)
  def what_type?
    year = @year.to_i
    if year < 1945
      AncientMovie.new(line)
    elsif year < 1968
      ClassicMovie.new(line)
    elsif
      ModernMovie.new(line)
    else
      NewMovie.new(line)
    end
  end    
end

class AncientMovie < MyMovie
  def recomendation
    @name + " — old movie " + @year.to_s
  end
end

class ClassicMovie  < MyMovie
  def recomendation
    @name + " — classic movie. Director — " + @director + " Movies of director: " + @movies.select{|elem|elem.director==movie.director}.sort_by(&:date).first(10).map(&:name)
  end
end

class ModernMovie < MyMovie
  def recomendation
    @name + " — old movie " + @year.to_s
  end
end

class NewMovie < MyMovie
  def recomendation
    @name + " — old movie " + @year.to_s
  end
end