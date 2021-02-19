class AddUrlToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :url, :string
  end
end
