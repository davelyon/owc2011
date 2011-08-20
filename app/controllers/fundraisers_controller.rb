class FundraisersController < ApplicationController
  def show
    @fundraiser = Fundraiser.find params[:id]
  end
end
