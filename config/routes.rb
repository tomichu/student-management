Rails.application.routes.draw do
  namespace :staff do
    resources :record_students
  end

 	config = Rails.application.config.baukis

 	constraints host: config[:staff][:host] do
		namespace :staff, path: config[:staff][:path] do
			root'top#index'
			get 'login' => 'sessions#new', as: :login
			resource :session, only: [ :create, :destroy ]
			resource :account, except: [ :new, :create, :destroy ] do
				patch :confirm
			end
			resource :password, only: [ :show, :edit, :update ]
			resources :customers
			resources :programs do
				patch :entries, on: :member
			end
			resources :messages, only: [ :index, :show, :destroy ] do
				get :inbound, :outbound, :deleted, :count, on: :collection
				post :tag, on: :member
				delete :tag, on: :member
				resource :reply, only: [ :new, :create ] do
					post :confirm
				end
			end
			resources :tags, only: [] do
				resources :messages, only: [ :index ] do
					get :inbound, :outbound, :deleted, on: :collection
				end
			end
		end
 	end

 	constraints host: config[:admin][:host] do
		namespace :admin, path: config[:admin][:path] do
			root'top#index'
			get 'login' => 'sessions#new', as: :login
			resource :session, only: [ :create, :destroy ]
			resources :staff_members do
				resources :staff_events, only: [ :index ]
			end
			resources :staff_events, only: [ :index ]
			resources :allowed_sources, only: [ :index, :create ] do
				delete :delete, on: :collection
			end
		end
 	end
 	constraints host: config[:customer][:host] do
		namespace :customer, path: config[:customer][:path] do
			root'top#index'
			get 'login' => 'sessions#new', as: :login
			resource :session, only: [ :create, :destroy ]
			resource :account, except: [ :new, :create, :destroy ] do
				patch :confirm
			end
			resources :programs, only: [ :index, :show ] do
				resources :entries, only: [ :create ] do
					patch :cancel, on: :member
				end
			end
			resources :messages, except: [ :edit, :update ] do
				post :confirm, on: :collection
				resource :reply, only: [ :new, :create ] do
					post :confirm
				end
			end
		end
 	end

	root 'errors#not_found'
	get '*anything' => 'errors#not_found'


	
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
