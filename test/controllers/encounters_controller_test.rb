require 'test_helper'

class EncountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encounter = encounters(:one)
  end

  test "should get index" do
    get encounters_url, as: :json
    assert_response :success
  end

  test "should create encounter" do
    assert_difference('Encounter.count') do
      post encounters_url, params: { encounter: { BP: @encounter.BP, encounter_type: @encounter.encounter_type, height: @encounter.height, patient_id: @encounter.patient_id, temperature: @encounter.temperature, voided: @encounter.voided, voided_date: @encounter.voided_date, voided_reason: @encounter.voided_reason, weight: @encounter.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show encounter" do
    get encounter_url(@encounter), as: :json
    assert_response :success
  end

  test "should update encounter" do
    patch encounter_url(@encounter), params: { encounter: { BP: @encounter.BP, encounter_type: @encounter.encounter_type, height: @encounter.height, patient_id: @encounter.patient_id, temperature: @encounter.temperature, voided: @encounter.voided, voided_date: @encounter.voided_date, voided_reason: @encounter.voided_reason, weight: @encounter.weight } }, as: :json
    assert_response 200
  end

  test "should destroy encounter" do
    assert_difference('Encounter.count', -1) do
      delete encounter_url(@encounter), as: :json
    end

    assert_response 204
  end
end
