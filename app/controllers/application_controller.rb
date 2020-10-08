class ApplicationController < ActionController::Base
	protect_from_forgery unless: -> { request.format.json? }
	attr_reader :current_user
	
	protected
	def authenticate_request!
	  unless user_id_in_token?
	    render json: { 
	    	errors: ['User id not found in token'] ,
	    }, status: :unauthorized
	    return
	  end
	  @current_user = User.find(auth_token[:user_id])
	rescue JWT::VerificationError, JWT::DecodeError
	  render json: { errors: ['Verification errors'] }, status: :unauthorized
	end

	private
	def http_token
	    @http_token ||= if request.headers['Authorization'].present?
	      request.headers['Authorization'].split(' ').last
	    end
	end

	def auth_token
	  @auth_token ||= JsonWebToken.decode(http_token)
	end

	def user_id_in_token?
	  http_token && auth_token && auth_token[:user_id].to_i
	end
end
