require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '新規作成機能' do
    context 'ユーザを新規作成した場合' do
      it '作成したユーザが表示される' do
        visit new_user_registration_path
        fill_in "ユーザーネーム", with: 'user1'
        fill_in "Eメール", with: 'user_1@example.com'
        fill_in "パスワード", with: 'password1'
        fill_in "パスワード（確認用）", with: 'password1'
        click_button "アカウント登録"
        expect(page).to have_content '本人確認用のメールを送信しました'
      end
    end
    context 'ユーザがログインせず投稿を作成しようとした場合' do
      it 'ログイン画面に遷移する' do
        visit new_item_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'セッション機能' do
    before do
      @user = FactoryBot.create(:user)
      @user.skip_confirmation!
      @user.save!
      @admin = FactoryBot.create(:admin)
      @admin.skip_confirmation!
      @admin.save!
    end
    context 'ログインとログアウトができる' do
      it 'ログインができる' do
        visit new_user_session_path
        fill_in "Eメール", with: 'user_1@example.com'
        fill_in "パスワード", with: 'password1'
        click_on 'ログインする'
        expect(page).to have_content 'ログインしました'
      end

      it 'ログアウトができる' do
        visit new_user_session_path
        fill_in "Eメール", with: 'user_1@example.com'
        fill_in "パスワード", with: 'password1'
        click_on 'ログインする'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
    context '管理者は管理画面に遷移できる' do
      it '遷移できる' do
        visit new_user_session_path
        fill_in "Eメール", with: 'admin@example.com'
        fill_in "パスワード", with: 'passwordadmin'
        click_on 'ログインする'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
      end
    end
  end
  describe '編集機能' do
    before do
      @user = FactoryBot.create(:user)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in "Eメール", with: 'user_1@example.com'
      fill_in "パスワード", with: 'password1'
      click_on 'ログインする'
      visit user_path(@user.id)
      click_on 'プロフィールの編集'
    end
    context 'プロフィールの変更' do
      it 'プロフィールの編集ができる' do
        fill_in "user[introduction]", with: 'メルカリ使っています'
        click_on '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
    end
    context 'パスワードとアドレスの変更' do
      it 'パスワードとアドレスの編集ができる' do
        fill_in "Eメール", with: 'user_user_1@example.com'
        fill_in "パスワード", with: 'password11'
        fill_in "パスワード（確認用）", with: 'password11'
        fill_in "現在のパスワード", with: 'password1'
        click_on '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
    end
  end
end
