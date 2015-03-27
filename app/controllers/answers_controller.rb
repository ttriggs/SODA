class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :favorite, :un_favorite, :destroy]

  def index
    @answers = @question.answers
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save
      flash[:notice] = "Answer saved successfully."
      redirect_to @question
    else
      flash[:notice] = "Failed to save your answer."
      render 'questions/show'
    end
  end

  def favorite

    @answer = Answer.find(params[:answer_id])
    @question = Question.find(params[:question_id])
    if @question.user == current_user
      unset_favorites_for_question(@question)
      @answer.featured = true
      if @answer.save
        flash[:notice] = "Featured answer selected."
        redirect_to @question
      end
    end
  end

  def un_favorite
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(params[:question_id])
    if @question.user == current_user
      @answer.featured = false
      if @answer.save
        flash[:notice] = "Featured answer un-selected."
        redirect_to @question
      end
    end
  end

  def destroy
    if signed_in?
      @question = Question.find(params[:question_id])
      if @question.present?
        @answer = Answer.where(id: params[:id], question: @question)
        Answer.destroy(@answer)
        redirect_to @question, notice: 'Answer was successfully destroyed.'
      end
    end
  end

  private
  def unset_favorites_for_question(question)
    question.answers.each do |answer|
      answer.featured = false
      answer.save
    end
  end

  def answer_params
    params.require(:answer).permit(:question_id, :title, :body)
  end
end

