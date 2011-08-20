class Admin::FundraisersController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @fundraisers = Fundraiser.all
  end


  def new
    @fundraiser = Fundraiser.new
  end

  def create
    @fundraiser = Fundraiser.new(params[:fundraiser])
    if @fundraiser.save
      redirect_to admin_fundraisers_path, :notice => "Fundraiser Added!"
    else
      render :new
    end
  end

  def edit
    @fundraiser = Fundraiser.find(params[:id])
    render :new
  end

  def update
    @fundraiser = Fundraiser.find_by_id(params[:id])
    if @fundraiser.update_attributes(params[:fundraiser])
      redirect_to admin_fundraisers_path, :notice => "Fundraiser Updated!"
    else
      render :new
    end
  end

  def destroy
    @fundraiser = Fundraiser.find_by_id(params[:id])
    @fundraiser.destroy
    redirect_to admin_fundraisers_path
  end
  
  def show
    @fundraiser = Fundraiser.find_by_id(params[:id])
  end
end
