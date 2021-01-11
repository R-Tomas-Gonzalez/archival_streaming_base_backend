module CurrentUserConcern
extend ActiveSupport::Concern
    included do
        before_action :set_current_user, unless: :create
    end

    def set_current_user

        # puts "user from the concern: #{session[:user]}"
        # @current_user = User.find_by_id(session[:user_id])

        # puts "this is the session from the concern:#{session[:user_id]}"
        # puts "this is the current_user in the concern: #{@current_user}"

        puts "this is the session user id from the concern: #{session[:user_id]}"

        if session[:user_id]
            @current_user = User.find(session[:user_id])
            puts "from the concern: #{@current_user}"
        end
    end

end
