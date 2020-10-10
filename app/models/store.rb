class Store < ApplicationRecord
	# Db Associations
	belongs_to :user
	has_many :items

	
	# Methods
	def address
	  address = ""
	  if !self.unit.empty?
	  	address += "#{self.unit}, "
	  end

	  if !self.street_address.empty?
	  	address += "#{self.street_address}, "
	  end

	  if !self.postal_code.empty?
	  	address += "#{self.postal_code}, "
	  end

	  if !self.city.empty?
	  	address += "#{self.city}, "

	  end

	  if !self.state.empty?
	  	address += "#{self.state}, "
	  end

	  if !self.country.empty?
	  	address += "#{self.country}"
	  end
	  return address 
	end
end
