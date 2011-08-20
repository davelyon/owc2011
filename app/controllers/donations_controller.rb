class DonationsController < ApplicationController
  before_filter :find_donation, :except => [:index, :new, :create, :successful]

  def index
    @donations = Donation.all
  end

  def show
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(params[:donation])
    redirect_to @donation
  end

  def edit
  end

  def update
    @donation.update_attributes!(params[:donation])
    redirect_to @donation
  end

  def destroy
    @donation.destroy
    redirect_to donations_path
  end

  private #####

  def find_donation
    @donation = Donation.find(params[:id])
  end

end
