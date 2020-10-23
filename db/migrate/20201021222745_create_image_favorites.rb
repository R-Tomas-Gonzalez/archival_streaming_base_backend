class CreateImageFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :image_favorites do |t|
      t.string :image_id
      t.string :name
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
