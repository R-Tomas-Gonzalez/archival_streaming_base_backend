class ImageFavoritesController < ApplicationController

    def index
        image_favorite = ImageFavorite.all

        render json: image_favorite, only: [:id, :image_id, :image_url, :user_id, :name]
    end

    def create
        image_favorite = ImageFavorite.create!(image_id:params[:image_id],  image_url:params[:image_url], user_id:params[:user_id], name:params[:name])
 
         render json: image_favorite, only: [:id, :image_id, :image_url, :user_id, :name]
     end

    def destroy
        @image = ImageFavorite.find(params[:id])
        
        @image.destroy
    end

end