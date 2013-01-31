require 'spec_helper'

feature 'Banned User' do
  scenario 'cannot create a topic' do
    user = create_and_sign_in_user_with_roles('user')
    category = create_and_navigate_to_category('Ruby on Rails')
    ban_user_from_category(user, category)
    page.should_not have_link('Create Topic')
  end
end

def ban_user_from_category(user, category)
  create :category_role, user: user, category: category, banned: true
end
