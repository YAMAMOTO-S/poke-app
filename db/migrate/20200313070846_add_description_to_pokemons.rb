class AddDescriptionToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :description, :string
  end
end
