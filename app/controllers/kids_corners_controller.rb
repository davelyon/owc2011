class KidsCornersController < ApplicationController

  def index
    @kids_corners = KidsCorner.all
  end

  def show
    @kids_corner = KidsCorner.find(params[:id])
  end

end
