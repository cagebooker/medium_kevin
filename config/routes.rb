Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"

  resources :stories do
    resources :comments, only: [:create]
  end

  # api
  # follow /api/users/:id/follow
  namespace :api do
    post :upload_image, to: 'utils#upload_image'

    resources :users, only: [] do
      member do
        post :follow
      end
    end
    resources :stories, only: [] do
      member do
        post :clap
        post :bookmark
      end
    end
  end

  resources :users, only:[] do
    collection do
      get :pricing
      get :payment
      post :pay
    end
  end

  #首頁文章的連結 /@kevingu/文章-123
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  #他人看作者的所有文章列表
  get '@:username', to: 'pages#user', as: 'user_page'

end
