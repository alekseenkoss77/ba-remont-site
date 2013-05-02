class PagesController < ApplicationController

  def show
    #@page = Page.find_by_permalink!(params[:id])
    @page = Page.joins(:city).where('cities.subdomain = ? AND pages.permalink = ?', request.subdomain, params[:id]).limit(1)
  end

  def checkout
   render :text => '100', :layout => false
  end
end
