class Admin::QuestionsController < AdminController
  def index
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions
  end

  def new
    @question = Question.new(quiz_id: params[:quiz_id])
  end

  def create
    @question = Question.new params[:question]

    if @question.save
      redirect_to admin_quiz_questions_path(@question.quiz), notice: "Question successfully created."
    else
      render :new
    end
  end
end
