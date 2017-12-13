class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :group_users
  has_many :group_users

  validates :name, presence: true

  def group_new_message
    if messages.present?
      if messages.last.body.present?
        messages.last.body
      else
        "画像が送信されました"
      end
    else
      "メッセージはありません"
    end
  end

end
