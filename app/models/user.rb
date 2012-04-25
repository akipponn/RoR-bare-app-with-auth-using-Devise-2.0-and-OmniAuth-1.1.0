class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :name, :screen_name, :provider
  
	validates :screen_name, :presence => true, :uniqueness => {:allow_blank => false}
     
	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
		data = access_token.extra.raw_info
		# raise data.to_yaml
		
		if user = self.find_by_provider_and_uid( "facebook", data.id)
    		user
		else # Create a user with a stub password. 
			random_str = random_string_32
			self.create!( 
				:screen_name => "fb_user_dummy_screen_name_#{random_str}", 
				:email => "fb_user_dummy_email_#{random_str}@kcanvas.com", 
				:password => Devise.friendly_token[0,20], 
				:uid => data.id, 
				:provider => "facebook"
			) 
  		end
	end
	
	def self.random_string_32
    	temp = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
	    return Array.new(32){temp[rand(temp.size)]}.join
  	end
	
	# def email_required?
    #	false
	# end
end
