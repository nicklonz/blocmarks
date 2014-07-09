Rails.application.routes.draw do
 
  resources :bookmarks

  post :incoming, to: 'incoming#create'

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
