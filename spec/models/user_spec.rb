require 'rails_helper'
RSpec.describe User, type: :model do

    context "データが正しく保存される" do
        before do
            @user = User.new
            @user.name = "田中"
            @user.email = "aaa@aaa"
            @user.password = "qqqqqq"
            @user.save
        end
        it "全て入力してあるので保存される" do
            expect(@user).to be_valid
        end
    end
    context "データが正しく保存されない" do
        before do
            @user = User.new
            @user.name = ""
            @user.email = "aaa@aaa"
            @user.password = "qqqqqq"
            @user.save
        end
        it "nameが入力されていないので保存されない" do
            expect(@user).to be_invalid
        end
        before do
            @user = User.new
            @user.name = "あああああああああああああああああああああああああああああああ"
            @user.email = "aaa@aaa"
            @user.password = "qqqqqq"
            @user.save
        end
        it "nameが20文字を超えているので保存されない" do
            expect(@user).to be_invalid
        end
        before do
            @user = User.new
            @user.name = "田中"
            @user.email = ""
            @user.password = "qqqqqq"
            @user.save
        end
        it "Emailが入力されていないので保存されない" do
            expect(@user).to be_invalid
        end
    end
end