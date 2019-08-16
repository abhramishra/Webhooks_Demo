class Customer < ApplicationRecord
    validates_uniqueness_of :shopify_customer_id
end
