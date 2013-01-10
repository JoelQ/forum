require 'spec_helper'

feature 'Creating acategory' do
  scenario 'as a user' do
   create_and_sign_in_user
   click_link 'New Category'
   fill_in 'Name', with: 'Web Development'
   click_button 'Create Category'
   page.should have_content 'Web Development'
  end
end
