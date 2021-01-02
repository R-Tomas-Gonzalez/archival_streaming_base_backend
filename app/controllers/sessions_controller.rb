class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
        @user = User.find_by(email: params["user"]["email"])
        puts "this is the user: #{@user.id}"
        # .try(:authenticate, params["user"]["password"])
        session[:user_id] = @user.id
        # @current_user = session[:user_id]

        if user
            render json: {
                status: :created,
                logged_in: true,
                user: @user
            }
        else
            render json: {status: 401}
        end
    end

    def logged_in
        # puts "this is the logged_in status: #{@current_user}"
        
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def logout
        reset_session
        render json: {status: 200, logged_out: true}
    end

end
