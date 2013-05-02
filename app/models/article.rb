class Article < ActiveRecord::Base
  attr_accessible :content, :name, :permalink, :title, :preview_text, :position,
                  :image_content_type, :image_file_size, :meta_keywords, :meta_description,
                  :image_file_name, :image, :city_id, :red_class

  has_attached_file :image,
                    :styles => {
                        :thumb=> "163x110#",
                        :small  => "297x148>" }

  belongs_to :city, :inverse_of => :articles

  validates :title, :presence => true
  validates :name, :presence => true
  validates :preview_text, :presence => true
  validates :permalink, :presence => true
end
