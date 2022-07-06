class ActionTypesController < ApplicationController
  
  def show
    @action_type = ActionType.find(params[:id])
    @characters = Character.where(action_type_id: @action_type.id).order(id: :asc)
  end
  
end
