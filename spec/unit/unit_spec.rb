# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(PointCategory, type: :model) do
  # Sunny cases

  subject do
    described_class.new(name: nil, value: nil)
  end

  it 'is valid with valid attributes' do
    subject.name = "Test Category 1"
    subject.value = 1
    expect(subject).to(be_valid)
  end

  it 'is valid with large integers' do
    subject.name = "Test Category 1"
    subject.value = 1_000_000
    expect(subject).to(be_valid)
  end

  it 'is valid with zero' do
    subject.name = "Test Category 1"
    subject.value = 0
    expect(subject).to(be_valid)
  end

  it 'is valid with more than 3 characters' do
    subject.name = 'Test'
    subject.value = 1
    expect(subject).to(be_valid)

    subject.name = 'Point'
    expect(subject).to(be_valid)
  end

  # Rainy cases

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with non-numeric value' do
    subject.name = 'Test'
    subject.value = 'hello'
    expect(subject).not_to(be_valid)

  end

  it 'is not valid with non-alphabetic value' do
    subject.name = 1
    subject.value = 1
    expect(subject).not_to(be_valid)

    subject.name = true
    expect(subject).not_to(be_valid)

    subject.name = 1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with negative value' do
    subject.name = 'Test'
    subject.value = -1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with float value' do
    subject.name = 'Test'
    subject.value = 1.1
    expect(subject).not_to(be_valid)

    subject.value = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with less than or equal to 3 characters' do
    subject.name = 'abc'
    subject.value = 1
    expect(subject).not_to(be_valid)

    subject.name = 'ab'
    expect(subject).not_to(be_valid)

    subject.name = 'b'
    expect(subject).not_to(be_valid)
  end

end

RSpec.describe(Member, type: :model) do
  subject do
    described_class.new(first_name: 'John', last_name: 'Smith', email: 'test@tamu.edu', phone: 1_234_567_890, role: 'member')
  end

  # Sunny Cases

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is valid with a valid email' do
    subject.email = 't@tamu.edu'
    expect(subject).to(be_valid)

    subject.email = 'a.a@tamu.edu'
    expect(subject).to(be_valid)
  end

  it 'is valid with a valid phone' do
    subject.phone = '1234567890'
    expect(subject).to(be_valid)

    subject.phone = '9999999999'
    expect(subject).to(be_valid)
  end

  it 'is valid with a valid role' do
    subject.role = 'member'
    expect(subject).to(be_valid)

    subject.role = 'leader'
    expect(subject).to(be_valid)

    subject.role = 'executive'
    expect(subject).to(be_valid)
  end

  # Rainy Cases

  it 'is not valid without a member first name' do
    subject.first_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a phone' do
    subject.phone = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a role' do
    subject.role = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with a non-valid email' do
    subject.email = 'test@'
    expect(subject).not_to(be_valid)

    subject.email = 'test'
    expect(subject).not_to(be_valid)

    subject.email = 'tamu.edu'
    expect(subject).not_to(be_valid)

    subject.email = '@'
    expect(subject).not_to(be_valid)

    subject.email = '.com'
    expect(subject).not_to(be_valid)

    subject.email = '@tamu.edu'
    expect(subject).not_to(be_valid)

    subject.email = 'test@tamu'
    expect(subject).not_to(be_valid)

    subject.email = 'test@.com'
    expect(subject).not_to(be_valid)

    subject.email = '!test@.com'
    expect(subject).not_to(be_valid)

    subject.email = 'test@gmail.com'
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a alphabetical email' do
    subject.email = 1
    expect(subject).not_to(be_valid)

    subject.email = true
    expect(subject).not_to(be_valid)

    subject.email = -1
    expect(subject).not_to(be_valid)

    subject.email = 1.1
    expect(subject).not_to(be_valid)

    subject.email = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a valid phone number' do
    subject.phone = '123'
    expect(subject).not_to(be_valid)

    subject.phone = '-123'
    expect(subject).not_to(be_valid)

    subject.phone = '0'
    expect(subject).not_to(be_valid)

    subject.phone = '1.1'
    expect(subject).not_to(be_valid)

    subject.phone = '-1.1'
    expect(subject).not_to(be_valid)

    subject.phone = '99999999'
    expect(subject).not_to(be_valid)

    subject.phone = '-99999999'
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a numerical phone number' do
    subject.phone = true
    expect(subject).not_to(be_valid)

    subject.phone = 'hello'
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a valid member role' do
    subject.role = 'test'
    expect(subject).not_to(be_valid)

    subject.role = 1
    expect(subject).not_to(be_valid)

    subject.role = -1
    expect(subject).not_to(be_valid)

    subject.role = 1.1
    expect(subject).not_to(be_valid)

    subject.role = -1.1
    expect(subject).not_to(be_valid)

    subject.role = true
    expect(subject).not_to(be_valid)

  end

end

