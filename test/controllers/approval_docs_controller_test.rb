require 'test_helper'

class ApprovalDocsControllerTest < ActionController::TestCase
  setup do
    @approval_doc = approval_docs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approval_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approval_doc" do
    assert_difference('ApprovalDoc.count') do
      post :create, approval_doc: {doc_type: 1}
    end

    assert_redirected_to approval_doc_path(assigns(:approval_doc))
  end

  test "should show approval_doc" do
    get :show, id: @approval_doc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @approval_doc.id
    assert_response :success
  end

  test "should update approval_doc" do
    patch :update, id: @approval_doc.id, approval_doc: {desc: "This is a test", doc_type: 1 }
    assert_redirected_to @approval_doc
  end

  test "should destroy approval_doc" do
    assert_difference('ApprovalDoc.count', -1) do
      delete :destroy, id: @approval_doc
    end

    assert_redirected_to approval_docs_path
  end
end
