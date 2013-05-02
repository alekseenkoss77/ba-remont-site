#encoding: utf-8
class AdminResourceController < ApplicationController
  
  def index
  end
  
  def copy
	#этот метод служит вспомогательным
	#к админке, для копирования объектов у разных городов
	
	#1st get all need resources
	@acticle = Article.joins(:city).where('cities.subdomain' => current_city)
	@pages = Pages.joins(:city).where('cities.subdomain' => current_city)
	@newses = Newse.joins(:city).where('cities.subdomain' => current_city)
  end
  
  def process_of_copy
	#непосредственно процесс копирования объекта
	#type of resource
	new_resource = case params[:type]
		when 'article' then Article.new
		when 'page'    then Page.new
		when 'newse'   then Newse.new
	end	
  end
end
