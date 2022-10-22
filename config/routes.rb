Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stories
  root "pages#index"

  #首頁文章的連結 /@kevingu/文章-123
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  #他人看作者的所有文章列表
  get '@:username', to: 'pages#user', as: 'user_page'

end
