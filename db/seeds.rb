require "open-uri"
require "json"

puts "Cleaning up database..."
List.destroy_all
Anime.destroy_all
puts "Database cleaned"

top_anime_url = "https://api.jikan.moe/v4/top/anime?sfw"

100.times do |i|
  puts "Importing top anime from page #{i + 1}"
  animes = JSON.parse(URI.open("#{top_anime_url}&page=#{i + 1}").read)["data"]
  animes.each do |anime|
    puts "Creating #{anime["title"]}"

    Anime.create(
      image_url: anime["images"]["webp"]["large_image_url"],
      airing: anime["airing"],
      mal_id: anime["mal_id"],
      overview: anime["synopsis"],
      rating: anime["score"],
      ranking: anime["rank"],
      title: anime["title"],
      )
  end
end

puts "Top Animes created"

current_season_url = "https://api.jikan.moe/v4/seasons/now?sfw"

last_page = JSON.parse(URI.open("#{current_season_url}&page=1").read)["pagination"]["last_visible_page"]

last_page.times do |i|
  puts "Importing currently airing anime from page #{i + 1}"
  animes = JSON.parse(URI.open("#{current_season_url}&page=#{i + 1}").read)["data"]
  animes.each do |anime|
    unless Anime.find_by mal_id: anime["mal_id"]
      puts "Creating #{anime["title"]}"

      Anime.create(
        image_url: anime["images"]["webp"]["large_image_url"],
        airing: anime["airing"],
        mal_id: anime["mal_id"],
        overview: anime["synopsis"],
        rating: anime["score"],
        ranking: anime["rank"],
        title: anime["title"],
        )
    end
  end
end

puts "Currently Airing Animes created"
