require 'spec_helper'

describe Quiz do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :explanation }
  end

  describe "associations" do
    it { should have_many :questions }
  end

  describe "callbacks" do
    describe "after save" do
      let!(:original_active_quiz) { FactoryGirl.create :quiz, active: true }
      let(:new_active_quiz) { FactoryGirl.build :quiz, active: false }

      it "only allows one quiz to be active" do
        new_active_quiz.active = true
        new_active_quiz.save

        original_active_quiz.reload.should_not be_active
      end
    end
  end
end
