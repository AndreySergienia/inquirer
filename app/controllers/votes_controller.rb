class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find_by(id: params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      flash[:success] = "Vote successfully created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:name)
    end
end
