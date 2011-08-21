require 'spec_helper'

describe Admin::FundraisersController do
  include Devise::TestHelpers

  before do
    controller.stub!(:authenticate_admin!)
    sign_in_admin_user
  end

  context "GET index xml" do
    it "index serves up all the fundraisers" do
      fund = mock(Fundraiser)
      Fundraiser.should_receive(:all).and_return([fund])

      get :index

      response.content_type.should == 'text/html'
      assigns[:fundraisers].should == [fund]
    end
  end

  context "GET new" do
    let(:fundraiser) { Fundraiser.new }

    before do
      Fundraiser.stub(:new).and_return(fundraiser)
    end

    it "assigns a new fundraiser" do
      get :new

      assigns(:fundraiser).should be(fundraiser)
    end

    it "renders 'new'" do
      get :new

      response.should render_template("new")
    end
  end

  context "POST create" do
    let(:valid_fundraiser_attributes) do
      { "name" => "Ditkas fundraiser", "start_at" => Time.now, "end_at" => Time.now + 1.hour, "location" => "my house" }
    end
    let(:fundraiser) { Fundraiser.create!(valid_fundraiser_attributes) }

    context "with valid params" do
      it "creates a new fundraiser" do
        expect {
          post :create, :fundraiser => valid_fundraiser_attributes
        }.to change(Fundraiser, :count).by(1)
      end

      it "assigns a newly created series as @fundraiser" do
        post :create, :fundraiser => valid_fundraiser_attributes

        assigns(:fundraiser).should be_a(Fundraiser)
        assigns(:fundraiser).should be_persisted
      end

      it "redirects to the fundraiser index page" do
        post :create, :fundraiser => valid_fundraiser_attributes
        response.should redirect_to new_admin_social_path(:message => "Join us for #{fundraiser.name} on #{fundraiser.start_at.strftime('%M/%d/%Y@%H:%M')} #KidsHaveHope")
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved fundraiser as @fundraiser" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fundraiser.any_instance.stub(:save).and_return(false)
        post :create, :fundraiser => {}
        assigns(:fundraiser).should be_a_new(Fundraiser)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fundraiser.any_instance.stub(:save).and_return(false)
        post :create, :fundraiser => {}
        response.should render_template("new")
      end
    end
  end

  context "GET edit" do
    let(:fundraiser) { Fundraiser.create!(:name => "Rolex") }

    it "assigns @fundraiser" do
      get :edit, "id" => fundraiser.id.to_s

      assigns(:fundraiser).should == fundraiser
    end

    it "renders 'new'" do
      get :edit, "id" => fundraiser.id.to_s

      response.should render_template("new")
    end
  end

  context "PUT update" do
    let(:fundraiser) { Fundraiser.create!(:name => "Rolex") }

    context "with valid params" do
      it "updates a fundraiser" do
        put :update, "id" => fundraiser.id.to_s, "fundraiser" => { "name" => "Tag Heuer" }

        fundraiser.reload.name.should == "Tag Heuer"
      end

      it "assigns fundraiser and renders index" do
        put :update, "id" => fundraiser.id.to_s, "fundraiser" => { "name" => "Tag Heuer" }

        assigns(:fundraiser).should == fundraiser
        response.should redirect_to admin_fundraisers_path
      end
    end
  end

  context "DELETE destroy" do
    let(:fundraiser) { Fundraiser.create!(:name => "Rolex") }

    it "destroys a fundraiser and redirects to index" do
      id = fundraiser.id
      delete :destroy, "id" => fundraiser.id.to_s

      Fundraiser.find_by_id(id).should be_nil
      response.should redirect_to admin_fundraisers_path
    end
  end

  context "show" do
    let(:fundraiser) { Fundraiser.create!(:name => "Name") }
    it "loads the fundraiser" do

      get :show, :id => fundraiser.id
      assigns[:fundraiser].should == fundraiser
    end
  end

end
