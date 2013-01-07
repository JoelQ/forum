require 'spec_helper'

describe User do
  let(:user) { create :user }
  it 'falls back to email if there is no username' do
    user.username_or_email.should eq user.email
  end

  it 'returns the username if there is one' do
    user.username = 'username'
    user.username_or_email.should eq user.username
  end
end
