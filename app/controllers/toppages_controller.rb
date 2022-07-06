class ToppagesController < ApplicationController
  
  before_action :require_user_login, only: [:achievement, :character_total_ranking, :character_max_ranking, :character_average_ranking]
  
  def index
    if session[:character_id]
      @character = Character.find_by(id: session[:character_id])
      if session[:user_id]
        if BattleRecord.find_by(user_id: session[:user_id], character_id: session[:character_id])
          @average_point = BattleRecord.where(user_id: session[:user_id], character_id: session[:character_id]).average(:point).floor
        end
      end
    end
    if session[:user_id]
      if BattleRecord.find_by(user_id: session[:user_id])
        @battle_records = BattleRecord.where(user_id: session[:user_id]).order(id: :desc).limit(2)
      end
    end
  end
  
  def achievement
    if BattleRecord.find_by(user_id: session[:user_id])
      @total_point = BattleRecord.where(user_id: session[:user_id]).sum(:point)
      @data_count = BattleRecord.where(user_id: session[:user_id]).group(:character_id, :stage_id).count.count
      @all_data_count = (Character.count) * (Rank.count) * (Stage.count)
      @achievement_rate = (@data_count * 100 / @all_data_count.to_f).round(3)
      @characters = Character.order(id: :asc)
      @max_record_character = Character.find(1)
      @max_record_point = 0
      @characters.each do |character|
        if BattleRecord.find_by(user_id: session[:user_id], character_id: character.id)
          @character_total_point = BattleRecord.where(user_id: session[:user_id], character_id: character.id).sum(:point)
          if @character_total_point > @max_record_point
            @max_record_character = character
            @max_record_point = @character_total_point
          end
        end
      end
      @max_point_record = BattleRecord.where(user_id: session[:user_id]).order(point: :desc).first
    end
  end
  
  def character_total_ranking
    @character_id_order_by_total = BattleRecord.where(user_id: session[:user_id]).group(:character_id).order('sum(point) desc').pluck(:character_id)
  end
  
  def character_max_ranking
    @character_id_order_by_max = BattleRecord.where(user_id: session[:user_id]).group(:character_id).order('max(point) desc').pluck(:character_id)
  end
  
  def character_average_ranking
    @character_id_order_by_average = BattleRecord.where(user_id: session[:user_id]).group(:character_id).order('avg(point) desc').pluck(:character_id)
  end
  
end
