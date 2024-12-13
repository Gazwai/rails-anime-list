class Anime < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :mal_id, presence: true, uniqueness: true
end
