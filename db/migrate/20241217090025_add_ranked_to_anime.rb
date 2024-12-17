class AddRankedToAnime < ActiveRecord::Migration[8.0]
  def change
    add_column :animes, :ranking, :integer
  end
end
