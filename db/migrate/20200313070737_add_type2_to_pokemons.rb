class AddType2ToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :type2, :string
  end
end
