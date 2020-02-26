module Api
  module V1
    class AllocationsController < ApplicationController
      before_action :set_allocation, only: [:show, :update, :destroy]

      # GET /allocations
      def index
        @allocations = Allocation.all
        json_response(@allocations)
      end

      # GET /allocations/1
      def show
        @allocation = Allocation.find(params[:id])
        json_response(@allocation)
      end

      # POST /allocations
      def create
        @allocation = Allocation.new(allocation_params)
        if @allocation.save
          json_response(@allocation)
        return
        end
        json_response(@allocation.errors, 422)
      end

      # PATCH/PUT /allocations/1
      def update
        if @allocation.update(allocation_params)
          json_response(@allocation)
          return
        end
        json_response(@allocation.errors, 422)
      end

      # DELETE /allocations/1
      def destroy
        # @allocation.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_allocation
          @allocation = Allocation.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def allocation_params
          params.require(:allocation).permit(:allocation_date, :assigned_by, :assigned_to, :priority, :voided, :voided_reason, :voided_date, :encounter_id)
        end
    end
  end
end
