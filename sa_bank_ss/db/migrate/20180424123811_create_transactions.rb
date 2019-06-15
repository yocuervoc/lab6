class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :sourceAccount
      t.references :targetAccount
      t.integer :iduser
      t.float :amount

      t.timestamps
    end
  end
end
