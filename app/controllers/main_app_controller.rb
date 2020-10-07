class MainAppController < ApplicationController
	def homepage
		# homepage after login.
		# Description
	    render :json => {
	    	"somekey":"someval",
	    	"somekey2":"someval2"
	    }

	end

	def menu
		# display interactive menu.
		# Order food

	end

	def gallery
		# acts as a blog page to show interactivity between customers as well as specialty foods galery.

	end

	def contact
		# Contact. Possibly through facebook API/ Whatsapp API/ phone or email for catering enquiries.
		
		
	end
end
