class Admin::QuizzesController < AdminController
  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new params[:quiz]

    if @quiz.save
      redirect_to admin_quizzes_path, notice: "Quiz successfully created."
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find params[:id]
  end

  def update
    @quiz = Quiz.find params[:id]

    if @quiz.update_attributes params[:quiz]
      redirect_to admin_quizzes_path, :notice => "Quiz successfully updated."
    else
      render :new
    end
  end
end
