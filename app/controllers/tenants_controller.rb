class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def show
        tenant = Tenant.find_by(id:params[:id])
        if tenant
            render json: tenant
        else
            render json: { error: "Tenant not found"},status: :not_found
        end
    end

    def create
        new_tenant = Tenant.create(name: params[:name], age: params[:age])
        if new_tenant.valid?
            render json: new_tenant, status: :created
        else
            render json: {error: "Tenant info invalid" },status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find_by(id:params[:id])
        if tenant  
            tenant.update(name: params[:name], age: params[:age])
            render json: tenant
        else
            render json: { error: "Tenant not found"}, status: :not_found
        end
    end

    def destroy
        tenant = Tenant.find_by(id:params[:id])
        if tenant
            tenant.destroy
            head :no_content
        else
            render json: { error: "Tenant not found"},status: :not_found
        end
    end
end
