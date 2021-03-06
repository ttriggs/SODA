class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :update, :create]

  def index
    @questions = Question.order('created_at desc').limit(30)
  end

  def show
    @question = get_question
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
    @question = get_question
  end

  def update
    @question = Question.update(params[:id], question_params)
    if @question.save
      flash[:notice] = "Save successful"
      redirect_to @question
    else
      flash[:notice] = "Update failed"
      render :new
    end
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question saved successfully!"
      redirect_to @question
    else
      flash[:notice] = "Question failed to save!"
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_question
      Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description, :id)
    end
end
