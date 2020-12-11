class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
        user = User.find_by(email: params["user"]["email"])
        # .try(:authenticate, params["user"]["password"])
        if user
            session[:user_id] = user.id
            @stored_session = session[:user_id]
            puts "This is the session: #{session[:user_id]}"
            
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
        puts "this is the logged_in status: #{@current_user}"
        
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
