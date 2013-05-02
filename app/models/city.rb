class City < ActiveRecord::Base
   attr_accessible :title, :content, :name, :subdomain, :phones_attributes, :email, :title,
                   :meta_keywords, :meta_description

   has_many :newse, :dependent => :destroy, :inverse_of => :city
   has_many :articles, :dependent => :destroy, :inverse_of => :city
   has_many :pages, :dependent => :destroy, :inverse_of => :city

   has_many :phones, :dependent => :destroy, :inverse_of => :city
   accepts_nested_attributes_for :phones, :allow_destroy => true

   validates_presence_of  :name
   validates_presence_of  :subdomain
   validates_presence_of  :email

end
