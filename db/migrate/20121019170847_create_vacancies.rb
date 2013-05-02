class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :fio
      t.string :speciality
      t.integer :city_id
      t.string :telephone
      t.string :stage
      t.string :inventory
      t.string :car
      t.string :study
      t.string :old
      t.string :comment
      t.timestamps
    end
  end
end
