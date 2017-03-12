class AddBuyerToTransactions < ActiveRecord::Migration[5.0]
  create_table :transactions do |t|
        t.references :buyer
        t.references :seller
        t.references :comic
    end
end
