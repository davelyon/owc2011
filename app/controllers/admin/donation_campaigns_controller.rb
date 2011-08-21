class Admin::DonationCampaignsController < AdminController
  before_filter :authenticate_admin!
  before_filter :find_donation_campaign, :except => [:index, :new, :create, :successful]

  def index
    @donation_campaigns = DonationCampaign.all
  end

  def show
  end

  def new
    @donation_campaign = DonationCampaign.new
  end

  def create
    @donation_campaign = DonationCampaign.create(params[:donation_campaign])
    redirect_to [:admin, @donation_campaign]
  end

  def edit
  end

  def update
    @donation_campaign.update_attributes!(params[:donation_campaign])
    redirect_to [:admin, @donation_campaign]
  end

  def destroy
    @donation_campaign.destroy
    redirect_to [:admin, :donation_campaigns]
  end

  private #####

  def find_donation_campaign
    @donation_campaign = DonationCampaign.find(params[:id])
  end

end
