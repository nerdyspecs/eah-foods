class Api::V1::StoresController < ApplicationController
	# authenticate jwt. If JWT is valid, @current_user is the current logged user. Logic is in applciation_controller
	before_action :authenticate_request!
	before_action :validate_request_role, only:[:create, :update, :delete]
	before_action :get_store, only:[:update, :destroy, :show]

	# methods
	def index
		stores = Store.all
		render json:{
			data: stores
		}
	end

	# CRUD (Create, Read, Update, Design)
	def create
		store = Store.new store_params
		store.user = current_user
		if store.save
			render json:{
				success:"Store created",
				store: store
			}, status: :created
		else
			render json:{
				error:"Failed to create"
			}, status: :bad_request
		end
		
	end

	def show
		if !store.blank?
			render json:{
				success:"Showing individual store",
				store: store
			},status: :ok
		else
			render json:{
				error:"Store is blank."
			},status: :unauthorized
		end
	end

	def update
		if store.update store_params
			render json:{
				success:"Store Updated",
				store: store
			}, status: :ok
		else
			render json:{
				error:"Failed to update store"
			}, status: :bad_request
		end
	end

	def destroy
		if store.delete
			render json:{
				success:"Store Deleted",
				store: store
			}, status: :ok
		else
			render json:{
				error:"Failed to delete store"
			}, status: :bad_request
		end
	end

	private
	def store_params
		params.require(:store).permit(:organisation_name,:unit,:street_address,:postal_code,:city,:state,:country,:halal)
	end

	# Check to see if the user-logged is the same user as the user in the token
	def validate_request_role?
		if @current_user.id != params[:user_id].to_i
			render json:{
				error: "User id sent from params does not match token"
			},status: :unauthorized
		end
	end	

	def get_store
		store = Store.find_by_id(params[:id])
		if store.nil?
			render json:{message:"Store not found"},status: :bad_request
		end
	end
end