# frozen_string_literal: true

require 'test_helper'

class VolunteersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:leonardo)
    @volunteer = users(:leonardo)
  end

  test 'should get index' do
    get volunteers_url
    assert_response :success
  end

  test 'should get new' do
    get new_volunteer_url
    assert_response :success
  end

  test 'should create volunteer' do
    assert_difference('User.count') do
      post volunteers_url, params: {
        user: {
          name: 'John doe',
          username: 'johndoe',
          email: 'john@doe.com',
          password: '123456',
          password_confirmation: '123456',
          document: '123456789',
          phone_number: '123456789',
          street: 'Dorival',
          street_number: '123',
          district: 'Vila Mariana',
          city: 'Cachoeirinha'
        }
      }
    end

    assert_redirected_to volunteers_path
  end

  test 'should get edit' do
    get edit_volunteer_url(@volunteer)
    assert_response :success
  end

  test 'should update volunteer' do
    # patch volunteer_url(@volunteer), params: { volunteer: {  } }
    # assert_redirected_to volunteer_url(@volunteer)
  end
end
