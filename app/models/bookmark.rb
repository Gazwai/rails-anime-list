class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :anime

  validates :comment, length: {minimum:6}
  validates :anime_id, uniqueness: {scope: :list_id, message: "is already in the list"}
end
