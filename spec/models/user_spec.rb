require 'rails_helper'
RSpec.describe User,"モデルに関するテスト", type: :model do
    describe '実際に保存してみる' do
        context "保存できる場合" do
          it "成功" do
            expect(build(:user)).to be_valid
          end
        end
        context "保存できない場合" do
          it "nameが空欄" do
            expect(build(:user, :no_name)).to_not be_valid
          end

          it "nameが１文以下" do
            expect(build(:user, :too_short_name)).to_not be_valid
          end

          it "nameが21文字以上" do
            expect(build(:user, :too_long_name)).to_not be_valid
          end

          it "emailが空欄の場合" do
            expect(build(:user, :no_email)).to_not be_valid
          end
        end
    end
end