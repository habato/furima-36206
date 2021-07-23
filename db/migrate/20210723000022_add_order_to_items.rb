class AddOrderToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :order
  end
end
