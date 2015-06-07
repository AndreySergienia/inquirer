class VotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find_by(id: params[:id])
    @vote.questions.flat_map(&:answers).each do |answer|
      answer.correct = false
    end
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      @vote.update(user: current_user)
      flash[:success] = "Vote successfully created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @vote = Vote.find_by(id: params[:id])
    if @vote.destroy
      flash[:success] = "Vote successfully deleted!"
    else
      flash[:error] = "Error!"
    end
    redirect_to root_path
  end

  def edit
    @vote = Vote.find_by(id: params[:id])
  end

  def update
    @vote = Vote.find_by(id: params[:id])
    if @vote.update(vote_params)
      flash[:success] = "Vote successfully updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def check_result
    result = CalculateResults.calculate(vote_params)
    flash[:success] = "Vote passed! #{result}"

    redirect_to root_path
  end

  private
    def vote_params
      params.require(:vote).permit(:name, questions_attributes: [:id, :text, :_destroy,
                                            answers_attributes: [:id, :text, :correct, :_destroy]])
    end
end
