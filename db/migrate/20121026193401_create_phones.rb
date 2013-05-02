class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_number

      t.timestamps
    end
    add_column  :cities , :email, :string
  end
end
