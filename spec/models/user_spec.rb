require 'rails_helper'

describe User do
  describe 'ユーザー登録機能' do
    context '登録できる場合' do
      it 'name、email，password、password_confirmationがあれば登録できる' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end

      it 'nameが20文字以下だと登録できる' do
        num = 'n' * 20
        user = FactoryBot.build(:user, name: num)
        expect(user).to be_valid
      end

      it 'passwordが6文字以上だと登録できる' do
        num = 'n' * 6
        user = FactoryBot.build(:user, password: num, password_confirmation: num)
        expect(user).to be_valid
      end
    end

    context '登録できない場合' do
      it 'nameが21文字以上だと登録できない' do
        num = 'n' * 21
        user = FactoryBot.build(:user, name: num)
        user.valid?
        expect(user.errors[:name]).to include('は20文字以内で入力してください')
      end

      it 'emailがなければ登録できない' do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'passwordがなければ登録できない' do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it 'passwordとpassword_confirmationが違うと登録できない' do
        user = FactoryBot.build(:user, password_confirmation: '')
        user.valid?
        expect(
          user.errors[:password_confirmation]
        ).to include('とパスワードの入力が一致しません')
      end
      
      it 'passwordが5文字以下だと登録できない' do
        num = 'n' * 5
        user = FactoryBot.build(:user, password: num, password_confirmation: num)
        user.valid?
        expect(user.errors[:password]).to include('は6文字以上で入力してください')
      end
    end
  end
end
