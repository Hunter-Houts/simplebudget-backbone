class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :rating
      t.references :user
      t.timestamps
    end
  end
end
