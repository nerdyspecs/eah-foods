class Api::V1::ItemsController < ApplicationController
	# authenticate jwt. If JWT is valid, @current_user is the current logged user. Logic is in applciation_controller
	before_action :authenticate_request!
	before_action :validate_request_role, only:[:create, :update, :destroy]
	before_action :get_item, only:[:update, :destroy, :show]

	# List all items
	def index
		@items = Item.all
		render json: {
			messages: "This is from index",
			items: @items
      }, status: :ok
	end

	# CRUD (Create, Read, Update, Design)
	def create
		item = Item.new item_params
		byebug
		item.store = Store.find params[:store_id]
		if item.save
			render json:{
				success:"Item created",
				item: item
			}, status: :created
		else
			render json:{
				error:"Failed to create"
			}, status: :bad_request
		end
		
	end

	def show
		if !item.blank?
			render json:{
				success:"Showing individual item",
				item: item
			},status: :ok
		else
			render json:{
				error:"Failed to show."
			},status: :unauthorized
		end
	end

	def update
		if item.update item_params
			render json:{
				success:"Item updated",
				store: item
			}, status: :ok
		else
			render json:{
				error:"Failed to update item"
			}, status: :bad_request
		end
	end

	def destroy
		if item.delete
			render json:{
				success:"Item Deleted",
				store: item
			}, status: :ok
		else
			render json:{
				error:"Failed to delete item"
			}, status: :bad_request
		end
	end

	private
	def item_params
		params.require(:item).permit(:title,:description,:price)
	end

	# Check to see if the user-logged is the same user as the user in the token
	def validate_request_role?
		if @current_user.id != params[:user_id].to_i
			render json:{
				error: "User id sent from params does not match token"
			},status: :unauthorized
		end
	end	

	# Get item for show, update, destroy
	def get_item
		item = Item.find_by_id(params[:id])
		if item.nil?
			render json:{message:"Item not found"},status: :bad_request
		end
	end
end