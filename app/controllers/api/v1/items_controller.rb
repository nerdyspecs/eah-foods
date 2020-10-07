class Api::V1::ItemsController < ApplicationController
	# before running the api, validate jwt token
	before_action :authenticate_request!

	def index
		# list all items
		@items = Item.all
		render json: {
		data: @items,
        messages: "This is from index",
      }, status: :ok
	end
end