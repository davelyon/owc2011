require 'spec_helper'

describe Quiz do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :explanation }
  end

  describe "associations" do
    it { should have_many :questions }
  end
end
