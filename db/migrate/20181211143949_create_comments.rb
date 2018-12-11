class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commentbody
      t.references :post
      t.references :user
      t.references :comment
      t.timestamps
    end
  end
end
