# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'
require 'open-uri'

# Movie.destroy_all

# api_url = "https://tmdb.lewagon.com/movie/top_rated"

# begin
#   response = URI.open(api_url).read
#   data = JSON.parse(response)
# rescue => e
#   puts "API failed #{e.message}"
#   exit
# end

# data['results'].first(200).each do |movie|
#   Movie.create_or_find_by!(title: movie['original_title']) do |m|
#     m.title = movie['original_title']
#     m.overview = movie['overview']
#     m.rating = movie['vote_average']
#     m.poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}" if movie['poster_path']
#   end
# end
5.times do |i|
  list = List.create!(name: "Watchlist #{i + 1}")

  # Get 5 unique random movie IDs from existing movies
  random_movie_ids = Movie.pluck(:id).sample(5)

  # Create bookmarks linking the list to these movies
  random_movie_ids.each do |movie_id|
    Bookmark.create!(list: list, movie_id: movie_id, comment: "Recommended!")
  end
end
