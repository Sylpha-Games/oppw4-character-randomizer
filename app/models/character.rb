class Character < ApplicationRecord
  belongs_to :character_category
  belongs_to :action_type
end
