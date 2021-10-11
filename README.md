# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

The following scripts can be useful in order to excecute de app, remember that you can execute them being inside the folder of the project. Ex: C:\Projects\pokemonapi\

To starup this code:
    1. bundle install 
    2. rake db:migrate
    3. rspec -> to check the tests first
    4. rake db:seed -> fill data
    5. rails server -> execute the app

To test the app:
    1. List of pokemon paginated 
        GET -> http://127.0.0.1:3000/pokemons?page=0
    
    2. Show one pokemon: 
        GET -> http://127.0.0.1:3000/pokemons/1 -> check the ID

    3. Update a pokemon    
        PATCH -> http://127.0.0.1:3000/pokemons/1 -> check the ID

        body:
            {
                "pokemon":{                    
                    "name": "pikachu JR5",
                    "type_1": "fly",
                    "type_2": "dark",
                    "total": 120,
                    "hp": 150,
                    "attack": 200,
                    "defense": 100,
                    "sp_atk": 260,
                    "sp_def": 300,
                    "speed": 150,
                    "generation": 5,
                    "legendary": true
                }
            }
    4. Create a pokemon    
        POST -> http://127.0.0.1:3000/pokemons/

        body:
            {
                "pokemon":{                    
                    "name": "pikachu JR5",
                    "type_1": "fly",
                    "type_2": "dark",
                    "total": 120,
                    "hp": 150,
                    "attack": 200,
                    "defense": 100,
                    "sp_atk": 260,
                    "sp_def": 300,
                    "speed": 150,
                    "generation": 5,
                    "legendary": true
                }
            }   

    5. Delete a pokemon    
        DELETE -> http://127.0.0.1:3000/pokemons/1 -> check the ID    
                 
           
* Ruby version
 - Version used to deploy
        ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x64-mingw32]

* System dependencies
 - Install gem dependencies
        bundle
* Configuration
 - To fill default list of data
        rake db:seed
* Database creation
 - To create the scheme
        rake db:migrate

* Database initialization
 - To erase all databases in the app
        rails db:drop:_unsafe

 - For initialize test database
        rails db:migrate RAILS_ENV=test

* How to run the test suite
 - Run tests
    rpec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
 - Deploy app
    rails server
* ...
