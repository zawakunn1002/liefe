require 'rails_helper'

RSpec.feature "Homeページ、サインアップ、ログイン、ログアウトに関するテスト", type: :feature do
  before do
    @user = create(:user, :create_with_stories)
    @admin_user = create(:admin_user)
  end

   feature "サインアップの確認" do
    before do
      visit new_user_registration_path
      find_field('user[name]').set("name_abc")
      find_field('user[email]').set("aaaaa@bbbbb")
      find_field('user[password]').set("pppppp")
      find_field('user[password_confirmation]').set("pppppp")
    end

    it "正しくサインアップできているか" do
      expect {
        find("input[name='commit']").click
      }.to change(User, :count).by(1)
    end
    it "リダイレクト先は正しいか" do
      find("input[name='commit']").click
      expect(page).to have_current_path user_path(User.last)
    end
    it "サクセスメッセージは正しく表示されるか" do
      find("input[name='commit']").click
      expect(page).to have_content "liefe"
    end

   end

   feature "有効でない内容でのサインアップの確認" do
    before do
      visit new_user_registration_path
      find_field('user[name]').set(nil)
      find_field('user[email]').set("bb@bb")
      find_field('user[password]').set("pppppp")
      find_field('user[password_confirmation]').set("pppppp")
      find("input[name='commit']").click
    end
    it "リダイレクト先は正しいか" do
      expect(page).to have_current_path users_path
    end
    it "エラーメッセージは正しく表示されるか" do
      expect(page).to have_content "会員登録"
    end
   end


   feature "ログインの確認" do
    before do
      visit new_user_session_path
      find_field('user[name]').set(@user.name)
      find_field('user[password]').set(@user.password)
      find("input[name='commit']").click
    end
    it "正しくログインして、リダイレクトされているか" do
      expect(page).to have_current_path user_path(@user)
    end
    it "サクセスメッセージは正しく表示されるか" do
      expect(page).to have_content "liefe"
    end

   end

   feature "有効でない内容でのログインの確認" do
    before do
      visit new_user_session_path
      find_field('user[name]').set(nil)
      find_field('user[password]').set(nil)
      find("input[name='commit']").click
    end
    it "リダイレクト先は正しいか" do
      expect(page).to have_current_path new_user_session_path
    end
   end

   feature "ログアウトの確認" do
    before do
    	login(@user)
      	visit user_path(@user)
      	click_on "ログアウト"
    end
    it "正しくログアウトして、リダイレクトされているか" do
      expect(page).to have_current_path "/"
    end
    it "サクセスメッセージは正しく表示されるか" do
      expect(page).to have_content ""
    end
  end

  feature "ヘッダーのリンクの確認" do
    it "ログイン時" do
      login(@user)
      visit root_path
      expect(page).to have_link "マイページ", href: user_path(@user)
      expect(page).to have_link "投稿する", href: new_story_path
      expect(page).to have_link "小説一覧", href: stories_path
      expect(page).to have_link "ログアウト", href: destroy_user_session_path
    end
    it "ログアウト時" do
      visit root_path
      expect(page).to have_link "トップページ", href: root_path
      expect(page).to have_link "初めての方へ", href: "/home/about"
      expect(page).to have_link "小説一覧", href: stories_path
      expect(page).to have_link "会員登録", href: new_user_registration_path
      expect(page).to have_link "ログイン", href: new_user_session_path
    end
    it "管理者ログイン時" do
      login(@admin_user)
      visit root_path
      expect(page).to have_link "マイページ", href: user_path(@admin_user)
      expect(page).to have_link "ユーザー一覧", href: users_path
      expect(page).to have_link "投稿する", href: new_story_path
      expect(page).to have_link "小説一覧", href: stories_path
      expect(page).to have_link "ログアウト", href: destroy_user_session_path
    end

  end

end