class AddCityStrOrders < ActiveRecord::Migration
  def up
    add_column :orders , :city_str,   :string
  end

  def down
    remove_column :orders, :city_str
  end
end
