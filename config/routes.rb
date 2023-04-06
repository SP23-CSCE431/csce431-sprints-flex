Rails.application.routes.draw do
  resources :budget_requests
  resources :budget_categories
  #devise_for :admins


  # This is the route that calls the delete_points function
  # delete 'points/delete_points', to: 'points#delete_points', as: 'delete_points'
  resources :points do
    collection do
      get 'delete_points'
    end
  end
  #   collection do
  #     get 'help/:first' => 'points#help'
  #   end
  # end
  resources :point_categories, path: 'admin/points/categories'
  resources :members, path: 'admin/members'
  resources :point_reviews, path: 'admin/points'
  resources :budget_reviews, path: 'admin/budget'

  put '/admin/points/:point_id/approve', to: 'point_reviews#approve', as: 'approve_point_review'
  put '/admin/points/:point_id/deny', to: 'point_reviews#deny', as: 'deny_point_review'

  get '/admin/budget/:budget_request_id/approve', to: 'budget_reviews#approve', as: 'approve_budget_review'
  get '/admin/budget/:budget_request_id/deny', to: 'budget_reviews#deny', as: 'deny_budget_review'


  get 'help/:first' => 'help#help'

  root 'points#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
end
