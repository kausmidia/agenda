require 'test_helper'

class AgendasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:agendas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_agenda
    assert_difference('Agenda.count') do
      post :create, :agenda => { }
    end

    assert_redirected_to agenda_path(assigns(:agenda))
  end

  def test_should_show_agenda
    get :show, :id => agendas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => agendas(:one).id
    assert_response :success
  end

  def test_should_update_agenda
    put :update, :id => agendas(:one).id, :agenda => { }
    assert_redirected_to agenda_path(assigns(:agenda))
  end

  def test_should_destroy_agenda
    assert_difference('Agenda.count', -1) do
      delete :destroy, :id => agendas(:one).id
    end

    assert_redirected_to agendas_path
  end
end
