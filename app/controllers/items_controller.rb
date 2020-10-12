class ItemsController < ApplicationController
	def home
		@item = Item.first
	end

	def new
		@item = Item.first
	end
	
	def update
		@item = Item.find params[:id]
		@item_image = ItemImage.new image_params
		# @item.update item_params
		@item_image.item = @item
		@item_image.save
	end

	protected
	def item_params
		params.require(:item).permit(:title,:description,:price)
	end

	def image_params
		params.require(:item).permit(:image)
	end
end