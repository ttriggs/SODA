class QuestionsController < ApplicationController

  def index
    @questions = Question.order('created_at desc')
  end

  def show
    set_question
    @answers = @question.answers
    @answer = Answer.new(question: @question)
  end

  def new
    @question = Question.new
  end

  def edit
    set_question
  end

  def update
    @question = Question.update(params[:id], question_params)
    if @question.save
      redirect_to question_path
    else
      render :new
    end
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Save successful"
    else
      flash[:notice] = "Save failed"
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end


    def question_params
      params.require(:question).permit(:title, :description, :id)
    end
end
