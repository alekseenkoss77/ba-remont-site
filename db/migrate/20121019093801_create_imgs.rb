class CreateImgs < ActiveRecord::Migration
  def change
    create_table :imgs do |t|
      t.string :img_file_name
      t.string :img_content_type
      t.integer :img_file_size
      t.string :alt

      t.timestamps
    end
  end
end
