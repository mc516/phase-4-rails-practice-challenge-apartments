class LeasesController < ApplicationController
    def index
        render json: Lease.all
    end

    def create
        new_lease = Lease.create(lease_params)
        if new_lease.valid?
            render json: new_lease, status: :created
        else
            render json: { error: "Invalid lease info"}, status: :unprocessable_entity
        end
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
            lease.destroy
            head :no_content
        else
            render json: { error: "Lease not found"},status: :not_found
        end
    end

    private
    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
