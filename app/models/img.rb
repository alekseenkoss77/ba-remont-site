class Img < ActiveRecord::Base
  attr_accessible :img, :img_content_type, :img_file_name, :img_file_size, :alt, :gallery_id
  belongs_to :gallery, :inverse_of => :imgs
  #attr_accessor :delete_img
  has_attached_file :img,
                    :styles => {
                        :bigest => "1024x800#",
                        :big => "800x600>",
                        :thumb=> "190x119#",
                        :small  => "297x148>" }
end
