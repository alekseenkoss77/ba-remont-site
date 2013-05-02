class Page < ActiveRecord::Base

  has_many :children, :class_name => "Page",
           :foreign_key => "parent_id"

  belongs_to :parent, :class_name => "Page"
  belongs_to :city

  attr_accessible :content, :name, :permalink, :parent_id, :top_menu, :main_menu, :position, :city_id, :title,
                  :meta_keywords, :meta_description, :sidebar
end
