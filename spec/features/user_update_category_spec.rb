require 'spec_helper'

feature 'Editing a category' do
  scenario 'as a user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user_with_roles('user')
    edit_ui_is_not_displayed
  end
end

def edit_ui_is_not_displayed
  page.should_not have_content 'Edit'
end
