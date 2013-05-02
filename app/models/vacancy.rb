class Vacancy < ActiveRecord::Base
   attr_accessible :fio,
                   :speciality,
                   :city_id   ,
                   :telephone ,
                   :stage     ,
                   :inventory ,
                   :car       ,
                   :study     ,
                   :old       ,
                   :comment

   validates_presence_of  :fio
   validates_presence_of  :speciality
   validates_presence_of  :telephone
   validates_presence_of  :study
   validates_presence_of  :old

end
