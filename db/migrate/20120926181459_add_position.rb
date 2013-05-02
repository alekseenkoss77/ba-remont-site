class AddPosition < ActiveRecord::Migration
  def up
    add_column :pages, :position, :integer
    add_column :articles, :position, :integer
  end

  def down
  end
end
