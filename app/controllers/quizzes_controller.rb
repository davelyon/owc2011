class QuizzesController < ApplicationController
  def quiz
    @quiz = Quiz.find_by_active(true)
  end
end
