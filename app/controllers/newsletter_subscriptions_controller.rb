class NewsletterSubscriptionsController < ApplicationController
  def create
    case NewsletterSubscription.create params[:email]
    when 200..299
      redirect_to root_path, notice: "Thanks for signing up!"
    when 409
      redirect_to root_path, error: "Looks like you're already signed up."
    else
      redirect_to root_path, error: "We've encountered an issue. Try later?"
    end
  end
end
