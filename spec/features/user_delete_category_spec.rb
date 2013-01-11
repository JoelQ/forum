require 'spec_helper'

feature 'Deleting a category' do
  scenario 'as a user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user_with_roles('user')
    delete_ui_is_not_displayed
  end
end

def delete_ui_is_not_displayed
  page.should_not have_content 'Delete'
end
