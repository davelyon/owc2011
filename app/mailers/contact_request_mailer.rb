class ContactRequestMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_request(request)
    @contact_request = request
    mail(to: 'melicurk@kidshavehope.org') do |format|
      format.text
    end
  end
end
