class Admin::EventsController < AdminController
  before_filter :find_event, only: [:update, :edit]

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

  def destroy
    Event.destroy params[:id]
    redirect_to admin_events_path, notice: 'Event successfully deleted'
  end

  def update
    @event.update_attributes params[:event]
    redirect_to admin_events_path, notice: 'Event successfully updated'
  end

  private
  def find_event
    @event = Event.find params[:id]
  end

end
