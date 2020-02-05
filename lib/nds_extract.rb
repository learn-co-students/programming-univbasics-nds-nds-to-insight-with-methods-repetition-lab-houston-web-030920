$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'
require 'pry'
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
  list = []
  name_index = 0
  while name_index < source.length
  n_list = source[name_index][:name]
  list << n_list
  name_index += 1
  end
  return list
end

def total_gross(source)
  g_total = 0
  d_index = 0
    while d_index < directors_totals(source).length do
      g_total += directors_totals(source)[list_of_directors(source)[d_index]]
    d_index += 1
  end
  return g_total
end

# def total_gross(source)
#   g_total = directors_totals(source).values.sum
#   return g_total
# end
  
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return