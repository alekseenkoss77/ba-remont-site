class Order < ActiveRecord::Base
  attr_accessible :city_id, :content, :email, :name, :title, :phone, :city_str
  
  validates_presence_of  :name
  validates_presence_of  :content
  validates :email,   
            :presence => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  
 
  validates_presence_of  :phone
end
