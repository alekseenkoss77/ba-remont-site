class AddCityId < ActiveRecord::Migration
  def up
    add_column :pages, :city_id, :integer
    add_column :articles, :city_id, :integer

  end

  def down
    remove_column :pages, :city_id
    remove_column :articles, :city_id
  end
end
