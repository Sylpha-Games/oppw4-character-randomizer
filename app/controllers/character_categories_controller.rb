class CharacterCategoriesController < ApplicationController
  
  def index
    @character_categories = CharacterCategory.order(id: :asc)
    @action_types = ActionType.order(id: :asc)
  end
  
  def show
    @character_category = CharacterCategory.find(params[:id])
    @characters = Character.where(character_category_id: @character_category.id).order(id: :asc)
  end
  
end
