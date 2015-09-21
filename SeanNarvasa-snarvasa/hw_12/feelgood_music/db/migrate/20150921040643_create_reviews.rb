class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :name
      t.string :review_body

      t.timestamps null: false
    end
  end
end
