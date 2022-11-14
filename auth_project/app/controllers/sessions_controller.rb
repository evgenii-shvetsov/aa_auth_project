class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by_credentials(
          params[:user][:username],
          params[:user][:password]
        )
    
        if user.nil?
          render json: "Invalid credentials".to_json
        else
            login!(user)
            redirect_to user_url(user)
        end
    end

    def show

    end

    def destroy
        logout!
        redirect_to new_session_url
      end
end