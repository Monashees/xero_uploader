class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :name
      t.string :code
      t.string :xero_key
      t.string :xero_secret

      t.timestamps
    end
  end
end
