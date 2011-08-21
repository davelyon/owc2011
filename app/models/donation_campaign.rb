class DonationCampaign < ActiveRecord::Base
  def self.by_amount
    self.all.sort { |a, b| b.amount <=> a.amount }
  end
end
