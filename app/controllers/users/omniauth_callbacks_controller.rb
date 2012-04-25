class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		error = nil
		begin
			@user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
		rescue => e
			error = e
		ensure
			#
		end
		
		if @user && @user.persisted?
    		flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      		sign_in_and_redirect @user, :event => :authentication
    	else
    		redirect_to :root, :notice => (error ? error.to_s : "")
    	end 
	end
end