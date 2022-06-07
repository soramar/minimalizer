require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  context '正常系' do
    it '入力が正常な場合、有効' do
      visit '/users'
      fill_in 'name_id', with: 'testname'
      fill_in 'email_id', with: 'testuser01@i.jp'
      fill_in 'password_id', with: 'password'
      fill_in 'password_confirmation_id', with: 'password'
      click_on '登録'
      fill_in 'email_id', with: 'testuser01@i.jp'
      fill_in 'password_id', with: 'password'
      expect(current_path).to eq '/login'
    end
  end
  context '異常系' do
    it 'nameが空の場合無効' do
      visit '/users'
      fill_in 'name_id', with: ''
      fill_in 'email_id', with: 'testuser01@i.jp'
      fill_in 'password_id', with: 'password'
      fill_in 'password_confirmation_id', with: 'password'
      expect(page).to have_content 'ニックネームは必須項目です'
    end

    it 'emailが空の場合無効' do
      visit '/users'
      fill_in 'name_id', with: 'testname'
      fill_in 'email_id', with: ''
      fill_in 'password_id', with: 'password'
      fill_in 'password_confirmation_id', with: 'password'
      expect(page).to have_content 'メールアドレスは必須項目です'
    end

    it 'emailに重複がある場合無効' do

    end

    it 'passwordが空の場合無効' do
      visit '/users'
      fill_in 'name_id', with: 'testname'
      fill_in 'email_id', with: 'testuser01@i.jp'
      fill_in 'password_id', with: ''
      fill_in 'password_confirmation_id', with: 'password'
      expect(page).to have_content 'パスワードは必須項目です'
    end

    it 'password_confirmationが空の場合無効' do
      visit '/users'
      fill_in 'name_id', with: 'testname'
      fill_in 'email_id', with: 'testuser01@i.jp'
      fill_in 'password_id', with: 'password'
      fill_in 'password_confirmation_id', with: ''
      expect(page).to have_content 'パスワード確認は必須項目です'
    end

    it 'passwordとpassword_confirmationが一致していない場合無効' do
      visit '/users'
      fill_in 'name_id', with: 'testname'
      fill_in 'email_id', with: 'testuser01@i.jp'
      fill_in 'password_id', with: 'password'
      fill_in 'password_confirmation_id', with: 'password00'
      expect(page).to have_content 'パスワードが一致しません'
    end
  end
end
