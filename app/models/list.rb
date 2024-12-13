class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :animes, through: :bookmarks, dependent: :destroy

  validates :name, uniqueness: {scope: :user_id}, presence: true
end
