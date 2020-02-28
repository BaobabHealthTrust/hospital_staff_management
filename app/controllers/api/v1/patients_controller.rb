module Api
  module V1
    class PatientsController < ApplicationController
      before_action :set_patient, only: [:show, :update, :destroy]

      # GET /patients
      def index
        @patients = Patient.all
        json_response(@patients)
      end

      # GET /patients/1
      def show
        @patient = Patient.find(params[:id])
        json_response(@patient)
      end

      # POST /patients
      def create
        @patient = Patient.new(patient_params)
        if @patient.save
          json_response(@patient)
          return
        end
        json_response(@patient.errors, 422)
      end

      # PATCH/PUT /patients/1
      def update
        if @patient.update(patient_params)
          json_response(@patient, 200)
          return
        end
        json_response(@patient.errors, 422)
      end

      # search for existing patients
      def search
        @utils = UtilsController.new
        query_params = @utils.construct_like_search_query(params[:patient])
        json_response(Patient.search(query_params));
      end

      # DELETE /patients/1
      def destroy
        @patient.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_patient
          @patient = Patient.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def patient_params
          params.require(:patient).permit(:first_name, :middle_name, :family_name, :date_of_birth, :email, :address, :phone_number, :gender)
        end
    end
  end
end
