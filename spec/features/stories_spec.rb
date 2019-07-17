require 'rails_helper'

RSpec.feature "Storiesに関するテスト", type: :feature do
	before do
    	@user1 = create(:user, :create_with_stories)
    	@user2 = create(:user, :create_with_stories)
    	@admin_user1 = create(:admin_user)
  	end
  	feature "ログインしていない状態で" do
	    feature "以下のページへアクセスした際のリダイレクト先の確認" do
	      it "小説の新規投稿ページ" do
	        visit new_story_path
	        expect(page).to have_current_path new_user_session_path
	      end

	      it "小説の編集ページ" do
	        visit edit_story_path(@user1.stories.first)
	        expect(page).to have_current_path new_user_session_path
	      end
	    end
    end
    feature "小説を投稿したユーザーがログインした状態で" do
    	before do
      		login(@user1)
    	end
    	feature "以下のページへアクセスした際のリダイレクト先の確認" do

    		it "他のuserが投稿した小説の編集ページ" do
    			visit edit_story_path(@user2.stories.first)
    			expect(page).to have_current_path stories_path
    		end
    	end

    	feature "表示内容とリンクの確認" do
    		it "小説の一覧ページの表示内容とリンクの確認" do
    			visit stories_path
    			expect(page).to have_content "小説一覧"
    			expect(page).to have_content "人気小説"
    			expect(page).to have_link "全小説一覧表示", href: stories_path
    			expect(page).to have_link @user2.name, href: user_path(@user2)
    			expect(page).to have_link @user2.stories.first.title, href: story_path(@user2.stories.first)
    		end
    		it "小説の詳細画面の表示内容とリンクの確認" do
    			visit story_path(@user1.stories.first)
    			expect(page).to have_content @user1.stories.first.title
    			expect(page).to have_link @user1.name, href: user_path(@user1)
    			expect(page).to have_content @user1.stories.first.short_story
    			expect(page).to have_content @user1.stories.first.created_at.strftime("%Y")
    			expect(page).to have_content @user1.stories.first.created_at.strftime("%m")
    			expect(page).to have_content @user1.stories.first.created_at.strftime("%d")
    			expect(page).to have_link "小説編集画面へ移動", href: edit_story_path(@user1.stories.first)
    			expect(page).to_not have_link "小説削除",href: story_path(@user1.stories.first)
    			expect(page).to have_link "小説一覧へ戻る",href: stories_path
    			find_field('story_comment_comment').set('素晴らしい')
    			find("input[name='commit']").click
    			expect(page).to have_content "素晴らしい"
    			visit story_path(@user2.stories.first)
    			expect(page).to_not have_link "小説編集画面へ移動", href: edit_story_path(@user1.stories.first)
    			expect(page).to_not have_link "小説削除", href: story_path(@user1.stories.first)
    		end
    		it "小説の新規投稿画面の表示内容とリンクの確認" do
    			visit new_story_path
    			expect(page).to have_content "投稿画面"
    			find_field('story_title').set('こんにちは谷田さん')
    			find_field('story_category').set('恋愛')
    			find('#story_cover_image').set(File.dirname(__FILE__) + "/../" + 'files/profile.jpg')
    			find('#story_spine_cover_image').set(File.dirname(__FILE__) + "/../" + 'files/profile.jpg')
    			find('#textArea').set('aaaaaaaaaaaaaaaaaaaa')
    			expect(page).to have_content "注意点"
    			find("input[name='commit']").click
    			#expect(page).to have_current_path user_path(@user1)
    			#expect(page).to have_content "こんにちは谷田さん"
    		end
    		it "小説の編集画面の表示内容とリンクの確認" do
    			visit edit_story_path(@user1.stories.first)
    			expect(page).to have_content "編集画面です"
    			find_field('story_title').set('キタニタツヤ')
    			find_field('story_category').set('その他')
    			find('#story_cover_image').set(File.dirname(__FILE__) + "/../" + 'files/profile.jpg')
    			find('#story_spine_cover_image').set(File.dirname(__FILE__) + "/../" + 'files/profile.jpg')
    			find('#textArea').set('aaaaaaaaaaaaaaaaaaaa')
    			expect(page).to have_content"注意点"
    		end
    	end
    end

    feature "管理者がログインしている場合" do
    	before do
      		login(@admin_user1)
    	end
    	feature "以下のページへアクセスした際のリダイレクト先の確認" do

    		it "他のuserが投稿した小説の編集ページ" do
    			visit edit_story_path(@user2.stories.first)
    			expect(page).to have_current_path stories_path
    		end
    	end
    	feature "表示内容とリンクの確認" do
    		it "小説の詳細画面の表示内容とリンクの確認" do
    			visit story_path(@user1.stories.first)
    			expect(page).to have_content @user1.stories.first.title
    			expect(page).to have_link @user1.name, href: user_path(@user1)
    			expect(page).to have_content @user1.stories.first.short_story
    			expect(page).to have_content @user1.stories.first.created_at.strftime("%Y")
    			expect(page).to have_content @user1.stories.first.created_at.strftime("%m")
    			expect(page).to have_content @user1.stories.first.created_at.strftime("%d")
    			expect(page).to_not have_link "小説編集画面へ移動", href: edit_story_path(@user1.stories.first)
    			expect(page).to have_link "小説削除",href: story_path(@user1.stories.first)
    			expect(page).to have_link "小説一覧へ戻る",href: stories_path
    			find_field('story_comment_comment').set('素晴らしい')
    			find("input[name='commit']").click
    			expect(page).to have_content "素晴らしい"
    		end
    	end
	end
end