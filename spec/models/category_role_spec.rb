require 'spec_helper'

describe CategoryRole do
  it { should belong_to(:user) }
  it { should belong_to(:category) }

  describe 'category banned for user' do
    it 'returns whether the category is banned' do
      user = create :user, id: 1
      role1 = create :category_role, user: user, banned: true
      role2 = create :category_role, user: user, banned: false
      CategoryRole.category_banned_for_user?(role1.category, user).should be_true
      CategoryRole.category_banned_for_user?(role2.category, user).should be_false
    end
  end
end
