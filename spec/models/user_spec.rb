require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Todo model
  it { should have_and_belong_to_many(:todos) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_length_of(:name).is_at_least(4) }
end
