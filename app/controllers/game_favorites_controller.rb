class GameFavoritesController < ApplicationController
    def index
        game_favorite = GameFavorite.all

        render json: game_favorite, only: [:id, :game_id, :name, :background_image, :user_id]
    end

    def create
        game_favorite = GameFavorite.create!(game_id:params[:game_id], name:params[:name], 
            background_image: params[:background_image], user_id:params[:user_id])

        render json: game_favorite, only: [:game_id, :name, :background_image, :user_id]
    end

    def destroy
        @game = GameFavorite.find(params[:id])

        @game.destroy
    end


end
