$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  grand_totals = {}
  
  source.each do |d|
    director_gross = 0 
    while director_gross < d.size do
      director = d[:name] 
      total_gross = gross_for_director(d)
      director_gross += 1
    end
    grand_totals[director] = total_gross
  end    
  return grand_totals
end


def gross_for_director(d)
  total_movie_gross = 0 
  movie_counter = 0
  while movie_counter < d[:movies].count do 
    total_movie_gross += d[:movies][movie_counter][:worldwide_gross]
    movie_counter += 1 
  end
  return total_movie_gross
end


def list_of_directors(source)
  dir_list = []
  source.each do |d|
    name = 0
    dir_list << d[:name]
    name += 1 
  end
  p dir_list
end


def total_gross(source)
  grand_total = 0 
  total = 0 
  while total < source.size do 
    directors_totals(source).each do |k, v|
      grand_total += v
      total += 1 
    end
  end
  grand_total
  p grand_total
end    
    
#  index = 0
#
#  while index < d[:movies].length do
#    total += d[:movies][index][:worldwide_gross]
#    index += 1
#  end
#  total
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total