class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :anime

  validates :comment, length: { maximum: 300 }
  validates :anime_id, uniqueness: { scope: :list_id, message: "is already in the list" }

  after_update_commit :broadcast_message

  # -> { broadcast_replace_to "bookmark", partial: "lists/comment", locals: { bookmark: self }, target: self.id }

  private

  def broadcast_message
    broadcast_replace_to "bookmark#{list.id}_comments",
                          partial: "lists/comment",
                          locals: { bookmark: self },
                          target: self.id
  end
end
