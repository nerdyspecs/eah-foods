class ItemImagesController < ApplicationController
	def destroy
		itemImage = ItemImage.find itemImage_params[:id]
		itemImage.destroy
	end

	protected
	def itemImage_params
		params.permit(:id)
	end
end