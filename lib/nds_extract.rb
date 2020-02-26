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

# ---------------------------------------------------------------

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

# ---------------------------------------------------------------

def list_of_directors(source)
  #extract names of directors from AoH
  
  director_index = 0 
  director_names = []
  while director_index < source.count do 
    
    director_names << source[director_index][:name]
    
    director_index += 1 
  end 
  director_names
end

# ---------------------------------------------------------------

def total_gross(source)
  #return the total gross of all directors using list_of_directors and directors_totals methods
  
  array_of_director_names = list_of_directors(source)
  result_hash = directors_totals(source)
  
  total = 0 
  name_index = 0  
  
  
  while name_index < array_of_director_names.count do 
    
    for key in result_hash.keys()
      if array_of_director_names[name_index] == key 
        total += result_hash[key]
      end
    end
    name_index += 1 
  end

  total
end


