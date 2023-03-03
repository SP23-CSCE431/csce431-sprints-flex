# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a Member', type: :feature do
  scenario 'valid inputs' do
    # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
    # get '/admins/auth/google_oauth2/callback'
    # visit root_path
    # click_link 'Sign in with Google'
    # save_and_open_page

    visit new_member_path
    fill_in "member[first_name]", with: 'John'
    fill_in "member[last_name]", with: 'Smith'
    fill_in "member[email]", with: 'test@tamu.edu'
    fill_in "member[phone]", with: 123456789
    fill_in "member[email]", with: 'Test Role'
    click_on 'Create Member'
    expect(page).to have_content('Member was successfully created.')
    expect(page).to have_content('John Smith')
    expect(page).to have_content('test@tamu.edu')
    expect(page).to have_content('123456789')
    expect(page).to have_content('Test Role')
    click_on 'Destroy Member'
    expect(page).to have_content('Member was successfully destroyed.')
  end

  scenario 'invalid inputs' do
    visit new_member_path
    fill_in "member[first_name]", with: ''
    fill_in "member[last_name]", with: ''
    fill_in "member[email]", with: ''
    fill_in "member[phone]", with: ''
    fill_in "member[email]", with: ''
    click_on 'Create Member'
    expect(page).to have_content('cannot be empty')
  end
end

RSpec.describe 'Creating a Point Category', type: :feature do
  scenario 'valid inputs' do
    # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
    # get '/admins/auth/google_oauth2/callback'
    # visit root_path
    # click_link 'Sign in with Google'
    # save_and_open_page

    visit new_point_category_path
    fill_in "point_category[name]", with: 'Test Category'
    fill_in "point_category[value]", with: 1
    click_on 'Create Point category'
    expect(page).to have_content('Point category was successfully created.')
    expect(page).to have_content('Test Category')
    expect(page).to have_content('1')
    click_on 'Destroy Point category'
    expect(page).to have_content('Point Category was successfully destroyed.')
  end

  scenario 'invalid inputs' do
    visit new_point_category_path
    fill_in "point_category[name]", with: ''
    fill_in "point_category[value]", with: nil
    click_on 'Create Point category'
    expect(page).to have_content('cannot be empty')
  end
end

RSpec.describe 'Creating a Point', type: :feature do
  scenario 'valid inputs' do
    # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
    # get '/admins/auth/google_oauth2/callback'
    # visit root_path
    # click_link 'Sign in with Google'
    # save_and_open_page

    visit new_point_path
    fill_in "point[admin_id]", with: 1
    fill_in "point[point_category_id]", with: 1
    fill_in "point[is_approved]", with: true
    click_on 'Create Point'
    expect(page).to have_content('Point category was successfully created.')
    expect(page).to have_content('1')
    expect(page).to have_content('true')
    click_on 'Destroy Point'
    expect(page).to have_content('Point was successfully destroyed.')
  end

  scenario 'invalid inputs' do
    visit new_point_path
    fill_in "point[admin_id]", with: nil
    fill_in "point[point_category_id]", with: nil
    fill_in "point[is_approved]", with: nil
    click_on 'Create Point category'
    expect(page).to have_content('cannot be empty')
  end
end
