class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :emptymessage, presence: true

  def emptymessage
    body.presence || image.presence
  end

class << self
  def times_set(message)
    message.created_at.strftime("%Y/%m/%d %H:%M")
  end
end

  mount_uploader :image, ImageUploader

end
