class MissionsController < ApplicationController
    
    def about 
        @scientist_count = Scientist.all.count
    
        @planet_count = Planet.all.count
    end

    def new 
        @mission = Mission.new
        @planets = Planet.all
        @scientists = Scientist.all
    end

    def create 

        @mission = Mission.create(mission_params)
        
        if @mission.valid?
            redirect_to scientist_path(@mission.scientist.id)
        else
            redirect_to new_mission_path, form_errors: @mission.errors.full_messages
        end

    end
    
    private

    def mission_params
        params.require(:mission).permit(:name, :planet_id, :scientist_id)
    end
end
