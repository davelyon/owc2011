require 'spec_helper'

describe Admin::EventsController do
  include Devise::TestHelpers

  before do
    controller.stub!(:authenticate_admin!)
    sign_in_admin_user
  end

  context "GET index xml" do
    it "index serves up all the events" do
      fund = mock(Event)
      Event.should_receive(:all).and_return([fund])

      get :index

      response.content_type.should == 'text/html'
      assigns[:events].should == [fund]
    end
  end

  context "GET new" do
    let(:event) { Event.new }
  
    before do
      Event.stub(:new).and_return(event)
    end
  
    it "assigns a new event" do
      get :new
  
      assigns(:event).should be(event)
    end
  
    it "renders 'new'" do
      get :new
  
      response.should render_template("new")
    end
  end
  
  context "POST create" do
    let(:valid_event_attributes) { { "name" => "Ditkas event", "start_at" => Time.now, "location" => "my house" } }
    let(:event) { Event.create!(valid_event_attributes) }
  
    context "with valid params" do
      it "creates a new event" do
        expect {
          post :create, :event => valid_event_attributes
        }.to change(Event, :count).by(1)
      end
  
      it "assigns a newly created series as @event" do
        post :create, :event => valid_event_attributes
  
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end
  
      it "redirects to the event index page" do
        post :create, :event => valid_event_attributes
  
        response.should redirect_to new_admin_social_path(:message => "Join us for #{event.name} on #{event.start_at.strftime('%m/%d/%Y@%H:%M')} #KidsHaveHope")
      end
      
    end
  
    context "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, :event => {}
        assigns(:event).should be_a_new(Event)
      end
  
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, :event => {}
        response.should render_template("new")
      end
    end
  end
  
  context "GET edit" do
    let(:event) { Event.create!(:name => "Rolex", :start_at => Time.now) }
  
    it "assigns @event" do
      get :edit, "id" => event.id.to_s
  
      assigns(:event).should == event
    end
  end
  
  context "PUT update" do
    let(:event) { Event.create!(:name => "Rolex", :start_at => Time.now) }
  
    context "with valid params" do
      it "updates a event" do
        put :update, "id" => event.id.to_s, "event" => { "name" => "Tag Heuer" }
  
        event.reload.name.should == "Tag Heuer"
      end
  
      it "assigns event and renders index" do
        put :update, "id" => event.id.to_s, "event" => { "name" => "Tag Heuer" }
  
        assigns(:event).should == event
        response.should redirect_to admin_events_path
      end
    end
  end
  
  context "DELETE destroy" do
    let(:event) { Event.create!(:name => "Rolex", :start_at => Time.now) }
  
    it "destroys a event and redirects to index" do
      id = event.id
      delete :destroy, "id" => event.id.to_s
  
      Event.find_by_id(id).should be_nil
      response.should redirect_to admin_events_path
    end
  end
  
  context "show" do
    let(:event) { Event.create!(:name => "Name", :start_at => Time.now) }
    it "loads the event" do
      
      get :show, :id => event.id
      
      assigns[:event].should == event
    end    
  end
  
end
