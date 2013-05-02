class Newse < ActiveRecord::Base
  attr_accessible :name, :content, :title, :preview_text, :image_content_type, :image_file_size,
                  :image_file_name, :image, :permalink, :city_id, :meta_keywords, :meta_description

  has_attached_file :image,
                    :styles => {
                        :thumb=> "163x110#",
                        :small  => "297x148>" }

  belongs_to :city, :inverse_of => :newse


  #scope :news_for_city,
  #scope :all_newses,
end
