# Enable test mode
OmniAuth.config.test_mode = true

# Create fake oatuh token
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
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
