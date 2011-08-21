class Admin::AnswersController < AdminController

  before_filter :find_quiz, :find_question

  before_filter :find_answer, only: [:edit, :update, :destroy]

  def index
    @answers = @question.answers
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new params[:answer]
    @answer.question = @question

    if @answer.save
      redirect_to [:admin, @quiz, @question, Answer.new], notice: "Answer successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update_attributes params[:answer]
      redirect_to [:admin, @quiz, @question, Answer.new], notice: "Answer successfully updated."
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to [:admin, @quiz, @question, Answer.new ], notice: "Answer successfully deleted."
  end

  private

  def find_quiz
    @quiz = Quiz.find params[:quiz_id]
  end

  def find_question
    @question = @quiz.questions.find params[:question_id]
  end

  def find_answer
    @answer = @question.answers.find params[:id]
  end
end
