require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'instance methods' do
    describe '#generate_api_key' do
      let(:user) { User.create!(email: "baston@example.com", password: "password", password_confirmation: "password") }
      it 'generates an api key on creation' do
        expect(user.api_key).to be_present
      end
    end
  end
end