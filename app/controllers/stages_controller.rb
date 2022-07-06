class StagesController < ApplicationController

  def show
    @rank = Rank.find(params[:rank_id])
    @stage = Stage.find(params[:stage_id])
    @characters_count = Character.count
  end

end
