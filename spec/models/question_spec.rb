require 'spec_helper'

describe Question do
  describe "validations" do
    it { should validate_presence_of :quiz_id }
    it { should validate_presence_of :title }
  end

  describe "assocations" do
    it { should belong_to :quiz }
  end
end
