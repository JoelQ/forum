require 'spec_helper'

feature 'Deleting a category' do
  scenario 'as an admin' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user_with_roles('admin')
    delete_category 'Ruby on Rails'
    category_is_not_displayed 'Ruby on Rails'
  end
end

def delete_category(category_name)
  click_link "delete-#{category_name}"
end

def category_is_not_displayed(category_name)
  page.should_not have_content category_name
end
