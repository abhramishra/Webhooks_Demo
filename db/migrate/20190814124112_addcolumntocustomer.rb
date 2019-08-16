class Addcolumntocustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :shopify_customer_id, :integer
  end
end
