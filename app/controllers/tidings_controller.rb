class TidingsController < ApplicationController
  def index
    @tiding = Newse.joins(:city).where('cities.subdomain' => request.subdomain).order('created_at desc')

  end

  def show
     @tiding = Newse.joins(:city).where('cities.subdomain = ? and newses.id = ?', request.subdomain, params[:id] )
  end
end
