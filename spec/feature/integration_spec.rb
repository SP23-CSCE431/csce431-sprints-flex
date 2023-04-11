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
    visit new_admin_path
    expect(page).to(have_content('New member'))
    fill_in "admin[full_name]", with: 'John'
    fill_in "admin[email]", with: 'test@tamu.edu'
    fill_in "admin[phone]", with: 1_234_567_890
    select "Member", from: "admin[role]"
    click_on 'Submit'
    expect(page).to(have_content('Member was successfully created'))
    # expect(page).to have_content('John Smith')
    # expect(page).to have_content('test@tamu.edu')
    # expect(page).to have_content('1234567890')
    # expect(page).to have_content('executive')
    click_on 'Delete this Member'
    expect(page).to(have_content('Member was successfully destroyed'))
  end

  scenario 'invalid inputs' do
    visit new_admin_path
    fill_in "admin[full_name]", with: ''
    fill_in "admin[email]", with: ''
    fill_in "admin[phone]", with: ''
    click_on 'Submit'
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

RSpec.describe('Deleting All Points', type: :feature) do
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
    click_on 'Send'

    visit new_point_path
    select "Test Category 1", from: "point[point_category_id]"
    point_category_select = find('#point_point_category_id')
    point_category_select.set('Test Category 1')
    fill_in "point[date_attended]", with: '2023-10-10'
    fill_in "point[description]", with: 'Test 2'
    click_on 'Send'

    visit points_path
    click_on 'Delete All Points'
    expect(page).to(have_content('All points have been successfully deleted.'))
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
    fill_in "point[photo]", with: 'https://test.com'
    click_on 'Send'
    expect(page).to(have_content('Point added for review'))
    expect(page).to(have_content('Test Category 1'))
  end

  scenario 'invalid inputs' do
    visit new_point_path
    point_category_select = find('#point_point_category_id')
    point_category_select.set('')
    fill_in "point[date_attended]", with: ''
    fill_in "point[description]", with: ''
    click_on 'Send'
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
    fill_in "budget_request[value]", with: 2
    fill_in "budget_request[phone]", with: '123-456-7890'
    fill_in "budget_request[description]", with: 'description'
    fill_in "budget_request[mailing_address]", with: 'address'
    fill_in "budget_request[uin]", with: 123456789
    fill_in "budget_request[requester_name]", with: 'name'
    click_on 'Submit'
    expect(page).to(have_content('Reimbursement request was successfully created.'))
    expect(page).to(have_content('2'))
    expect(page).to(have_content('description'))
    click_on 'Delete this Reimbursement Request'
    expect(page).to(have_content('Reimbursement request was successfully deleted.'))
  end

  scenario 'invalid inputs' do
    visit new_budget_request_path
    fill_in "budget_request[value]", with: nil
    fill_in "budget_request[phone]", with: nil
    fill_in "budget_request[description]", with: nil
    fill_in "budget_request[mailing_address]", with: nil
    fill_in "budget_request[uin]", with: nil
    fill_in "budget_request[requester_name]", with: nil
    click_on 'Submit'
    expect(page).to(have_content('can\'t be blank'))
  end
end

