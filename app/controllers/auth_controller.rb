class AuthController < ApplicationController

    before_action :require_login
    
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            payload = { user_id: @user.id }
            token = encode_token(payload)
            render json: {user: user, jwt: token}
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else 
            render json: {error: "No user logged in"}
        end
    end

    def user_is_authed
        render json: {message: "User is authed"}
    end

end