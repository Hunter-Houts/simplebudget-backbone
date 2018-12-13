class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.decimal :income, :precision=>64, :scale=>12
      t.integer :option
      t.references :user
      t.references :bill
      t.timestamps
    end
  end
end
