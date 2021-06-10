require 'rails_helper'

describe DiariesController, type: :request do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe 'GET #index' do
    context 'ログインしていない場合' do
      it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
        get root_path
        expect(response.status).to eq 200
      end

      it 'indexアクションにリクエストするとレスポンスにログインするボタンが存在する' do 
        get root_path
        expect(response.body).to include('ログインする')
      end
    end     
  end
end
