class Scientist < ApplicationRecord
    has_many :missions, dependent: :destroy
    has_many :planets, through: :missions
    accepts_nested_attributes_for :planets

    # def planet_atttributes=(hash) 
    #     planet = Planet.create(hash)
    #     mission = Mission.create(planet: planet, scientist: self)
    # end
end
