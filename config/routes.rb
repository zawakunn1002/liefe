Rails.application.routes.draw do

# For details on the DSL available within this file, see http
   #deviseの設定
  devise_for :users

 	#home_controllerのルーティング
  root 'home#top'

  get '/home/about' => 'home#about', as: 'about'

  #usera_controllerのルーティング
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  #stories_controller,favorites_controller.story_comments_controllerのルーティング
  resources :stories do
  	resource :favorites, only: [:create, :destroy]
  	resource :story_comments, only: [:create, :destroy]
  end

end

#ルーティング一覧
=begin
new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
                     root GET    /                                                                                        home#top
                    about GET    /home/about(.:format)                                                                    home#about
                    users GET    /users(.:format)                                                                         users#index
                edit_user GET    /users/:id/edit(.:format)                                                                users#edit
                     user GET    /users/:id(.:format)                                                                     users#show
                          PATCH  /users/:id(.:format)                                                                     users#update
                          PUT    /users/:id(.:format)                                                                     users#update
                          DELETE /users/:id(.:format)                                                                     users#destroy
          story_favorites DELETE /stories/:story_id/favorites(.:format)                                                   favorites#destroy
                          POST   /stories/:story_id/favorites(.:format)                                                   favorites#create
     story_story_comments DELETE /stories/:story_id/story_comments(.:format)                                              story_comments#destroy
                          POST   /stories/:story_id/story_comments(.:format)                                              story_comments#create
                  stories GET    /stories(.:format)                                                                       stories#index
                          POST   /stories(.:format)                                                                       stories#create
                new_story GET    /stories/new(.:format)                                                                   stories#new
               edit_story GET    /stories/:id/edit(.:format)                                                              stories#edit
                    story GET    /stories/:id(.:format)                                                                   stories#show
                          PATCH  /stories/:id(.:format)                                                                   stories#update
                          PUT    /stories/:id(.:format)                                                                   stories#update
                          DELETE /stories/:id(.:format)                                                                   stories#destroy
=end


