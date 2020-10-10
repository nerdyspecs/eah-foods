Rails.application.routes.draw do
  	root :to => 'main_app#homepage'
	get 'main_app/menu'
	get 'main_app/gallery'
	get 'main_app/contact'


	namespace :api, defaults: {format: :json} do 
		namespace :v1 do 
			devise_for :user
			devise_scope :user do
				post "sign_up", to: "registrations#create"
				post "sign_in", to: "sessions#create"
			end
			resources :user, only: [:show] do
				resources :stores, only:[:index, :show, :create, :update, :destroy] do 
					resources :items, only:[:index, :show, :create, :update, :destroy]
				end
			end
		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
