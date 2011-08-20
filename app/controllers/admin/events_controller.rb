class Admin::EventsController < AdminController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new params[:event]
    @event.save
    redirect_to admin_events_path, notice: 'Event successfully created'
  end

end
