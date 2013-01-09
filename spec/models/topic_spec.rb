require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:name) }
  it { should belong_to(:category) }
  it { should belong_to(:user) }
  it { should have_many(:posts).dependent(:destroy) }

end
