class AddCityidToNewse < ActiveRecord::Migration
  def change
    add_column :newses, :city_id, :integer
  end
end
