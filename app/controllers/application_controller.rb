class ApplicationController < ActionController::Base
  #before_filter :set_city_from_ip

  protect_from_forgery
  include UrlHelper



  def current_city?(city)
    if session[:city] == city
      true
    else
      false
    end
  end

  def current_city
    session[:city]
  end

  def set_current_city(city)
    session[:city] = city
  end

  private
  def set_city_from_ip
    #using ipgeobase service
    #получаем ip
    ip_address = request.remote_ip
    if ip_address
      #получаем город через базу
      ip_meta = Ipgeobase.lookup(ip_address)
      city_from_ip = ip_meta.city
      @city = City.find_by_name(city_from_ip)
      if @city
        session[:town] = @city.subdomain.to_s
        redirect_to url_for(:subdomain => @city.subdomain, :controller => :pages, :action => :show, :id => "main")
      else
        set_current_city(nil)
        redirect_to root_url
      end
    end
  end
end
