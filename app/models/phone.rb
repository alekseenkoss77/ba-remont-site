class Phone < ActiveRecord::Base
  attr_accessible :phone_number

  belongs_to :city, :inverse_of => :phones
end
