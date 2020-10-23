class MovieFavoritesController < ApplicationController

    def index
        movie_favorite = MovieFavorite.all

        render json: movie_favorite, only: [:id, :movie_id, :original_title, :backdrop_path, :poster_path, :genre_ids, :release_date, :overview, :user_id]
    end

    def create
        movie_favorite = MovieFavorite.create!(movie_id:params[:movie_id], original_title:params[:original_title], 
         backdrop_path: params[:backdrop_path], poster_path:params[:poster_path], genre_ids: params[:genre_ids], release_date: params[:release_date], 
         overview: params[:overview], user_id:params[:user_id])
 
         render json: movie_favorite, only: [:id, :movie_id, :original_title, :backdrop_path, :poster_path, :genre_ids, :release_date, :overview, :user_id]
     end

    def destroy
        @movie = MovieFavorite.find(params[:id])
        
        @movie.destroy
    end

end