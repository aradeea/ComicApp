class AddDescriptionToComics < ActiveRecord::Migration[5.0]
  def change
    add_column :comics, :description, :text
  end
end
