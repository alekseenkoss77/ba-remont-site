class GalleriesController < ApplicationController
  def show
    @galleries = Gallery.all
  end
end