RSpec.describe(Point, type: :model) do
  subject do
    described_class.new({admin_id: 1, point_category_id: 1, is_approved: true, description: "Big Event", photo: "https://via.placeholder.com/350x150", date_attended: "2023-03-09 20:14:17 UTC"})
  end

  # Sunny Cases

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is valid with a valid id' do
    subject.admin_id = 1
    expect(subject).to(be_valid)

    subject.point_category_id = 1
    expect(subject).to(be_valid)
  end

  it 'is valid with a valid description' do
    subject.description = 'Big Event'
    expect(subject).to(be_valid)
  end

  it 'is valid with a valid date' do
    subject.date_attended = '03/09/2023'
    expect(subject).to(be_valid)
  end

  # Rainy Cases

  it 'is not valid without a admin id' do
    subject.admin_id = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a point category id' do
    subject.point_category_id = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with a non integer point category id' do
    subject.point_category_id = 'hello'
    expect(subject).not_to(be_valid)

    subject.point_category_id = true
    expect(subject).not_to(be_valid)

    subject.point_category_id = 1.1
    expect(subject).not_to(be_valid)

    subject.point_category_id = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid point category id' do
    subject.point_category_id = -1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with a non integer admin id' do
    subject.admin_id = 'hello'
    expect(subject).not_to(be_valid)

    subject.admin_id = true
    expect(subject).not_to(be_valid)

    subject.admin_id = 1.1
    expect(subject).not_to(be_valid)

    subject.admin_id = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid admin id' do
    subject.admin_id = -1
    expect(subject).not_to(be_valid)
  end

end

RSpec.describe(BudgetRequest, type: :model) do
  subject do
    described_class.new(admin_id: 1, value: 2.5, phone: '123-435-7890', mailing_address: 'test address', mail_option: 'pick up', tamu_affiliation: 'student', requester_name: 'test name', description: 'test description', uin: 1234)
  end

  # Sunny Cases

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is valid with a valid admin id' do
    subject.admin_id = 1
    expect(subject).to(be_valid)

    expect(subject).to(be_valid)
  end

  it 'is valid with large values' do
    subject.value = 1_000_000
    expect(subject).to(be_valid)
  end

  it 'is valid with small values' do
    subject.value = 0.5
    expect(subject).to(be_valid)
  end

  it 'is valid with all mailing options' do
    subject.mail_option = 'sent to mailing address'
    expect(subject).to(be_valid)

    subject.mail_option = 'pick up'
    expect(subject).to(be_valid)

    subject.mail_option = 'direct deposit'
    expect(subject).to(be_valid)
  end

  it 'is valid with all tamu affiliations' do
    subject.tamu_affiliation = 'student'
    expect(subject).to(be_valid)

    subject.tamu_affiliation = 'employee'
    expect(subject).to(be_valid)

    subject.tamu_affiliation = 'unaffiliated'
    expect(subject).to(be_valid)
  end

  # Rainy Cases

  it 'is not valid without a admin id' do
    subject.admin_id = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with non-numeric value' do
    subject.value = 'hello'
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid value' do
    subject.value = -1
    expect(subject).not_to(be_valid)
    subject.value = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with a non integer admin id' do
    subject.admin_id = 'hello'
    expect(subject).not_to(be_valid)

    subject.admin_id = true
    expect(subject).not_to(be_valid)

    subject.admin_id = 1.1
    expect(subject).not_to(be_valid)

    subject.admin_id = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid admin id' do
    subject.admin_id = -1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with invalid phone' do
    subject.phone = nil
    expect(subject).not_to(be_valid)

    subject.phone = 'test'
    expect(subject).not_to(be_valid)

    subject.phone = -1
    expect(subject).not_to(be_valid)

    subject.phone = -1.1
    expect(subject).not_to(be_valid)

    subject.phone = 1.1
    expect(subject).not_to(be_valid)

    subject.phone = 1_122_323_323_232_323
    expect(subject).not_to(be_valid)

    subject.phone = 0o0000000
    expect(subject).not_to(be_valid)

    subject.phone = '9999999'
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with no mailing address' do
    subject.mailing_address = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid mailing option' do
    subject.mail_option = nil
    expect(subject).not_to(be_valid)

    subject.mail_option = 'test option'
    expect(subject).not_to(be_valid)

    subject.mail_option = 1
    expect(subject).not_to(be_valid)

    subject.mail_option = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid tamu affiliation' do
    subject.tamu_affiliation = nil
    expect(subject).not_to(be_valid)

    subject.tamu_affiliation = 'test option'
    expect(subject).not_to(be_valid)

    subject.tamu_affiliation = 1
    expect(subject).not_to(be_valid)

    subject.tamu_affiliation = -1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid name' do
    subject.requester_name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid description' do
    subject.description = 'test'
    expect(subject).not_to(be_valid)

    subject.description = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with an invalid uin' do
    subject.uin = 'test'
    expect(subject).not_to(be_valid)

    subject.uin = nil
    expect(subject).not_to(be_valid)

    subject.uin = -1
    expect(subject).not_to(be_valid)

    subject.uin = -1.1
    expect(subject).not_to(be_valid)

    subject.uin = 1.1
    expect(subject).not_to(be_valid)
  end

end

RSpec.describe(BudgetCategory, type: :model) do
  # Sunny cases

  subject do
    described_class.new(name: 'Category 1')
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is valid with more than 3 characters' do
    subject.name = 'Test'
    expect(subject).to(be_valid)

    subject.name = 'Point'
    expect(subject).to(be_valid)
  end

  # Rainy cases

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with non-alphabetic value' do
    subject.name = 1
    expect(subject).not_to(be_valid)

    subject.name = true
    expect(subject).not_to(be_valid)

    subject.name = 1.1
    expect(subject).not_to(be_valid)
  end

  it 'is not valid with less than or equal to 3 characters' do
    subject.name = 'abc'
    expect(subject).not_to(be_valid)

    subject.name = 'ab'
    expect(subject).not_to(be_valid)

    subject.name = 'b'
    expect(subject).not_to(be_valid)
  end

end
