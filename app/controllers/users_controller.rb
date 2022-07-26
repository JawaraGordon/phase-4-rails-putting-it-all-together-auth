class UsersController < ApplicationController
    skip_before_action :authorized_user, only: :create

    def create 
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end 

    def show
        if current_user 
            render json: current_user, status: :ok
        else 
            render json: {error: "No current user, please login"}, status: :unauthorized
    end
end

private

def user_params
    params.permit(:username, :image_url, :bio, :password, :password_confirmation)
end 


end
