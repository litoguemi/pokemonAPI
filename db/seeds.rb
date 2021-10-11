# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'csv'

Pokemon.destroy_all

counter = 0
raw_url = "https://gist.githubusercontent.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6/raw/92200bc0a673d5ce2110aaad4544ed6c4010f687/pokemon.csv"    

uri = URI(raw_url)
web_contents = Net::HTTP.get(uri)
web_contents.force_encoding("UTF-8")
csv = CSV.parse(web_contents, col_sep: ',', :headers=>true)
csv.each do |row|
    row[1].encode(:invalid => :replace, :undef => :replace, :replace => '')
    Pokemon.create!(name:   row[1], 	
                    type_1: row[2], 	
                    type_2:	row[3],
                    total:  row[4],
                    hp:     row[5], 	
                    attack: row[6], 	
                    defense:row[7], 	
                    sp_atk: row[8],	
                    sp_def: row[9],	
                    speed:  row[10],	
                    generation: row[11],	
                    legendary:  row[12])    
    counter += 1
end
puts "Created #{counter} pokemon"
    