Rails.application.routes.draw do
  get 'poly_comments/index'
  get 'tags/index'
  get 'discussion_topics/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "campaigns#index"
  resources :campaigns do
    resources :poly_comments
    resources :discussion_topics
  end

  resources :discussion_topics do
    resources :poly_comments
  end
  resources :tags
  
end
