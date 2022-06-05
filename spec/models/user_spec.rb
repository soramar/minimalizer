require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context '正常系' do
    it '条件を満たす場合、成功' do
      expect(@user).to be_valid
    end
  end

  context '異常系' do
    it 'nameが空の場合、失敗' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('nameを入力してください')
    end

    it 'nameが30文字以上の場合、失敗' do
      @user.name = 'a' * 31
      @user.valid?
      expect(@user.errors.full_messages).to include('nameは30文字以下です')
    end
    it 'emailが空の場合、失敗' do
      expect(@user.errors.full_messages).to include('')
    end
    it 'emailに重複がある場合、失敗' do
      expect(@user.errors.full_messages).to include('')
    end
    it 'passwordが空の場合、失敗' do
      expect(@user.errors.full_messages).to include('')
    end
    it 'passwordが6文字以下の場合、失敗' do
      expect(@user.errors.full_messages).to include('')
    end
    it 'passwordとpassword_confirmationが一致していない場合、失敗' do
      expect(@user.errors.full_messages).to include('')
    end
    it 'password_confirmationが空の場合、失敗' do
      expect(@user.errors.full_messages).to include('')
    end
  end
end
