require 'spec_helper'

feature 'Editing a category' do
  scenario 'as an admin' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user_with_roles('admin')
    change_category_to 'Javascript'
    new_name_is_displayed 'Javascript'
  end
end

def change_category_to(name)
  click_link 'Update Category'
  fill_in 'Name', with: name
  click_button 'Update Category'
end

def new_name_is_displayed(name)
  page.should have_content name
end
