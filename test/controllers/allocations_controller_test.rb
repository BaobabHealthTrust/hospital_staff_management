require 'test_helper'

class AllocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allocation = allocations(:one)
  end

  test "should get index" do
    get allocations_url, as: :json
    assert_response :success
  end

  test "should create allocation" do
    assert_difference('Allocation.count') do
      post allocations_url, params: { allocation: { allocation_date: @allocation.allocation_date, assigned_by: @allocation.assigned_by, encounter_id: @allocation.encounter_id, voided: @allocation.voided, voided_date: @allocation.voided_date, voided_reason: @allocation.voided_reason } }, as: :json
    end

    assert_response 201
  end

  test "should show allocation" do
    get allocation_url(@allocation), as: :json
    assert_response :success
  end

  test "should update allocation" do
    patch allocation_url(@allocation), params: { allocation: { allocation_date: @allocation.allocation_date, assigned_by: @allocation.assigned_by, encounter_id: @allocation.encounter_id, voided: @allocation.voided, voided_date: @allocation.voided_date, voided_reason: @allocation.voided_reason } }, as: :json
    assert_response 200
  end

  test "should destroy allocation" do
    assert_difference('Allocation.count', -1) do
      delete allocation_url(@allocation), as: :json
    end

    assert_response 204
  end
end
