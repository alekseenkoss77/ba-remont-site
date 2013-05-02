class AddFieldToimg < ActiveRecord::Migration
  def up
    add_column :imgs, :gallery_id, :integer
  end

  def down
  end
end
