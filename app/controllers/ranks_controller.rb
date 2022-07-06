class RanksController < ApplicationController
  
  def index
    @ranks = Rank.order(id: :asc)
  end

  def show
    @rank = Rank.find(params[:id])
    @stages = Stage.order(id: :asc)
  end
  
end
