Rails.application.routes.draw do
  root to:"homes#top"
  
scope module: :publics do
    
    devise_for :users
    
    resources :users, only: [:index,:show,:edit,:update] do
      get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
      patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    end
    
    resources :groups, only: [:new, :index,:show,:edit,:create,:destroy,:update] do
      get "join" => "groups#join"
      delete "all_destroy" => 'groups#all_destroy'
    end
    
    get 'chat/:id' => 'chats#show', as: 'chat'
    resources :chats, only: [:create]
    
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
