class AddPriceToComics < ActiveRecord::Migration[5.0]
  def change
    add_column :comics, :price, :float
  end
end
