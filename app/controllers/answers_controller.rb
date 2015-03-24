class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = @question.answers
  end

  def new
    set_question
    @answer = Answer.new
  end

  def create
    set_question
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer saved successfully."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save your answer."
      render :new
    end
  end

 private
  def set_question
    @question = Question.find(params[:question_id])
  end

    def answer_params
      params.require(:answer).permit(:user_id, :title, :body)
    end
end

  # # POST /answers
  # # POST /answers.json
  # def create
  #   @answer = Answer.new(answer_params)

  #   respond_to do |format|
  #     if @answer.save
  #       format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
  #       format.json { render :show, status: :created, location: @answer }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @answer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  # def update
  #   respond_to do |format|
  #     if @answer.update(answer_params)
  #       format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @answer }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @answer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /answers/1
  # # DELETE /answers/1.json
  # def destroy
  #   @answer.destroy
  #   respond_to do |format|
  #     format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end


