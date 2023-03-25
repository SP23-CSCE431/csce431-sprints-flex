# location: spec/feature/integration_spec.rb
require 'rails_helper'

# Test sign in procedure
RSpec.describe('Signing In', type: :feature) do
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
          expires_at: Time.zone.now + 1.week
        }
      })

      # First sign in
      visit new_admin_session_path
      click_link 'Sign in with Google'
      expect(page).to(have_content('Successfully authenticated from Google account'))
      click_link 'Sign Out'
      expect(page).to(have_content('Signed out successfully'))
  end
end

RSpec.describe('Creating a Member', type: :feature) do

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
        expires_at: Time.zone.now + 1.week
      }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'valid inputs' do
    visit new_member_path
    expect(page).to(have_content('New member'))
    fill_in "member[first_name]", with: 'John'
    fill_in "member[last_name]", with: 'Smith'
    fill_in "member[email]", with: 'test@tamu.edu'
    fill_in "member[phone]", with: 1_234_567_890
    fill_in "member[role]", with: 'executive'
    click_on 'Create Member'
    expect(page).to(have_content('Member was successfully created'))
    # expect(page).to have_content('John Smith')
    # expect(page).to have_content('test@tamu.edu')
    # expect(page).to have_content('1234567890')
    # expect(page).to have_content('executive')
    click_on 'Destroy this member'
    expect(page).to(have_content('Member was successfully destroyed'))
  end

  scenario 'invalid inputs' do
    visit new_member_path
    fill_in "member[first_name]", with: ''
    fill_in "member[last_name]", with: ''
    fill_in "member[email]", with: ''
    fill_in "member[phone]", with: ''
    fill_in "member[email]", with: ''
    click_on 'Create Member'
    expect(page).to(have_content('can\'t be blank'))
  end
end

RSpec.describe('Creating a Point Category', type: :feature) do
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
        expires_at: Time.zone.now + 1.week
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
    expect(page).to(have_content('Point category was successfully created.'))
    expect(page).to(have_content('Test Category'))
    expect(page).to(have_content('1'))
    click_on 'Destroy this point category'
    expect(page).to(have_content('Point category was successfully destroyed.'))
  end

  scenario 'invalid inputs' do
    visit new_point_category_path
    fill_in "point_category[name]", with: ''
    fill_in "point_category[value]", with: nil
    click_on 'Create Point category'
    expect(page).to(have_content('can\'t be blank'))
  end
end

RSpec.describe('Creating a Point', type: :feature) do
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
        expires_at: Time.zone.now + 1.week
      }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'valid inputs' do

    visit new_point_path
    select "Test Category 1", from: "point[point_category_id]"
    point_category_select = find('#point_point_category_id')
    point_category_select.set('Test Category 1')
    fill_in "point[date_attended]", with: '2023-10-10'
    fill_in "point[description]", with: 'Test'
    click_on 'Create Point'
    expect(page).to(have_content('Point was successfully created'))
    expect(page).to(have_content('Test Category 1'))
    click_on 'Destroy this point'
    expect(page).to(have_content('Point was successfully destroyed'))
  end

  scenario 'invalid inputs' do
    visit new_point_path
    point_category_select = find('#point_point_category_id')
    point_category_select.set('')
    fill_in "point[date_attended]", with: ''
    fill_in "point[description]", with: ''
    click_on 'Create Point'
    expect(page).to(have_content('can\'t be blank'))
  end
end

RSpec.describe('Creating a Budget Category', type: :feature) do
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
        expires_at: Time.zone.now + 1.week
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
    expect(page).to(have_content('Budget category was successfully created.'))
    expect(page).to(have_content('Test Category'))
    click_on 'Destroy this budget category'
    expect(page).to(have_content('Budget category was successfully destroyed.'))
  end

  scenario 'invalid inputs' do
    visit new_budget_category_path
    fill_in "budget_category[name]", with: ''
    click_on 'Create Budget category'
    expect(page).to(have_content('can\'t be blank'))
  end
end

RSpec.describe('Creating a Budget Request', type: :feature) do
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
        expires_at: Time.zone.now + 1.week
      }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'valid inputs' do
    visit new_budget_request_path
    select "Test Category", from: "budget_request[budget_category_id]"
    fill_in "budget_request[value]", with: 2
    fill_in "budget_request[description]", with: 'Test'
    click_on 'Create Budget request'
    expect(page).to(have_content('Budget request was successfully created.'))
    expect(page).to(have_content('2'))
    expect(page).to(have_content('Test'))
    click_on 'Destroy this budget request'
    expect(page).to(have_content('Budget request was successfully destroyed.'))
  end

  scenario 'invalid inputs' do
    visit new_budget_request_path
    fill_in "budget_request[value]", with: nil
    fill_in "budget_request[description]", with: nil
    click_on 'Create Budget request'
    expect(page).to(have_content('can\'t be blank'))
  end
end

RSpec.describe('Displaying Points by Categories', type: :feature) do
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
        expires_at: Time.zone.now + 1.week
      }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'one point' do
    visit root_path
    expect(page.text).to(include('Test Category 1    1'))
  end

  scenario 'two points' do
    Point.create(admin_id: 5, point_category_id: 1, is_approved: true)
    visit new_point_path
    visit root_path
    expect(page.text).to(include('Test Category 1    2'))
  end
end

RSpec.describe('Help Documentation is available', type: :feature) do
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
        expires_at: Time.zone.now + 1.week
      }
    })

    # First sign in
    visit new_admin_session_path
    click_link 'Sign in with Google'
  end

  scenario 'Help Link is avaliable' do
    visit root_path
    expect(page).to(have_content("Help"))
  end

  scenario 'Help Link leads to documentation' do
    click_link 'Help'
    expect(page).to(have_content('Quick Start Guide'))
  end

  scenario 'Has "How to create point" section' do
    expect(page).to(have_content('Adding a New Point'))
  end

  scenario 'Has "Create a Point Category" section' do
    expect(page).to(have_content('Creating a Point Category'))
  end

  scenario 'Has "Adding a New Member" section' do
    expect(page).to(have_content('Adding a New Member'))
  end

  scenario 'Has "Approving Points" section' do
    expect(page).to(have_content('How to Approve Points'))
  end

  scenario 'Has "Understand Your Points" section' do
    expect(page).to(have_content('Understand Your Points'))
  end

  scenario 'Has "Create a Reimbursement Request" section' do
    expect(page).to(have_content('Create a Reimbursement Request'))
  end

  scenario 'Has "Approve a Reimbursement Request" section' do
    expect(page).to(have_content('Approve a Reimbursement Request'))
  end
end