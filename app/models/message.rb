class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :emptymessage, presence: true

  def emptymessage
    body.presence || image.presence
  end

  mount_uploader :image, ImageUploader

end
