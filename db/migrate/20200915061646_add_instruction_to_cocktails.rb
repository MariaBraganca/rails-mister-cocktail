class AddInstructionToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :instruction, :text
  end
end
