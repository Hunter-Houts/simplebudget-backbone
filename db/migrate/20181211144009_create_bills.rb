class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name
      t.decimal :amount, :precision=>64, :scale=>12
      t.references :user
      t.references :account
      t.timestamps
    end
  end
end
