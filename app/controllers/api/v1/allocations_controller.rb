module Api
  module V1
    class AllocationsController < ApplicationController
      before_action :get_assignees, only: [:update, :create]
      before_action :set_allocation, only: [:show, :update, :destroy]
      before_action :get_patient, only: [:create]

      # GET /allocations
      def index
        @allocations = Allocation.get_allocations(params)
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
        @allocation.assigned_by = @current_user.id
          if @allocation.save
            begin   
              @encounter = Encounter.find(params[:encounter_id])
              @patient = Patient.find(@encounter.patient_id)
              @user = User.find(params[:assigned_to])
              AllocationMailer.with(email_from: @from, to:@to, patient: @patient, user: @user).allocated_patient_mail.deliver_later
            rescue => e
              json_response("Saved allocation but Failed to send email #{e}")
              return
            end
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
        @allocation.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_allocation
          @allocation = Allocation.find(params[:id])
        end

        def get_patient
          @patient = Patient.find(params[:patient_id])
        end

        def get_assignees
          @assigned_by = User.find(params[:assigned_to])
        end

        # Only allow a trusted parameter "white list" through.
        def allocation_params
          params.require(:allocation).permit(:allocation_date, :assigned_by, :assigned_to, :voided, :voided_reason, :voided_date, :priority, :patient_id)
        end
    end
  end
end
