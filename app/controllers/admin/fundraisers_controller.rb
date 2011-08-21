class Admin::FundraisersController < AdminController
  before_filter :authenticate_admin!
  before_filter :load_fundraiser

  def index
    @fundraisers = Fundraiser.all
  end

  def new
    @fundraiser = Fundraiser.new
  end

  def create
    @fundraiser = Fundraiser.new(params[:fundraiser])
    if @fundraiser.save
      redirect_to new_admin_social_path(:message => "Join us for #{@fundraiser.name} on #{@fundraiser.start_at.strftime('%M/%d/%Y@%H:%M')} #KidsHaveHope"), :notice => "Fundraiser Added!"
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @fundraiser.update_attributes(params[:fundraiser])
      redirect_to admin_fundraisers_path, :notice => "Fundraiser Updated!"
    else
      render :new
    end
  end

  def destroy
    @fundraiser.destroy
    redirect_to admin_fundraisers_path
  end

  def show
  end
  
  private
  
  def load_fundraiser
    @fundraiser = Fundraiser.find_by_id(params[:id])
  end
end
