Rails.application.routes.draw do
  resources :budget_requests
  resources :budget_categories
  #devise_for :admins
  resources :points do
    collection do
      get 'help/:first' => 'points#help'
    end
  end
  resources :point_categories
  resources :members

  root 'points#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
end
