require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context '正常系' do
    it '条件を満たす場合有効' do
      expect(user).to be_valid
    end
  end

  context '異常系' do
    it "nameが空の場合無効" do
      user.name = ""
      expect(user.valid?).to eq false
    end

    it 'nameが30文字以上の場合無効' do
      user.name = "a" * 31
      expect(user.valid?).to eq false
    end

    it 'emailが空の場合無効' do
      user.email = ""
      expect(user.valid?).to eq false
    end

    it 'emailに重複がある場合無効' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      expect(another_user.valid?).to eq false
    end

    it 'passwordが空の場合無効' do
      user.password = ""
      expect(user.valid?).to eq false
    end

    it 'passwordが6文字以下の場合無効' do
      user.password = "a" * 5
      expect(user.valid?).to eq false
    end

    it 'passwordとpassword_confirmationが一致していない場合無効' do
      user.password_confirmation = 'password00'
      expect(user.valid?).to eq false
    end

    it 'password_confirmationが空の場合無効' do
      user.password_confirmation = ""
      expect(user.valid?).to eq false
    end
  end
end