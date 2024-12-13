class AddUniqueIndexToAnimesMalId < ActiveRecord::Migration[8.0]
  def change
    add_index :animes, :mal_id, unique: true
  end
end
