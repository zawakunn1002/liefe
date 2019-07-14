require 'rails_helper'

RSpec.feature "Storiesに関するテスト", type: :feature do
	before do
    	@user1 = create(:user, :create_with_stories)
    	@user2 = create(:user, :create_with_stories)
  	end
  	feature "ログインしていない状態で" do
	    feature "以下のページへアクセスした際のリダイレクト先の確認" do
	      it "storyの新規投稿ページ" do
	        visit new_story_path
	        expect(page).to have_current_path new_user_session_path
	      end

	      it "storyの編集ページ" do
	        visit edit_story_path(@user1.stories.first)
	        expect(page).to have_current_path new_user_session_path
	      end
	    end
    end
end