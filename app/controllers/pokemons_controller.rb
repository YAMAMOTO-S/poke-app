class PokemonsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @pokemons = Pokemon.all
  end
  

  def new
    return if params[:search].blank?
    raw_response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{params[:search]}"
    text_response = Faraday.get "https://pokeapi.co/api/v2/pokemon-species/#{params[:search]}/"

    if raw_response.status == 200
      # ポケモンがあったら
      response = JSON.parse(raw_response.body)
      textres = JSON.parse(text_response.body)

      @pokemon = Pokemon.new(order: response['id'], 
        name: response['name'], image_url: response["sprites"]["front_default"], 
          type1: response['types'][0]['type']['name'], type2: response['types'][1]['type']['name'],
            description: textres['flavor_text_entries'][1]['flavor_text'])

    else
      # なければ
      redirect_to new_pokemon_path, notice: "#{raw_response.status}エラー！"
    end
  end


  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to pokemons_path, notice: "You caught a #{@pokemon.name} !!"
    else
      render :new
    end
  end

  def destroy
    pokemon = Pokemon.find(params[:id])
    pokemon.destroy
  end
  


  
  private
  def pokemon_params
    params.require(:pokemon).permit(:order, :name, :image_url)
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  
end


