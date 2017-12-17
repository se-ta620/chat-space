require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  describe 'GET #index' do
    before do
      login_user user
      get :index, params: { group_id: group.id }
    end

    context "ログインしてる場合" do
      it "indexのビューが表示される" do
        expect(response).to render_template :index
      end

      it "ユーザーの所属するグループの情報をアクションに渡す" do
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it "ユーザーの所属するグループのみのメッセージ一覧が表示される" do
        messages = create_list(:message, 3, group_id: group.id, user_id: user.id)
        expect(assigns(:messages)).to match(messages)
      end
    end

    context "ログインしていない場合" do
      it "意図したビューにリダイレクトする" do
        redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end

    describe "入力された値が有効な場合" do
      it "入力された値が有効な場合データベースに保存できるかどうか" do
        expect{ post :create, params: { group_id: group.id, message: attributes_for(:message) } }.to change(Message, :count).by(1)
      end

      it "メッセージの保存に成功した場合、indexページに遷移されるかどうか" do
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end

    describe "入力された値が無効な場合" do
      it "入力された値が無効な場合データベースに保存されないようになっているかどうか" do
        expect{ post :create, params: { group_id: group.id, message: attributes_for(:message, body: "", image: "" ) } }.not_to change(Message, :count)
      end
      it "メッセージの保存に失敗した場合、再びindexページが呼び出されるかどうか" do
        post :create, params: { group_id: group.id, message: attributes_for(:message, body: "", image: "" ) }
        expect(response).to render_template :index
      end
    end
  end
end
