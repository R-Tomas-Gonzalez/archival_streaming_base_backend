class GameFavorite < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :game_id, scope: :user_id
end
