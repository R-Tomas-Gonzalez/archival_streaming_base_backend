class MovieFavorite < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :movie_id, scope: :user_id
end
