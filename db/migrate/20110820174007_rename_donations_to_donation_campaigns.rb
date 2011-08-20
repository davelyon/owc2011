class RenameDonationsToDonationCampaigns < ActiveRecord::Migration
  def self.up
    rename_table :donations, :donation_campaigns
  end

  def self.down
    rename_table :donation_campaigns, :donations
  end
end
