module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: [:show, :update, :destroy]

      # GET /roles
      def index
        @roles = Role.all
        json_response(@roles)
      end

      # GET /roles/1
      def show
        @role = Role.find(params[:id])
        json_response(@role)
      end

      # POST /roles
      def create
        @role = Role.new(role_params)
        if @role.save
          json_response(@role)
          return
        end
        json_response(@role.errors)
      end

      # PATCH/PUT /roles/1
      def update
        if @role.update(role_params)
          json_response(@role)
          return
        end
        json_response(@role.errors, 422)
      end

      # DELETE /roles/1
      def destroy
        @role.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_role
          @role = Role.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def role_params
          params.require(:role).permit(:role_name, :description)
        end
      end
  end
end

