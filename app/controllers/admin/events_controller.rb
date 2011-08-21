class Admin::EventsController < AdminController
  before_filter :find_event, only: [:update, :edit, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      redirect_to admin_new_tweet_path(:message => "Join us for #{@event.name} on #{@event.start_at.strftime('%M/%d/%Y@%H:%M')} #KidsHaveHope"), :notice => "Event Added!"
    else
      render :new
    end    
  end

  def destroy
    Event.destroy params[:id]
    redirect_to admin_events_path, notice: 'Event successfully deleted'
  end

  def update
    
    if @event.update_attributes params[:event]
      redirect_to admin_events_path, :notice => "Event successfully updated"
    else
      render :new
    end

  end
  
  def show
  end
  

  private
  def find_event
    @event = Event.find params[:id]
  end

end
