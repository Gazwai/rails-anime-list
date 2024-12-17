require "open-uri"
require "json"

puts "Cleaning up database..."
List.destroy_all
Anime.destroy_all
puts "Database cleaned"

url = "https://api.jikan.moe/v4/top/anime?sfw"

100.times do |i|
  puts "Importing anime from page #{i + 1}"
  animes = JSON.parse(URI.open("#{url}&page=#{i + 1}").read)["data"]
  animes.each do |anime|
    puts "Creating #{anime["title"]}"
    Anime.create(
      image_url: anime["images"]["webp"]["large_image_url"],
      mal_id: anime["mal_id"],
      overview: anime["synopsis"],
      rating: anime["score"],
      ranking: anime["rank"],
      title: anime["title"],
    )
  end
end
puts "Animes created"
