class Mission < ApplicationRecord
  belongs_to :planet
  belongs_to :scientist
  validates_uniqueness_of :scientist_id, scope: :planet_id
end
