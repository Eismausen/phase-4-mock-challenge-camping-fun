class ActivitiesController < ApplicationController

    def index
        all_activities = Activity.all
        render json: all_activities, status: :ok
    end

    def destroy
        destroy_this = Activity.find(params[:id])
        destroy_this.destroy
        render head: :no_content, status: :ok
    end


end
