require 'rails_helper'
RSpec.describe '投稿管理機能', type: :system do
  describe '投稿一覧画面' do
    before do
      @user = create(:admin)
      @item = create(:item, user: @user)
      @item2 = create(:item2, user: @user)
      visit new_user_session_path
      fill_in "Eメール", with: "admin@example.com"
      fill_in "パスワード", with: "111111"
      click_button 'ログインする'
    end
    context '投稿を作成した場合' do
      it '作成済みの投稿が表示される' do
        visit items_path
        expect(page).to have_content 'セーター'
      end
    end

    context '複数の投稿を作成した場合' do
      it '投稿が作成日時の降順に並んでいる' do
        visit items_path
        item_list = all('.name')
        expect(item_list[0]).to have_content 'セーター1'
        expect(item_list[1]).to have_content 'セーター2'
      end
    end

    context '検索をした場合' do
      it "品名検索ができる" do
        visit items_path
        fill_in 'name', with: 'セーター'
        click_button '検索'
        expect(page).to have_content 'セーター'
      end

      it "説明検索ができる" do
        visit items_path
        fill_in 'description', with: '探しています'
        click_button '検索'
        expect(page).to have_content '探しています'
      end

      it "ステータス検索ができる" do
        visit items_path
        select '募集中', from: 'status'
        click_button '検索'
        expect(page).to have_content '募集中'
      end

      it "品名と説明の両方が検索できる" do
        visit items_path
        fill_in 'name', with: 'セーター'
        fill_in 'description', with: '探しています'
        click_button '検索'
        expect(page).to have_content 'セーター'
        expect(page).to have_content '探しています'
      end

      it "品名とステータスの両方が検索できる" do
        visit items_path
        fill_in 'name', with: 'セーター'
        select '募集中', from: 'status'
        click_button '検索'
        expect(page).to have_content 'セーター'
        expect(page).to have_content '募集中'
      end

      it "説明とステータスの両方が検索できる" do
        visit items_path
        fill_in 'description', with: '探しています'
        select '募集中', from: 'status'
        click_button '検索'
        expect(page).to have_content '探しています'
        expect(page).to to have_content '募集中'
      end

      it "金額で絞り込みができる" do
        visit items_path
        fill_in 'q[budget_gteq]', with 
        fill_in 'title', with: 'title'
        click_button '検索'
        expect(page).to have_content 'title'

      end
    end
  end
end
