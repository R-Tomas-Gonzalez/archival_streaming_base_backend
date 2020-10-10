class UsersController < ApplicationController

    def index
        user = User.all

        render json: user, only: [:id, :email, :name]
    end

end
