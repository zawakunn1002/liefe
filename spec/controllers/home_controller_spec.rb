 require 'rails_helper'
 RSpec.describe HomeController, type: :controller do
 	describe 'トップページ' do
 	 	context "トップページが正しく表示される" do
 	 		before do
           		get :top
         	end
         	it 'リクエストは200 OKとなること' do
           		expect(response.status).to eq 200
        		end
        	end
     end
     describe 'liefeとはページ' do
     	context "aboutページが正しく表示される" do
     		before do
     			get :about
     		end
     		it 'リクエストは200 OKとなること' do
     			expect(response.status).to eq 200
     		end
     	end
     end
 end
