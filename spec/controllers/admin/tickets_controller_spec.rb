require 'spec_helper'

describe Admin::TicketsController do
  include Devise::TestHelpers

  before do
    controller.stub!(:authenticate_admin!)
    sign_in_admin_user
  end
  let(:fundraiser) { Fundraiser.create!(:name => "fund name") }

  context "GET index xml" do
    it "index serves up all the tickets" do
      ticket = Ticket.create

      fundraiser.tickets << ticket
      fundraiser.save!

      get :index, :fundraiser_id => fundraiser.id

      response.content_type.should == 'text/html'
      assigns[:tickets].should == [ticket]
    end
  end

  context "GET new" do
    let(:ticket) { Ticket.new }

    before do
      Ticket.stub(:new).and_return(ticket)
    end

    it "assigns a new ticket" do
      get :new, :fundraiser_id => fundraiser.id

      assigns(:ticket).should be(ticket)
    end

    it "renders 'new'" do
      get :new, :fundraiser_id => fundraiser.id

      response.should render_template("new")
    end
  end

  context "POST create" do
    let(:valid_ticket_attributes) { { :amount => 1, :title => "Ticket Title", :description => "my house", :quantity => 100 } }

    context "with valid params" do
      it "creates a new ticket" do
        expect {
          post :create, :ticket => valid_ticket_attributes, :fundraiser_id => fundraiser.id
        }.to change(Ticket, :count).by(1)
      end

      it "assigns a newly created series as @ticket" do
        post :create, :ticket => valid_ticket_attributes, :fundraiser_id => fundraiser.id

        assigns(:ticket).should be_a(Ticket)
        assigns(:ticket).should be_persisted
      end

      it "redirects to the ticket index page" do
        post :create, :ticket => valid_ticket_attributes, :fundraiser_id => fundraiser.id

        response.should redirect_to admin_fundraiser_tickets_path
      end
    end

    context "with invalid params" do


      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ticket.any_instance.stub(:save).and_return(false)
        post :create, :ticket => {}, :fundraiser_id => fundraiser.id
        response.should render_template("new")
      end
    end
  end

  context "GET edit" do
    let(:ticket) { Ticket.create!(:title => "Rolex", :description => "ticket description", :amount => 1, :quantity => 100, :fundraiser_id => fundraiser.id) }

    it "assigns @ticket" do
      get :edit, "id" => ticket.id.to_s, :fundraiser_id => fundraiser.id

      assigns(:ticket).should == ticket
    end

    it "renders 'new'" do
      get :edit, "id" => ticket.id.to_s, :fundraiser_id => fundraiser.id

      response.should render_template("new")
    end
  end

  context "PUT update" do
    let(:ticket) { Ticket.create!(:title => "Rolex", :description => "ticket description", :amount => 1, :quantity => 100, :fundraiser_id => fundraiser.id) }

    context "with valid params" do
      it "updates a ticket" do
        put :update, "id" => ticket.id.to_s, "ticket" => { "title" => "Tag Heuer" }, :fundraiser_id => fundraiser.id

        ticket.reload.title.should == "Tag Heuer"
      end

      it "assigns ticket and renders index" do
        put :update, "id" => ticket.id.to_s, "ticket" => { "title" => "Tag Heuer" }, :fundraiser_id => fundraiser.id

        assigns(:ticket).should == ticket
        response.should redirect_to admin_fundraiser_tickets_path
      end
    end
  end

  context "DELETE destroy" do

    let(:ticket) { Ticket.create!(:title => "Rolex", :description => "ticket description", :amount => 1, :quantity => 100, :fundraiser_id => fundraiser.id) }

    it "destroys a ticket and redirects to index" do
      id = ticket.id
      delete :destroy, "id" => ticket.id.to_s, :fundraiser_id => fundraiser.id

      Ticket.find_by_id(id).should be_nil
      response.should redirect_to admin_fundraiser_tickets_path
    end
  end

  context "show" do
    let(:ticket) { Ticket.create!(:title => "Name", :description => "ticket description", :amount => 1, :quantity => 100, :fundraiser_id => fundraiser.id) }
    it "loads the ticket" do

      get :show, :id => ticket.id, :fundraiser_id => fundraiser.id
      assigns[:ticket].should == ticket
    end

  end
end

