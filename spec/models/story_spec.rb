require 'rails_helper'
RSpec.describe Story, type: :model do
	before do
        	@user = User.new
        	@user.name = "aa"
        	@user.email = "oooo@oooo"
        	@user.password = "qqqqqq"
        	@user.save!
            @story = Story.new
            @story.title = "田中さんの日常"
            @story.user_id = @user.id
            @story.short_story = "彼は言った。"
            @story.category = "恋愛"
            @story.save
        end
	describe 'アソシエーション' do
    	it "Userモデルに属している" do
      		expect(@story.user).to eq @user
    	end
  	end
	context "データが正しく保存される" do
        before do
        	@user = User.new
        	@user.name = "aa"
        	@user.email = "ooo@ooo"
        	@user.password = "qqqqqq"
        	@user.save!
            @story = Story.new
            @story.title = "田中さんの日常"
            @story.user_id = @user.id
            @story.short_story = "彼は言った。"
            @story.category = "恋愛"
            @story.save
        end
        it "全て入力してあるので保存される" do
            expect(@story).to be_valid
        end
    end
end