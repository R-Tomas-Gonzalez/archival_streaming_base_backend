class CreateMovieFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_favorites do |t|
      t.integer :movie_id
      t.string :original_title
      t.string :backdrop_path
      t.string :poster_path
      t.integer :genre_ids, array: true
      t.string :release_date
      t.string :overview
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
