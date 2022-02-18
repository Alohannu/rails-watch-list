# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# puts movies["results"][3]["overview"]
# puts movies["results"][3]["vote_average"]
# puts movies["results"][3]["poster_path"]

require "open-uri"
require "json"
url= "http://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

puts "Destroying all movies..."
Movie.destroy_all

puts "Creating movies..."
  movies['results'][10..40].each do |movie|
    Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}", rating: movie["vote_average"].to_i)
  end

# require 'open-uri'
# require 'json'

# puts "Cleaning up database..."
# Movie.destroy_all
# puts "Database cleaned"

# url = "http://tmdb.lewagon.com/movie/top_rated"
# 5.times do |i|
#   puts "Importing movies from page #{i + 1}"
#   movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
#   puts movies
#   movies.each do |movie|
#     puts "Creating #{movie['title']}"
#     base_poster_url = "https://image.tmdb.org/t/p/original"
#     Movie.create(
#       title: movie['title'],
#       overview: movie['overview'],
#       poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
#       rating: movie['vote_average']
#     )
#   end
# end
# puts "Movies created"
