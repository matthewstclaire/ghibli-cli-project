require_relative "character"
require 'rest-client' #allows me to open the URL
require 'json'
require 'pry'
require 'colorize'

class API

def self.scrape_characters
resp = RestClient.get("https://ghibliapi.herokuapp.com/people/")
ghibli_hash = JSON.parse(resp.body, symbolize_names:true)

ghibli_characters = ghibli_hash.collect do |person|
    Character.new(person)
    end
end

def self.scrape_details(character)
    resp = RestClient.get(character.url)
    char_hash = JSON.parse(resp.body, symbolize_names:true)

    character.gender = char_hash[:gender]
    character.age = char_hash[:age]
    character.hair_color = char_hash[:hair_color]

    character.films = char_hash[:films]
    self.character_films(character)
end

    def self.character_films(character)
        resp = RestClient.get(character.films[0])
        char_hash = JSON.parse(resp.body, symbolize_names:true)
        film = Films.new(char_hash[:title])
        film.director = char_hash[:director]
        film.description = char_hash[:description]
        CLI.display_films(film)
    end

end
