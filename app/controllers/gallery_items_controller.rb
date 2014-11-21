class GalleryItemsController < ApplicationController

  def index
    @item = GalleryItem.all
  end

end
