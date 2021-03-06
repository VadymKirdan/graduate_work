Rails.application.routes.draw do
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  get 'my_reports' => "reports#my_reports"
  get 'my_salary' => "salaries#my_salary"

  post 'active_projects' => "projects#active_projects"
  post 'unactive_projects' => "projects#unactive_projects"

  get 'active_projects' => "projects#active_projects"
  get 'unactive_projects' => "projects#unactive_projects"

  post 'make_active' => "projects#make_active"
  post 'make_unactive' => "projects#make_unactive"

  post 'down_rank' => "users#down_rank"
  post 'up_rank' => "users#up_rank"

  post 'current_balance' => "salaries#index"
  post 'total_balance' => "salaries#total_balance"

  post 'make_admin' => "users#make_admin"
  post 'make_user' => "users#back_to_user"

  get 'show_week' => "users#show_week"
  get 'show_month' => "users#show_month"
  get 'show_year' => "users#show_year"

  post 'submit_salary' => "salaries#submit_salary"

  resources :projects

  resources :reports
  resources :salaries

  get 'users', to: 'users#index'

  root 'projects#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
