class AddType1ToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :type1, :string
  end
end
