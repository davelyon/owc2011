class Admin::KidsCornersController < ApplicationController
  before_filter :find_kids_corner, :except => [:index, :new, :create]

  def index
    @kids_corners = KidsCorner.all
  end

  def edit
  end

  def new
    @kids_corner = KidsCorner.new
  end

  def create
    @kids_corner = KidsCorner.new(params[:kids_corner])
    if @kids_corner.save
      redirect_to [:admin, :kids_corners]
    else
      render 'new'
    end
  end

  def update
    @kids_corner.update_attributes(params[:kids_corner])
    redirect_to [:admin, :kids_corners]
  end

  protected #####

  def find_kids_corner
    @kids_corner = KidsCorner.find(params[:id])
  end

end
