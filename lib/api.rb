require_relative "character"
require 'rest-client' #allows me to open the URL
require 'json'
require 'pry'

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
    character.films = char_hash[:height]
    character.species = char_hash[:species]
    character.gender = char_hash[:gender]
    character.age = char_hash[:age]
    character.hair_color = char_hash[:hair_color]
end


end
