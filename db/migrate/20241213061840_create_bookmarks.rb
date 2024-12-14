class CreateBookmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.references :list, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true

      t.timestamps
    end

    add_index :bookmarks, [ :list_id, :anime_id ], unique: true
  end
end
