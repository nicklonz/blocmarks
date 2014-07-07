Rails.application.routes.draw do
  get 'bookmarks/index'

  get 'bookmarks/new'

  get 'bookmarks/destroy'

  get 'topics/index'

  get 'topics/show'

  get 'topics/create'

  get 'topics/new'

  get 'topics/destroy'

  get 'topics/edit'

  get 'topics/update'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'
end
