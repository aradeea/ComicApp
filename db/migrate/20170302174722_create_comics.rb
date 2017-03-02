class CreateComics < ActiveRecord::Migration[5.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :year
      t.string :author
      t.string :publisher

      t.timestamps
    end
  end
end
