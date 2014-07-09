Rails.application.routes.draw do
 
  devise_for :users
  resources :users, only: [:show, :update]
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :favorites
    end
  end
  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  post :incoming, to: 'incoming#create'
end
