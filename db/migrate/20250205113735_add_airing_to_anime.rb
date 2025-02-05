class AddAiringToAnime < ActiveRecord::Migration[8.0]
  def change
    add_column :animes, :airing, :boolean
  end
end
