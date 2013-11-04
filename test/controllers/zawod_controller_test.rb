require 'test_helper'

class ZawodControllerTest < ActionController::TestCase
  setup do
    @zawod = zawod(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zawod)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zawod" do
    assert_difference('Zawod.count') do
      post :create, zawod: { additional_info: @zawod.additional_info, address: @zawod.address, begin_date: @zawod.begin_date, category_id: @zawod.category_id, costs_info: @zawod.costs_info, costs_semester: @zawod.costs_semester, description: @zawod.description, documents: @zawod.documents, end_date: @zawod.end_date, location_id: @zawod.location_id, name: @zawod.name, organizer_id: @zawod.organizer_id, term_info: @zawod.term_info, term_time: @zawod.term_time }
    end

    assert_redirected_to zawod_path(assigns(:zawod))
  end

  test "should show zawod" do
    get :show, id: @zawod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zawod
    assert_response :success
  end

  test "should update zawod" do
    patch :update, id: @zawod, zawod: { additional_info: @zawod.additional_info, address: @zawod.address, begin_date: @zawod.begin_date, category_id: @zawod.category_id, costs_info: @zawod.costs_info, costs_semester: @zawod.costs_semester, description: @zawod.description, documents: @zawod.documents, end_date: @zawod.end_date, location_id: @zawod.location_id, name: @zawod.name, organizer_id: @zawod.organizer_id, term_info: @zawod.term_info, term_time: @zawod.term_time }
    assert_redirected_to zawod_path(assigns(:zawod))
  end

  test "should destroy zawod" do
    assert_difference('Zawod.count', -1) do
      delete :destroy, id: @zawod
    end

    assert_redirected_to zawod_index_path
  end
end
