require 'test_helper'

class JobEmailsControllerTest < ActionController::TestCase
  setup do
    @job_email = job_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_email" do
    assert_difference('JobEmail.count') do
      post :create, job_email: { email: @job_email.email, job_id: @job_email.job_id }
    end

    assert_redirected_to job_email_path(assigns(:job_email))
  end

  test "should show job_email" do
    get :show, id: @job_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_email
    assert_response :success
  end

  test "should update job_email" do
    patch :update, id: @job_email, job_email: { email: @job_email.email, job_id: @job_email.job_id }
    assert_redirected_to job_email_path(assigns(:job_email))
  end

  test "should destroy job_email" do
    assert_difference('JobEmail.count', -1) do
      delete :destroy, id: @job_email
    end

    assert_redirected_to job_emails_path
  end
end
