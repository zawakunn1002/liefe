 require 'rails_helper'
 RSpec.describe Story, "モデルに関するテスト", type: :model do
    describe '実際に保存してみる' do
        context "保存できる場合" do
            it "user_idを入れて保存" do
                user = create(:user)
                p user
                expect(build(:story, user_id: user.id)).to be_valid
            end
        end
        context "保存できない場合" do
            it "user_idを保存していない" do
            expect(build(:story)).to_not be_valid
            end
            it "titleが空欄" do
                expect(build(:story, :no_title)).to_not be_valid
            end
            it "short_storyが空欄" do
                expect(build(:story, :no_short_story)).to_not be_valid
            end
            it "categoryが空欄" do
                expect(build(:story, :no_category)).to_not be_valid
            end
            it "titleが51文字以上" do
                expect(build(:story, :too_long_title)).to_not be_valid
            end
            it "short_storyが1201文字以上" do
                expect(build(:story, :too_long_short_story)).to_not be_valid
            end
        end
    end
 end