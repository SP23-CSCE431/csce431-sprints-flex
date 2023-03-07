# location: spec/feature/integration_spec.rb
require 'rails_helper'

# Test sign in procedure
RSpec.describe 'Signing In', type: :feature do
  scenario 'sign in' do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      OmniAuth.config.add_mock(:google_oauth2, {
          provider: 'google_oauth2',
          uid: '123456789',
          info: {
            email: 'test@example.com',
            name: 'Test User'
          },
          credentials: {
            token: 'token',
            refresh_token: 'refresh_token',
            expires_at: Time.now + 1.week
          }
      })

      # First sign in
      visit new_admin_session_path
      click_link 'Sign in with Google'
      expect(page).to have_content('Successfully authenticated from Google account')
      click_link 'Sign Out'
      expect(page).to have_content('Signed out successfully')
  end
end

RSpec.describe 'Creating a Member', type: :feature do

  # Stub the google oauth by providing fake credentials
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.add_mock(:google_oauth2, {
        provider: 'google_oauth2',
        uid: '123456789',
        info: {
          email: 'test@example.com',
          name: 'Test User'
        },
        credentials: {
          token: 'token',
          refresh_token: 'refresh_token',
          expires_at: Time.now + 1.week
        }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'valid inputs' do
    visit new_member_path
    expect(page).to have_content('New member')
    fill_in "member[first_name]", with: 'John'
    fill_in "member[last_name]", with: 'Smith'
    fill_in "member[email]", with: 'test@tamu.edu'
    fill_in "member[phone]", with: 1234567890
    fill_in "member[role]", with: 'executive'
    click_on 'Create Member'
    expect(page).to have_content('Member was successfully created')
    #expect(page).to have_content('John Smith')
    #expect(page).to have_content('test@tamu.edu')
    #expect(page).to have_content('1234567890')
    #expect(page).to have_content('executive')
    click_on 'Destroy this member'
    expect(page).to have_content('Member was successfully destroyed')
  end

  scenario 'invalid inputs' do
    visit new_member_path
    fill_in "member[first_name]", with: ''
    fill_in "member[last_name]", with: ''
    fill_in "member[email]", with: ''
    fill_in "member[phone]", with: ''
    fill_in "member[email]", with: ''
    click_on 'Create Member'
    expect(page).to have_content('can\'t be blank')
  end
end

RSpec.describe 'Creating a Point Category', type: :feature do
  # Stub the google oauth by providing fake credentials
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.add_mock(:google_oauth2, {
        provider: 'google_oauth2',
        uid: '123456789',
        info: {
          email: 'test@example.com',
          name: 'Test User'
        },
        credentials: {
          token: 'token',
          refresh_token: 'refresh_token',
          expires_at: Time.now + 1.week
        }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'valid inputs' do

    visit new_point_category_path
    fill_in "point_category[name]", with: 'Test Category'
    fill_in "point_category[value]", with: 1
    click_on 'Create Point category'
    expect(page).to have_content('Point category was successfully created.')
    expect(page).to have_content('Test Category')
    expect(page).to have_content('1')
    click_on 'Destroy this point category'
    expect(page).to have_content('Point category was successfully destroyed.')
  end

  scenario 'invalid inputs' do
    visit new_point_category_path
    fill_in "point_category[name]", with: ''
    fill_in "point_category[value]", with: nil
    click_on 'Create Point category'
    expect(page).to have_content('can\'t be blank')
  end
end

RSpec.describe 'Creating a Point', type: :feature do
  # Stub the google oauth by providing fake credentials
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.add_mock(:google_oauth2, {
        provider: 'google_oauth2',
        uid: '123456789',
        info: {
          email: 'test@example.com',
          name: 'Test User'
        },
        credentials: {
          token: 'token',
          refresh_token: 'refresh_token',
          expires_at: Time.now + 1.week
        }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'valid inputs' do

    visit new_point_path
    select "Test Category 1", :from => "point[point_category_id]"
    click_on 'Create Point'
    expect(page).to have_content('Point was successfully created')
    expect(page).to have_content('Test Category 1')
    click_on 'Destroy this point'
    expect(page).to have_content('Point was successfully destroyed')
  end

  scenario 'invalid inputs' do
    visit new_point_path
    click_on 'Create Point'
    expect(page).to have_content('can\'t be blank')
  end
end

RSpec.describe 'Creating a Budget Category', type: :feature do
  # Stub the google oauth by providing fake credentials
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.add_mock(:google_oauth2, {
        provider: 'google_oauth2',
        uid: '123456789',
        info: {
          email: 'test@example.com',
          name: 'Test User'
        },
        credentials: {
          token: 'token',
          refresh_token: 'refresh_token',
          expires_at: Time.now + 1.week
        }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end
  
  scenario 'valid inputs' do
    visit new_budget_category_path
    fill_in "budget_category[name]", with: 'Test Category'
    click_on 'Create Budget category'
    expect(page).to have_content('Budget category was successfully created.')
    expect(page).to have_content('Test Category')
    click_on 'Destroy this budget category'
    expect(page).to have_content('Budget category was successfully destroyed.')
  end

  scenario 'invalid inputs' do
    visit new_budget_category_path
    fill_in "budget_category[name]", with: ''
    click_on 'Create Budget category'
    expect(page).to have_content('can\'t be blank')
  end
end

RSpec.describe 'Creating a Budget Request', type: :feature do
  # Stub the google oauth by providing fake credentials
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.add_mock(:google_oauth2, {
        provider: 'google_oauth2',
        uid: '123456789',
        info: {
          email: 'test@example.com',
          name: 'Test User'
        },
        credentials: {
          token: 'token',
          refresh_token: 'refresh_token',
          expires_at: Time.now + 1.week
        }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end
  
  scenario 'valid inputs' do
    visit new_budget_request_path
    select "Test Category", :from => "budget_request[budget_category_id]"
    fill_in "budget_request[value]", with: 2
    fill_in "budget_request[description]", with: 'Test'
    click_on 'Create Budget request'
    expect(page).to have_content('Budget request was successfully created.')
    expect(page).to have_content('1')
    expect(page).to have_content('2')
    expect(page).to have_content('Test')
    click_on 'Destroy this budget request'
    expect(page).to have_content('Budget request was successfully destroyed.')
  end

  scenario 'invalid inputs' do
    visit new_budget_request_path
    fill_in "budget_request[value]", with: nil
    fill_in "budget_request[description]", with: nil
    click_on 'Create Budget request'
    expect(page).to have_content('can\'t be blank')
  end
end

RSpec.describe 'Displaying Points by Categories', type: :feature do
# Stub the google oauth by providing fake credentials
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.add_mock(:google_oauth2, {
        provider: 'google_oauth2',
        uid: '123456789',
        info: {
          email: 'test@example.com',
          name: 'Test User'
        },
        credentials: {
          token: 'token',
          refresh_token: 'refresh_token',
          expires_at: Time.now + 1.week
        }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'one point' do
    visit root_path
    expect(page.text).to include("Test Category 1    1")
  end

  scenario 'two points' do
    new_point = Point.create(admin_id: 5, point_category_id: 1, is_approved: true)

    visit new_point_path
    visit root_path
    expect(page.text).to include("Test Category 1    2")
  end
end 
