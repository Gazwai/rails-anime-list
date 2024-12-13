class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :animes, through: :bookmarks
end
