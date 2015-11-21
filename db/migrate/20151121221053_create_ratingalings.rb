class CreateRatingalings < ActiveRecord::Migration
  def change
    create_table :ratingalings do |t|
      t.references :rating, index: true
      t.references :ratingable, polymorphic: true, index: true
      t.timestamps null: false
    end
    add_foreign_key :ratingalings, :ratings
  end
end
