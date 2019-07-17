require 'rails_helper'

RSpec.feature "Userに関するテスト", type: :feature do
	before do
    	@user1 = create(:user, :create_with_stories)
    	@user2 = create(:user, :create_with_stories)
    	@admin_user1 = create(:admin_user)
  	end
  	feature "ログインしていない状態で" do
	    feature "以下のページへアクセスした際のリダイレクト先の確認" do
	      it "userの一覧ページ" do
	        visit users_path
	        expect(page).to have_current_path new_user_session_path
	      end

	      it "userの編集ページ" do
	        visit edit_user_path(@user1)
	        expect(page).to have_current_path new_user_session_path
	      end
	    end
    end
    feature "小説を投稿したユーザーがログインした状態で" do
    	before do
      		login(@user1)
    	end
    	feature "以下のページへアクセスした際のリダイレクト先の確認"
    		it "userの一覧ページ" do
    			visit users_path
    			expect(page).to have_current_path stories_path
    		end

    		it "他のuserの編集ページ" do
    			visit edit_user_path(@user2)
    			expect(page).to have_current_path stories_path
    		end

    	feature "表示内容とリンクの確認" do
    		it "ユーザーの詳細画面の表示内容とリンクの確認" do
	    		visit user_path(@user1)
	    		expect(page).to have_content @user1.name
	    		expect(page).to have_content @user1.profile_image
	    		expect(page).to have_link "プロフィール編集", href: edit_user_path(@user1)
	    		expect(page).to_not have_link "ユーザー削除", href: user_path(@user1)
	    		expect(page).to have_link @user1.stories.first.title, href: story_path(@user1.stories.first)
	    		expect(page).to have_link "編集", href: edit_story_path(@user1.stories.first)
	    		expect(page).to have_link "削除", href: story_path(@user1.stories.first)
	    		visit user_path(@user2)
	    		expect(page).to_not have_link "プロフィール編集", href: edit_user_path(@user2)
	    		expect(page).to_not have_link "ユーザー削除", href: user_path(@user2)
	    		expect(page).to have_link @user2.stories.first.title, href: story_path(@user2.stories.first)
	    		expect(page).to_not have_link "編集", href: edit_story_path(@user2.stories.first)
	    		expect(page).to_not have_link "削除", href: story_path(@user2.stories.first)
	    	end
	    	it "ユーザーの編集画面の表示内容とリンクの確認" do
	    		visit edit_user_path(@user1)
	    		find_field('user_name').set('updated_name')
        		find_field('user_email').set('test@test.com')
        		# fill_in 'user_name', with: 'updated_name'
        		# fill_in 'user[email]', with:
        		find('input[type="file"]').set(File.dirname(__FILE__) + "/../" + 'files/profile.jpg')
        		find("input[name='commit']").click
        		expect(page).to have_current_path user_path(@user1)
        		expect(page).to have_content "updated_name"
        		expect(User.find(1).profile_image_id).to be_truthy
        	end
	    end
    end
    feature "管理者がログインした状態で" do
    	before do
    		login(@admin_user1)
    	end
    	feature "表示内容とリンクの確認" do
    		it "管理者ユーザーの詳細画面の表示内容とリンクの確認" do
    			visit user_path(@admin_user1)
    			expect(page).to have_link "ユーザー削除", href: user_path(@admin_user1)
    			visit user_path(@user2)
    			expect(page).to_not have_link "プロフィール編集", href: edit_user_path(@user2)
	    		expect(page).to have_link "ユーザー削除", href: user_path(@user2)
	    		expect(page).to have_link @user2.stories.first.title, href: story_path(@user2.stories.first)
	    		expect(page).to_not have_link "編集", href: edit_story_path(@user2.stories.first)
	    		expect(page).to_not have_link "削除", href: story_path(@user2.stories.first)
    		end
    		it "ユーザー一覧ページの表示内容とリンクの確認" do
    			visit users_path
    			expect(page).to have_content "ユーザー一覧"
    			expect(page).to have_content @user2.profile_image
    			expect(page).to have_link @user2.name, href: user_path(@user2)
    			expect(page).to have_link "ユーザー削除", href: user_path(@user2)
    		end
    	end
    end

end