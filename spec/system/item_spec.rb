require 'rails_helper'
RSpec.describe '投稿管理機能', type: :system do
  describe '投稿一覧画面' do
    before do
      @user = FactoryBot.create(:admin)
      @item = FactoryBot.create(:item, user: @user)
      @item2 = FactoryBot.create(:item2, user: @user)
      visit new_user_session_path
      fill_in "Eメール", with: "admin@example.com"
      fill_in "パスワード", with: "111111"
      click_button 'ログインする'
    end
    context '投稿を作成した場合' do
      it '作成済みの投稿が表示される' do
        visit items_path
        expect(page).to have_content 'コート'
      end
    end

    context '募集終了した場合' do
      it '募集終了の文字が表示される' do
        visit items_path
        expect(page).to have_content 'Found'
      end
    end

    context '検索をした場合' do
      it "品名検索ができる" do
        visit items_path
        fill_in 'q[name_or_description_cont]', with: 'セーター'
        click_button '検索'
        expect(page).to have_content 'セーター'
      end

      it "説明検索ができる" do
        visit items_path
        fill_in 'q[name_or_description_cont]', with: '去年'
        click_button '検索'
        expect(page).to have_content '去年'
      end

      it "ステータス検索ができる" do
        visit items_path
        check '募集中のみ表示'
        click_button '検索'
        sleep 0.6
        expect(page).to have_content 'セーター'
      end

      it "品名とステータスの両方が検索できる" do
        visit items_path
        fill_in 'q[name_or_description_cont]', with: 'セーター'
        check '募集中のみ表示'
        click_button '検索'
        expect(page).to have_content 'セーター'
        expect(page).to have_content '募集中'
      end

      it "説明とステータスの両方が検索できる" do
        visit items_path
        fill_in 'q[name_or_description_cont]', with: '去年'
        check '募集中のみ表示'
        click_button '検索'
        expect(page).to have_content '去年'
        expect(page).to have_content '募集中'
      end

      it "金額で絞り込みができる" do
        visit items_path
        fill_in 'q[budget_gteq]', with: '8000'
        click_button '検索する'
        expect(page).to have_content 'コート'
      end

      it "カテゴリーで検索ができる" do
        visit items_path
        select 'レディース', from: 'q[category_eq]'
        click_button '検索する'
        expect(page).to have_content 'セーター'
      end

      it "金額とカテゴリーで絞り込みができる" do
        visit items_path
        fill_in 'q[budget_gteq]', with: '3000'
        select 'レディース', from: 'q[category_eq]'
        click_button '検索する'
        expect(page).to have_content 'セーター'
      end
    end
  end
end
