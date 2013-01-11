require 'spec_helper'

describe User do
  it { should have_many(:posts) }
  it { should have_many(:topics) }
  it { should validate_presence_of(:username) }

  context 'check if it has the specified role' do
    let(:user) { create :user, roles: ['admin', 'moderator'] }
    it 'returns true when the role is present' do
      user.has_role?(:admin).should be_true
    end

    it 'returns false when the role is not present' do
      user.has_role?(:user).should_not be_true
    end
  end
end
