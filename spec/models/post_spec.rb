require 'spec_helper'

describe Post do
  it { should belong_to(:topic) }
  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
end
