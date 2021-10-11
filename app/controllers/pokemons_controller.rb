class PokemonsController < ApplicationController
    POKEMON_PER_PAGE = 10
    
    before_action :set_pokemon, only: [:show, :update, :destroy] 
    def index         
        @page = params.fetch(:page,0).to_i
        @pokemons = Pokemon.offset(@page * POKEMON_PER_PAGE).limit(POKEMON_PER_PAGE)
        render json: @pokemons
    end
    def create 
      @pokemon = Pokemon.new(pokemon_params) 
      if @pokemon.save 
        render json: { success: true, pokemon_id: @pokemon.id } 
      else 
        render json: { success: false } 
      end 
    end 
    def update 
      if @pokemon.update(pokemon_params) 
        render json: { success: true } 
      else 
        render json: { success: false } 
      end 
    end 
    def show 
      render json: @pokemon 
    end 
    def destroy 
      if @pokemon.destroy 
        render json: { success: true } 
      else 
        render json: { success: false } 
      end 
    end 
    private 
    def set_pokemon 
      @pokemon = Pokemon.find(params[:id]) 
    end 
    def pokemon_params 
      params.require(:pokemon).permit(:name, 	
                                      :type_1, 	
                                      :type_2,
                                      :total,
                                      :hp, 	
                                      :attack, 	
                                      :defense, 	
                                      :sp_atk,	
                                      :sp_def,	
                                      :speed,	
                                      :generation,	
                                      :legendary) 
    end 
    
end

