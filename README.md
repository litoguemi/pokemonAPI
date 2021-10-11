# README

PokemonAPI is a project which implements basic CRUD operations using APIs. 
* Ruby version
    - Version used to deploy the app
        ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x64-mingw32]

> The following scripts can be useful in order to excecute de app, remember that you can execute them being inside the folder of the project. Ex: C:\Projects\pokemonapi\
## Starting up the code

1. bundle install 
2. rake db:migrate
3. rspec -> to check the tests first
4. rake db:seed -> fill data
5. rails server -> execute the app

## Testing the code
1. Paginated pokemon list
    ```sh
    GET -> http://127.0.0.1:3000/pokemons?page=0
    ```
2. Show one pokemon: 
    ```sh
    GET -> http://127.0.0.1:3000/pokemons/1 -> check the ID
    ```    
3. Update a pokemon    
    ```sh
    PATCH -> http://127.0.0.1:3000/pokemons/1 -> check the ID
    ``` 
    ```sh
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
    ```
4. Create a pokemon    
    ```sh
    POST -> http://127.0.0.1:3000/pokemons/
    ``` 
    ```sh
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
    ```    
5. Delete a pokemon 
    ```sh
    DELETE -> http://127.0.0.1:3000/pokemons/1 -> check the ID 
    ``` 

## Usefull comands

* System dependencies
    - Install gem dependencies
        ```sh
        bundle 
        ```     
* Configuration
    - To fill default list of data
        ```sh
        rake db:seed
        ```
* Database creation
    - To create the scheme
        ```sh
        rake db:migrate
        ```
* Database initialization
    - To erase all databases in the app
        ```sh
        rails db:drop:_unsafe
        ```

    - For initialize test database
        ```sh
        rails db:migrate RAILS_ENV=test
        ```

* How to run the test suite
    - Run tests
        ```sh
        rpec
        ```
* Deployment instructions
    - Deploy app
        ```sh
        rails server
        ```
