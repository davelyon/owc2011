class DonationCampaign < ActiveRecord::Base
  
  scope :by_amount, :order => "amount DESC"
end
