Rails.application.routes.draw do

  # TODO: Fix up routes once we have authentication/authorization

  resources :teachers
  resources :students

  namespace :walkathon do
    resources :pledges, only: [:new, :create, :index] do
      resources :payments, only: [:new, :create, :index]
    end
  end


  # Disable import until we have proper authentication
  post 'students/import' => 'students#import', as: :import if Rails.env == 'development'
  get 'student_search' => 'students#search', as: :student_search

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'walkathon/pledges#new'
  get 'walkathon/payments' => 'walkathon/payments#index'
  get 'walkathon/thankyou' => 'walkathon/pledges#thankyou', as: :thankyou
  post 'walkathon/record_laps' => 'walkathon/pledges#record_laps', as: :record_laps
  get 'walkathon/record_laps' => 'walkathon/pledges#show_record_laps', as: :show_record_laps
  get 'walkathon/pledge_summary' => 'walkathon/pledges#summary', as: :pledge_summary

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
