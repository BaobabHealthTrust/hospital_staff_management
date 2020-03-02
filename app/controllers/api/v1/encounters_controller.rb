module Api
  module V1
    class EncountersController < ApplicationController
      before_action :get_patient, only: [:update, :create]
      before_action :set_encounter, only: [:show, :update, :destroy]
      before_action :get_allocation, only: [:create]

      # GET /encounters
      def index
        @encounters = Encounter.all
        json_response(@encounters)
      end

      def get_patient_encounters
        @encounters = Encounter.where("patient_id = %s" % params[:patient_id])
        json_response({patient: Patient.find(params[:patient_id]), encounters: @encounters })
      end

      # GET /encounters/1
      def show
        @encounter = Encounter.find(params[:id])
        json_response(@encounter)
      end

      # POST /encounters
      def create
        @encounter = Encounter.new(encounter_params)
        @encounter.user_id = @current_user.id
        if @encounter.save
          Allocation.update_allocation @encounter.allocation_id
          json_response(@encounter)
          return
        end
        json_response(@encounter.errors, 422)
      end

      # PATCH/PUT /encounters/1
      def update
        if @encounter.update(encounter_params)
          json_response(@encounter) 
          return
        end
        json_response(@encounter.errors, 422)
      end

      # DELETE /encounters/1
      def destroy
        @encounter.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_encounter
          @encounter = Encounter.find(params[:id])
        end

        def get_patient
          @patient = Patient.find(params[:patient_id])
        end

        def get_allocation
          @allocation = Allocation.find(params[:allocation_id])
        end

        # Only allow a trusted parameter "white list" through.
        def encounter_params
          params.require(:encounter).permit(:encounter_type, :weight, :height, :temperature, :BP, :voided, :voided_reason, :voided_date, :patient_id, :allocation_id)
        end
    end
  end
end
