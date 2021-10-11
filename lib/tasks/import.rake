require 'net/http'
require 'csv'

namespace :import do    
    desc "Import pokemons"    
    task pokemons: :environment do
        ounter = 0
        raw_url = "https://gist.githubusercontent.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6/raw/92200bc0a673d5ce2110aaad4544ed6c4010f687/pokemon.csv"    

        uri = URI(raw_url)
        web_contents = Net::HTTP.get(uri)
        web_contents.force_encoding("UTF-8")
        csv = CSV.parse(web_contents, col_sep: ',', :headers=>true)
        csv.each do |row|
            row[1].encode(:invalid => :replace, :undef => :replace, :replace => '')
            Pokemon.create!(name: row[1])
            #PokemonsController.create(json: {pokemon:{name: row[1]}}) 
            counter += 1
        end
        puts "Created #{counter} pokemon"
    end
end






