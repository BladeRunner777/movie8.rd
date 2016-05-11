require_relative 'movie.rb'

class MyMovie < Movie 
  attr_reader :rating2
  def my_rating(count)
    @rating2 = count
  end

  def name_year
    @name + " (" + @year + ")"
  end
    
end

class AncientMovie < MyMovie
  def recommendation
    @name + " — old movie " + @year.to_s
  end
end

class ClassicMovie  < MyMovie
  def recommendation
    #list = MyMoviesList.new(name_of_file)
    @name + " — classic movie. Director — " + @director #+ " Movies of director: " + list.directors_creatives(@director, 10)
  end
end

class ModernMovie < MyMovie
  def recommendation
    @name + " — modern movie. Stars: " + @stars.to_s
  end
end

class NewMovie < MyMovie
  def recommendation
    @name + " — new movie. IMDb rating:" + @rating
  end
end