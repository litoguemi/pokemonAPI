require "rails_helper"

describe "Pokemons API", type: :request do
    before do
        FactoryBot.create(:pokemon, name: 'Celebi 2000')
        FactoryBot.create(:pokemon, name: 'Celebi 2001')
        FactoryBot.create(:pokemon, name: 'Celebi 2002')
    end

    describe 'GET /pokemons' do
        it 'returns pokemons in page 0' do            
            get '/pokemons'
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(3)
        end         
    end

    describe 'GET /pokemons/:id' do
        it 'show a Pokemon' do
            get '/pokemons/2'
            expect(response).to have_http_status(:success) 
        end          
    end

    describe 'POST /pokemons' do
        it 'creates a new Pokemon' do
            expect {
                post '/pokemons', params:{ pokemon: {name: 'Celebi Jr'}}
            }.to change { Pokemon.count }.from(3).to(4)     
            
            expect(response).to have_http_status(:success)    
        end          
    end

    describe 'PATCH /pokemons' do
        let!( :pokemon ) {FactoryBot.create(:pokemon, name: 'Celebi 2010')}

        it 'updates a Pokemon' do
            patch '/pokemons/2', params:{ pokemon: {name: 'Celebi Jr'}}
            expect(response).to have_http_status(:success)    
        end          
    end

    describe 'DELETE /pokemons/:id' do
        let!( :pokemon ) {FactoryBot.create(:pokemon, name: 'Celebi 2003')}
        it 'deletes a Pokemon' do            
           expect {
                delete "/pokemons/#{pokemon.id}"
            }.to change { Pokemon.count }.from(4).to(3)                        
           expect(response).to have_http_status(:success)    
        end          
    end
    
end