class GalleryController < ApplicationController

  def index
    @galleries = Gallery.all     
  end

end
