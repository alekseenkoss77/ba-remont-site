class AddRedClassToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :red_class, :boolean
  end
end
