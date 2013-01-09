require 'spec_helper'

describe User do
  it { should have_many(:posts) }
  it { should have_many(:topics) }

  it 'allows nil usernames' do
    user = create(:user)
    user.username = nil
    user.should be_valid
  end

  it 'allows strings as usernames' do
    user = create(:user)
    user.username = 'username'
    user.should be_valid
  end

  it 'does now allow an empty string for username' do
    user = create(:user)
    user.username = ''

    user.should_not be_valid
  end

  context "username or email" do
    let(:user) { create :user }
    it 'falls back to email if there is no username' do
      user.username_or_email.should eq user.email
    end

    it 'returns the username if there is one' do
      user.username = 'username'
      user.username_or_email.should eq user.username
    end
  end
end
