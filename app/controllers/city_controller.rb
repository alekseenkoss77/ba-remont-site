class CityController < ApplicationController
  def chose
    @city = City.find_by_subdomain!(request.subdomain)
    if current_city? @city.subdomain
      redirect_to url_for(:subdomain => current_city, :controller => :pages, :action => :show, :id => "main")
    else
      session[:city] = @city.subdomain
      redirect_to url_for(:subdomain => current_city, :controller => :pages, :action => :show, :id => "main")
    end
  end
end
