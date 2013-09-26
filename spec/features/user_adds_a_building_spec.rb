require 'spec_helper'

feature 'add a building', %Q{
    As a real estate associate
    I want to record a building
    So that I can refer back to pertinent information
} do

    # Acceptance Criteria:

    # * I must specify a street address, city, state, and postal code
    # * Only US states can be specified
    # * I can optionally specify a description of the building
    # * If I enter all of the required information in the required format,
    #   the building is recorded.
    # * If I do not specify all of the required information in the
    #   required formats, the building is not recorded
    #   and I am presented with errors
    # * Upon successfully creating a building, I am
    #   redirected so that I can record another building.

 scenario 'specify valid information' do

  prev_count = Building.count

  visit '/buildings/new'
  fill_in 'Address', with: '605 East 82nd Street'
  fill_in 'City', with: 'New York'
  fill_in 'State', with: 'NY'
  fill_in 'Description', with: 'Large building with great apartments.'
  fill_in 'Postal code', with: '10028'
  click_button 'Record'

  expect(page).to have_content('Building recorded.')
  expect(Building.count).to eql(prev_count + 1)

 end

 scenario 'specify invalid information' do
    prev_count = Building.count

    visit new_building_url

    click_button 'Record'
    expect(page).to have_content("can't be blank")
    expect(Building.count).to eql(prev_count)

  end
end