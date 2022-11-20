class ApartmentsController < ApplicationController
    def index
        render json: Apartment.all
    end
end
