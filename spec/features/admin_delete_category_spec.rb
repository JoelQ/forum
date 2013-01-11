require 'spec_helper'

feature 'Deleting a category' do
  scenario 'as an admin' do
    category = create :category, name: 'Ruby on Rails'
    create_and_sign_in_user_with_roles('admin')
    delete_category category
    category_is_not_displayed 'Ruby on Rails'
  end
end

def delete_category(category)
  click_link "delete-#{category.id}"
end

def category_is_not_displayed(category_name)
  page.should_not have_content category_name
end
