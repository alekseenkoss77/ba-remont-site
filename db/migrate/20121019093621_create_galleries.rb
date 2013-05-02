class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :title
      t.string :position

      t.timestamps
    end
  end
end
