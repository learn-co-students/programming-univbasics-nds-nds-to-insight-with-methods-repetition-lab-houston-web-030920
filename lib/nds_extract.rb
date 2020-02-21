$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'

def gross_for_director(d)
  total = 0
  index = 0 #This is the index of the element of the :movie array.

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
 #This code adds up all the money made from each individual movie in the directors index and adds it to the total. This is for ONE DIRECTOR. This method will be placed into the next machine as we iterate thru all directors. 
  end

  total
  
end



def directors_totals(source)
  result = {} #We're making a hash of the total money each director has made. This will be called result. 
  
  director_index = 0
  while director_index < source.size do
    #This while will loop thru each director index in this entire array called source. 
    
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    # This creates the hash results that looks like this { directorOne => allTheMoneyTheyMade, ... }. Where the "gross_for_director" with director passed in (director being the name of the director as defined by the ealier variable) will give me the money. Equaling that to the hash will create the hash I want.
    
    director_index += 1
   #From here we loop it again. Adding in another name, and doing it all over again. 
  end
  result
  
end



def list_of_directors(source)
  director_name = []
  i = 0 
  while i < source.length do 
    director_name << source[i][:name]
    i += 1 
end
 director_name

end

def total_gross(source)
  total = 0 
  earnings = directors_totals(source)
  names = list_of_directors(source)
  
  counter = 0
  while counter < names.length do 
total += earnings[names[counter]]
  counter += 1
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end 
total   
end



