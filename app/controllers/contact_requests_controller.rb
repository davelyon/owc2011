class ContactRequestsController < ApplicationController

  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(params[:contact_request])
    if @contact_request.save
      ContactRequestMailer.contact_request(@contact_request).deliver!
      flash['success'] = "Thank you for your interest, we will contact you as soon as possible."
      redirect_to root_path
    else
      render :new
    end
  end
end
