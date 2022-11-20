class ApartmentsController < ApplicationController
    def index
        render json: Apartment.all
    end

    def show
        apartment = Apartment.find(params[:id])
        if apartment
            render json: apartment
        else
            render json: { error: "Apartment not found" }, status: :not_found
        end
    end

    def create
        apartment = Apartment.create(number: params[:number])
        if apartment.valid?
            render json: apartment, status: :created
        else
            render json: { error: apartment.errors },status: :not_created
        end
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        if apartment.valid?
            apartment.update(number:params[:number])
            render json: apartment
        else
            render json: { error: apartment.errors },status: :not_found
        end
      
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: { error: "Apartment not found"}, status: :not_found
        end

    end

    
end
