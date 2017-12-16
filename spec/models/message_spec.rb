require 'rails_helper'

describe "message" do
  describe "#create" do
    # ぜんぶあればメッセージつくれるよ
    it "is valid with a body, image, group_id, user_id" do
      message = build(:message)
      expect(message).to be_valid
    end
    # メッセージ本文あればいいよ
    it "is valid with a message that has body" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end
    # 画像あればいいよ
    it "is valid with a message that has image" do
      message = build(:message, body: "")
      expect(message).to be_valid
    end
    # メッセージも画像もないとだめ
    it "is invalid without a message that have body and image" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:emptymessage]).to include("を入力してください")
    end
    # グループidないとだめ
    it "is invalid without group_id" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end
    # ユーザーidないとだめ
    it "is invalid without user_id" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end
  end
end
