#encoding: utf-8
class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    @city = City.find_by_subdomain!(request.subdomain)
    @order.city_str = @city.name
    if @order.save
	   flash[:notice] = "Ваша заявка отправленна, в ближайшее время с Вами свяжутся"
        SiteMailer.send_order(@order, @city).deliver
        redirect_to :controller => :pages, :action => :show, :id => 'main',
                                  :subdomain => request.subdomain
    else
        flash[:error] = "Не удалось отправить :("
        render :action => :new
    end
  end
  
  def new_complaint
	  @order = Order.new
  end
  
  def create_complaint
	@order = Order.new(params[:order])
    @city = City.find_by_subdomain!(request.subdomain)
	if @order.save
		flash[:notice] = "Ваша заявка отправленна, в ближайшее время с Вами свяжутся"
		SiteMailer.send_order_to_boss(@order, @city).deliver
		redirect_to :controller => :pages, :action => :show, :id => 'main',
                                  :subdomain => request.subdomain
	else
		flash[:error] = "Не удалось отправить :("
		render :action => :new_complaint
	end
  end
end
