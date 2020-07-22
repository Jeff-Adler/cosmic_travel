class Planet < ApplicationRecord
    has_many :missions, dependent: :destroy
    has_many :scientists, through: :missions
    accepts_nested_attributes_for :scientists
end
