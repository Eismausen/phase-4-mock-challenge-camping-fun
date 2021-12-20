class CampersController < ApplicationController

    def index
        all_campers = Camper.all
        render json: all_campers, status: :ok
    end

    def show
        this_camper = Camper.find(params[:id])
        render json: this_camper, status: :ok, serializer: CamperShowSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
