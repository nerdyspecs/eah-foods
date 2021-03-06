class User < ApplicationRecord
  	# Include default devise modules. Others available are: #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise 	:database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	# DbAssociations
	has_many :stores

	# Methods
	def name
		return self.first_name + " " + self.last_name
	end
end

