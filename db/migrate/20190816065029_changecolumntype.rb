class Changecolumntype < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :shopify_customer_id, :string
  end
end
