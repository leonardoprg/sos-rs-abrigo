# frozen_string_literal: true

require 'application_system_test_case'

class VolunteersTest < ApplicationSystemTestCase
  setup do
    @volunteer = volunteers(:one)
  end

  test 'visiting the index' do
    visit volunteers_url
    assert_selector 'h1', text: 'Volunteers'
  end

  test 'should create volunteer' do
    visit volunteers_url
    click_on 'New volunteer'

    click_on 'Create Volunteer'

    assert_text 'Volunteer was successfully created'
    click_on 'Back'
  end

  test 'should update Volunteer' do
    visit volunteer_url(@volunteer)
    click_on 'Edit this volunteer', match: :first

    click_on 'Update Volunteer'

    assert_text 'Volunteer was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Volunteer' do
    visit volunteer_url(@volunteer)
    click_on 'Destroy this volunteer', match: :first

    assert_text 'Volunteer was successfully destroyed'
  end
end
