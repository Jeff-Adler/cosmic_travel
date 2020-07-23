class ScientistsController < ApplicationController
    before_action :set_scientist, only: [:show, :edit, :update, :destroy]

    def index 
        @scientists = Scientist.all
    end

    def new 
        @scientist = Scientist.new
        # byebug
    end

    def create 

        @scientist = Scientist.create(scientist_params)
        
        if @scientist.valid?
            redirect_to scientist_path(@scientist)
        else
            #flash[:form_errors] = @scientist.errors.full_messages            
            redirect_to new_scientist_path, form_errors: @scientist.errors.full_messages
        end

    end

    def show 
        @missions = @scientist.missions
        @planets = @scientist.planets
    end

    def edit 
    end

    def update 

        if @scientist.update(scientist_params)
            redirect_to scientist_path(@scientist)
        else
            redirect_to edit_scientist_path, flash[:form_errors] = @scientist.errors.full_messages
        end
    end

    def destroy

        @scientist.destroy
        redirect_to scientists_path
    end

    private
        
    def set_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params 
        params.require(:scientist).permit(:name, :field_of_study, planets_attributes: [:name,:distance_from_earth,:nearest_star])
    end
end
