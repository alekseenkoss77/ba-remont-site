class SidebarPages < ActiveRecord::Migration
  def up
    add_column :pages , :sidebar, :bool
  end

  def down
    remove_column :pages, :sidebar
  end
end
