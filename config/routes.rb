Rails.application.routes.draw do
 
  resources :bookmarks

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
