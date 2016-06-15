class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def self.from_omniauth(auth)
		user = User.where(email: auth.info.email).first
		if !user.blank?
			user.provider = auth.provider
			user.uid = auth.uid		
			user.oauth_token = auth.credentials.token
			# user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!	
			return user
		end
	end  
	def self.authenticate_user!
		binding.pry
	end       
end
