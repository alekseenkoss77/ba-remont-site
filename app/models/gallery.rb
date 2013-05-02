class Gallery < ActiveRecord::Base
  attr_accessible :name, :title, :imgs_attributes, :position, :meta_keywords, :meta_description

  has_many :imgs, :dependent => :destroy, :inverse_of => :gallery
  accepts_nested_attributes_for :imgs, :allow_destroy => true


end
