require 'spec_helper'

describe Category do
  it { should validate_presence_of(:name) }
  it { should have_many(:topics).dependent(:destroy) }
  it { should have_many(:category_roles) }
  it { should have_many(:users).through(:category_roles) }
end
