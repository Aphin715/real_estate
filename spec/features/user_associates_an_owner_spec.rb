require 'spec_helper'

feature 'add an owner', %Q{
  As a real estate associate
I want to record a building owner
So that I can keep track of our relationships with owners
} do

#   Acceptance Criteria:

# I must specify a first name, last name, and email address
# I can optionally specify a company name
# If I do not specify the required information, I am presented with errors
# If I specify the required information, the owner is recorded and
# I am redirected to enter another new owner

 scenario 'specify valid information' do

  prev_count = Owner.count

  visit '/owners/new'
  fill_in 'First name', with: 'Alex'
  fill_in 'Last name', with: 'Phinizy'
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Company name', with: 'Citi Habitats'
  click_button 'Record'

  expect(page).to have_content('Owner recorded.')
  expect(Owner.count).to eql(prev_count + 1)
end

scenario 'specify invalid information' do
    prev_count = Owner.count

    visit new_building_url

    click_button 'Record'
    expect(page).to have_content("can't be blank")
    expect(Owner.count).to eql(prev_count)
end
  end

feature 'associate an building with an owner', %Q{
  As a real estate associate
  I want to match an owner of a building
  So that I can refer back to pertinent information
  } do

#     Acceptance Criteria:

      # When recording a building, I want to optionally associate the
      #building with its rightful owner.
      # If I delete an owner, the owner and its primary key should no
      #longer be associated with any properties.
scenario 'owner wants to be associated with a building' do

    visit '/buildings/new'
    fill_in 'Address', with: '605 East 82nd Street'
    fill_in 'City', with: 'New York'
    fill_in 'State', with: 'NY'
    fill_in 'Description', with: 'Large building with great apartments.'
    fill_in 'Postal code', with: '10028'
    click_button "Record"

    expect(page).to have_content("Add a new Owner")
    fill_in 'First name', with: 'Alex'
    fill_in 'Last name', with: 'Phinizy'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Company name', with: 'Citi Habitats'
    click_button 'Record'
    expect(page).to have_content('Owner recorded.')


end

end

