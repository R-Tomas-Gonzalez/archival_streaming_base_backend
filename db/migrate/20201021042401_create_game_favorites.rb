class CreateGameFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :game_favorites do |t|
      t.string :background_image
      t.string :name
      t.string :game_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
