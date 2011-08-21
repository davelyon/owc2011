class Admin::QuestionsController < AdminController

  before_filter :find_quiz

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
    @question = @quiz.questions.find params[:id]
    if @question.update_attributes params[:question]
      redirect_to admin_quiz_questions_path(@quiz), notice: "Question successfully created."
    else
      render :edit
    end
  end

  def edit
    @question = @quiz.questions.find params[:id]
  end

  def destroy
    @quiz.questions.destroy params[:id]
    redirect_to admin_quiz_questions_path(@quiz), notice: "Question successfully deleted."
  end

  private

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end
end
