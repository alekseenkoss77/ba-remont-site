#encoding: utf-8
class MainController < ApplicationController
  #before_filter :set_city_from_ip

  #def index
  #  @domain = request.subdomain
  #  #redirect by ipgeobase
  #  #set_city_from_ip
  #end

  def choose
    @cities = City.all
    if @cities.map(&:subdomain).include? request.subdomain
      return redirect_to url_for(:subdomain => request.subdomain, :controller => :pages, :action => :show, :id => "main")
    else
      render :choose
    end
  end

  def choose_town
    session[:city] = nil
    @city = City.find_by_subdomain!(params[:city][:city_id])
    session[:town] = @city.subdomain
    if current_city? @city.subdomain
      redirect_to url_for(:subdomain => @city.subdomain, :controller => :pages, :action => :show, :id => "main")
    else
      redirect_to url_for(:subdomain => @city.subdomain, :controller => :pages, :action => :show, :id => "main")
    end
  end

  #def copy
  #  @cat = Article.joins(:city).where('cities.subdomain' => :tomsk)
  #  p "="*100
  #  p @cat
  #  p "="*100
  #  @cat.each do |article|
  #    #@obj = Article.new(article)
  #    #@obj.city.subdomain = "seversk"
  #    #@obj.save
  #    obj = Article.new
  #    obj.name = article.name
  #    obj.title = article.title
  #    obj.content = article.content
  #    obj.permalink = article.permalink
  #    obj.position = article.position
  #    obj.preview_text = article.preview_text
  #    obj.save
  #  end
  #  #redirect_to :root_url
  #  render :text => "Copi is ok"
  #end
end
