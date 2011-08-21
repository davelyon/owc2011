require 'spec_helper'

describe Admin::KidsCornersController do
  include Devise::TestHelpers

  before do
    controller.stub!(:authenticate_admin!)
    sign_in_admin_user
  end

  context "GET index" do
    it "index serves up all the events" do
      kids_corner = mock(KidsCorner)
      KidsCorner.should_receive(:all).and_return([kids_corner])

      get :index

      assigns[:kids_corners].should == [kids_corner]
    end
  end

  context "GET new" do
    let(:kids_corner) { KidsCorner.new }

    before do
      KidsCorner.stub(:new).and_return(kids_corner)
    end

    it "assigns a new kids_corner" do
      get :new

      assigns(:kids_corner).should be(kids_corner)
    end
  end

  context "POST create" do
    let(:valid_kids_corner_attributes) { {title: 'Foo', content: 'Anti-Foo'} }
    let(:kids_corner) { KidsCorner.create!(valid_kids_corner_attributes) }

    context "with valid params" do
      it "creates a new kids_corner" do
        expect {
          post :create, :kids_corner => valid_kids_corner_attributes
        }.to change(KidsCorner, :count).by(1)
      end

      it "assigns a newly created series as @kids_corner" do
        post :create, :kids_corner => valid_kids_corner_attributes

        assigns(:kids_corner).should be_a(KidsCorner)
        assigns(:kids_corner).should be_persisted
      end

      it "redirects to the kids_corner index page" do
        post :create, :kids_corner => valid_kids_corner_attributes

        response.should redirect_to [:admin, :kids_corners]
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved kids_corner as @kids_corner" do
        # Trigger the behavior that occurs when invalid params are submitted
        KidsCorner.any_instance.stub(:save).and_return(false)
        post :create, :kids_corner => {}
        assigns(:kids_corner).should be_a_new(KidsCorner)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        KidsCorner.any_instance.stub(:save).and_return(false)
        post :create, :kids_corner => {}
        response.should render_template("new")
      end
    end
  end

  context "GET edit" do
    let(:kids_corner) { KidsCorner.create!(:title => "Blocks", :content => "Some Content") }

    it "assigns @kids_corner" do
      get :edit, "id" => kids_corner.id.to_s

      assigns(:kids_corner).should == kids_corner
    end
  end

  context "PUT update" do
    let(:kids_corner) { KidsCorner.create!(:title => "Rolex") }

    context "with valid params" do
      it "updates a kids_corner" do
        put :update, "id" => kids_corner.id.to_s, "kids_corner" => { "title" => "Tag Heuer" }

        kids_corner.reload.title.should == "Tag Heuer"
      end

      it "assigns kids_corner and renders index" do
        put :update, "id" => kids_corner.id.to_s, "kids_corner" => { "title" => "Tag Heuer" }

        assigns(:kids_corner).should == kids_corner
        response.should redirect_to admin_kids_corners_path
      end
    end
  end

  # context "DELETE destroy" do
    # let(:event) { Event.create!(:name => "Rolex") }

    # it "destroys a event and redirects to index" do
      # id = event.id
      # delete :destroy, "id" => event.id.to_s

      # Event.find_by_id(id).should be_nil
      # response.should redirect_to admin_events_path
    # end
  # end

  # context "show" do
    # let(:event) { Event.create!(:name => "Name") }
    # it "loads the event" do

      # get :show, :id => event.id

      # assigns[:event].should == event
    # end
  # end

end
