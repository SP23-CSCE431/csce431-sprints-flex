# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe PointCategory, type: :model do
  subject do
    described_class.new(name: 'Category 1', value: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Member, type: :model do
  subject do
    described_class.new(first_name: "John", last_name: "Smith", email: "test@tamu.edu", phone: "123456789", role: "member")
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a member first name' do
    subject.first_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a phone' do
    subject.phone = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a role' do
    subject.role = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Point, type: :model do
  subject do
    described_class.new(member_id: 1, point_category_id: 1, is_approved: false)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a member id' do
    subject.member_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a point category id' do
    subject.point_category_id = nil
    expect(subject).not_to be_valid
  end

end
