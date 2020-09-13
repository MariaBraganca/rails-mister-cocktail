class AddThumbUrlToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :thumb_url, :string
  end
end
