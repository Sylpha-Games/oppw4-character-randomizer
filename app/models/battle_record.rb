class BattleRecord < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :rank
  belongs_to :stage
end
