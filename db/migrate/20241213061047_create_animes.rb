class CreateAnimes < ActiveRecord::Migration[8.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :overview
      t.string :image_url
      t.integer :rating
      t.integer :mal_id

      t.timestamps
    end
  end
end
