class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
        user = User.find_by(email: params["user"]["email"])

        if user
            session[:user_id] = user.id
            # puts "session user from the controller: #{session[:user_id]}"
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            render json: {status: 401}
        end
    end

    def logged_in
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
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