RSpec.describe('Deleting All Budget Requests', type: :feature) do
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
    fill_in "budget_request[value]", with: 2
    fill_in "budget_request[phone]", with: '123-456-7890'
    fill_in "budget_request[description]", with: 'description'
    fill_in "budget_request[mailing_address]", with: 'address'
    fill_in "budget_request[uin]", with: 123456789
    fill_in "budget_request[requester_name]", with: 'name'
    click_on 'Submit'

    visit new_budget_request_path
    fill_in "budget_request[value]", with: 3
    fill_in "budget_request[phone]", with: '999-999-9999'
    fill_in "budget_request[description]", with: 'description 2'
    fill_in "budget_request[mailing_address]", with: 'address 2'
    fill_in "budget_request[uin]", with: 111111111
    fill_in "budget_request[requester_name]", with: 'name 2'
    click_on 'Submit'

    visit budget_requests_path
    click_on 'Delete All Reimbursement Requests'
    expect(page).to(have_content('All reimbursement requests have been successfully deleted.'))
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
    expect(page.text).to(include('Test Category 1'))
    expect(page.text).to(include('1'))
  end

  scenario 'two points' do
    Point.create(admin_id: 5, point_category_id: 1, is_approved: true)
    visit new_point_path
    visit root_path
    expect(page.text).to(include('Test Category 1'))
    expect(page.text).to(include('2'))
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
    visit help_index_path
    expect(page.text).to(include('Adding a New Point'))
  end

  scenario 'Has "Create a Point Category" section' do
    visit help_index_path
    expect(page).to(have_content('Creating a Point Category'))
  end

  scenario 'Has "Adding a New Member" section' do
    visit help_index_path
    expect(page).to(have_content('Adding a New Member'))
  end

  scenario 'Has "Approving/Denying Points" section' do
    visit help_index_path
    expect(page).to(have_content('Approve and Deny Points'))
  end

  scenario 'Has "Understand Your Points" section' do
    visit help_index_path
    expect(page).to(have_content('Understand Your Points'))
  end

  scenario 'Has "Create a Reimbursement Request" section' do
    visit help_index_path
    expect(page).to(have_content('Create a Reimbursement Request'))
  end

  scenario 'Has "Approve/Deny a Reimbursement Request" section' do
    visit help_index_path
    expect(page).to(have_content('Reviewing Reimbursement Requests'))
  end
end

RSpec.describe('Budget Reimbursment Review', type: :feature) do
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

  scenario 'Page Exists' do
    visit budget_reviews_path
    expect(page).to(have_content('Reimbursement Requests'))
  end

  scenario 'New Budget Request Arrives' do
    visit new_budget_request_path
    fill_in "budget_request[value]", with: 2
    fill_in "budget_request[phone]", with: '123-456-7890'
    fill_in "budget_request[description]", with: 'description'
    fill_in "budget_request[mailing_address]", with: 'address'
    fill_in "budget_request[uin]", with: 123456789
    fill_in "budget_request[requester_name]", with: 'name'
    click_on 'Submit'
    visit budget_reviews_path
    expect(page).to(have_content('Reimbursement Requests'))
    expect(page).to(have_content('2'))
    expect(page).to(have_content('description'))
    expect(page).to(have_content('address'))
    expect(page).to(have_content('name'))
    expect(page).to(have_content('123-456-7890'))
    expect(page).to(have_content('123456789'))
  end

  scenario 'Approve Request' do
    visit new_budget_request_path
    fill_in "budget_request[value]", with: 2
    fill_in "budget_request[phone]", with: '123-456-7890'
    fill_in "budget_request[description]", with: 'description'
    fill_in "budget_request[mailing_address]", with: 'address'
    fill_in "budget_request[uin]", with: 123456789
    fill_in "budget_request[requester_name]", with: 'name'
    click_on 'Submit'
    visit budget_reviews_path
    click_link 'Approve'

    request = BudgetRequest.find_by(admin_id: 5)
    expect(request).to(have_attributes(is_approved: true))
  end

  scenario 'Deny Request' do
    visit new_budget_request_path
    fill_in "budget_request[value]", with: 2
    fill_in "budget_request[phone]", with: '123-456-7890'
    fill_in "budget_request[description]", with: 'description'
    fill_in "budget_request[mailing_address]", with: 'address'
    fill_in "budget_request[uin]", with: 123456789
    fill_in "budget_request[requester_name]", with: 'name'
    click_on 'Submit'
    visit budget_reviews_path
    click_link 'Deny'
    
    request = BudgetRequest.find_by(admin_id: 5)
    expect(request).to(have_attributes(is_approved: false))
  end
end
