Rails.application.routes.draw do
  devise_for :users
  	root :to => 'main_app#homepage'
	get 'main_app/menu'
	get 'main_app/gallery'
	get 'main_app/contact'


	namespace :api, defaults: {format: :json} do 
		namespace :v1 do
			devise_scope :user do
				post "sign_up", to: "registrations#create"
				post "sign_in", to: "sessions#create"
			end
			post "auth_user" => 'authentication#authenticate_user'

			resources :items

		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
