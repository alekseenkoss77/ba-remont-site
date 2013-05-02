class CreateNewses < ActiveRecord::Migration
  def change
    create_table :newses do |t|
      t.string  :title
      t.string  :name
      t.text    :content
      t.string  :permalink
      t.string  :preview_text
      t.integer :position

      #for images
      t.string  :image_file_name
      t.string  :image_content_type
      t.integer :image_file_size

      t.timestamps
    end

    #add field for images to article
    add_column :articles , :image_file_name ,    :string
    add_column :articles , :image_content_type , :string
    add_column :articles , :image_file_size ,    :integer
  end
end
