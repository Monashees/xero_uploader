class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :fund
      t.string :type
      t.string :name
      t.datetime :date
      t.datetime :duedate
      t.text :description
      t.decimal :quantity
      t.decimal :unit_amount
      t.string :accountcode
      t.string :currency_code
      t.decimal :currency_rate

      t.timestamps
    end
  end
end
