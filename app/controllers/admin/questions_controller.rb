class Admin::QuestionsController < AdminController

  before_filter :find_quiz
  before_filter :find_question, only: [:edit, :destroy, :update]

  def index
    @questions = @quiz.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]
    @question.quiz = @quiz
    if @question.save
      redirect_to admin_quiz_questions_path(@quiz), notice: "Question successfully created."
    else
      render :new
    end
  end

  def update
    if @question.update_attributes params[:question]
      redirect_to admin_quiz_questions_path(@quiz), notice: "Question successfully created."
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @question.destroy
    redirect_to admin_quiz_questions_path(@quiz), notice: "Question successfully deleted."
  end

  private

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def find_question
    @question = @quiz.questions.find params[:id]
  end
end
