class CharactersController < ApplicationController
  
  def show
    @character = Character.find(params[:id])
    @ranks_count = Rank.count
    @stages_count = Stage.count
    if session[:user_id]
      if BattleRecord.find_by(user_id: session[:user_id], character_id: params[:id])
        @average_point = BattleRecord.where(user_id: session[:user_id], character_id: params[:id]).average(:point).floor
      end
    end
  end
  
  def random
    rand = Rails.env.production? ? "RANDOM()" : "rand()"
    @character = Character.order(rand).first
    session[:character_id] = @character.id
    redirect_to root_url
  end
  
  def random_destroy
    session[:character_id] = nil
    redirect_to root_url
  end
  
end
