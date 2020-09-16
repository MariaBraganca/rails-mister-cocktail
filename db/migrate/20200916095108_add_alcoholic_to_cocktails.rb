class AddAlcoholicToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :alcoholic, :string
  end
end
