class AddMenuFieldToPages < ActiveRecord::Migration
  def change
    add_column :pages, :top_menu, :boolean
    add_column :pages, :main_menu, :boolean
  end
end
