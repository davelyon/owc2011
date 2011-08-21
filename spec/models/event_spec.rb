require 'spec_helper'

describe Event do
  context "validations" do
    before(:each) do
      @event = Event.new
      @event.should_not be_valid
    end

    it "requires a name" do
      @event.errors[:name].should_not be_empty
    end
    
    it "requires a start_at" do
      @event.errors[:start_at].should_not be_empty
    end
  end
end
