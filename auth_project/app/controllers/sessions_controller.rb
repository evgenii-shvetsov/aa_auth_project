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
          render json: "Welcome back #{user.username}!".to_json
        end
      end
end