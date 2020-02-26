module Api
  module V1
    class EncountersController < ApplicationController
      before_action :set_encounter, only: [:show, :update, :destroy]

      # GET /encounters
      def index
        @encounters = Encounter.all
        json_response(@encounters)
      end

      # GET /encounters/1
      def show
        @encounter = Encounter.find(params[:id])
        json_response(@encounter)
      end

      # POST /encounters
      def create
        @encounter = Encounter.new(encounter_params)
        if @encounter.save
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
        # @encounter.update(voided, true, voided)
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_encounter
          @encounter = Encounter.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def encounter_params
          params.require(:encounter).permit(:encounter_type, :weight, :height, :temperature, :BP, :voided, :voided_reason, :voided_date, :patient_id)
        end
    end
  end
end
