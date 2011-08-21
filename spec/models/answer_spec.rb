require 'spec_helper'

describe Answer do
  describe "validations" do
    it { should validate_presence_of :question_id }
    it { should validate_presence_of :title }
  end

  describe "associations" do
    it { should belong_to :question }
  end

  describe "callbacks" do
    describe "after save" do
      let!(:question) { FactoryGirl.create(:question) }
      let!(:original_correct_answer) { FactoryGirl.create :answer, question: question, correct: true }
      let(:new_correct_answer) { FactoryGirl.build :answer, question: question }

      it "only allows one answer to be correct" do
        new_correct_answer.correct = true
        new_correct_answer.save

        original_correct_answer.reload.should_not be_correct
      end
    end
  end
end

