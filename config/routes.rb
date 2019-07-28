Rails.application.routes.draw do

# For details on the DSL available within this file, see http
   #deviseの設定
  devise_for :users

 	#home_controllerのルーティング
  root 'home#top'

  get '/home/about' => 'home#about', as: 'about'

  #users_controllerのルーティング
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  #stories_controller,favorites_controller.story_comments_controllerのルーティング
  resources :stories do
  	resource :favorites, only: [:create, :destroy]
  	resource :story_comments, only: [:create, :destroy]
  end

end



