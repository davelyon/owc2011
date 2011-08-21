class Admin::AnswersController < AdminController
  def index
    @answers = Question.find(params[:question_id]).answers
  end

  def new
    @answer = Answer.new(question_id: params[:question_id])
  end

  def create
    @answer = Answer.new params[:answer]

    if @answer.save
      redirect_to admin_quiz_question_answers_path(@answer.question), notice: "Answer successfully created."
    else
      render :new
    end
  end
end
