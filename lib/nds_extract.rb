$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  new = []
  
  row = 0 
  while row < source.length do 
    new << source[row][:name]
    row += 1 
  end
  
  new
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  # sum = 0 
  #   source.each do |dir|
  # sum += gross_for_director(dir)
  
  total_sum = 0 
  i = 0 
  while i < list_of_directors(source).length do
    nam = list_of_directors(source)[i]
    total_sum += directors_totals(source)["#{nam}"]
    i += 1
    
   
  end
  
  return total_sum
  
end


