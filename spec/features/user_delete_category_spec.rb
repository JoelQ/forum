require 'spec_helper'

feature 'Deleting a category' do
  scenario 'as a user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    delete_category
    category_is_not_displayed 'Ruby on Rails'
  end
end

def delete_category
  click_link 'Delete'
end

def category_is_not_displayed(category_name)
  page.should_not have_content category_name
end
