require 'spec_helper'

feature 'Creating acategory' do
  scenario 'as a user' do
   create_and_sign_in_user
   create_new_category_called 'Web Development'
   see_category_on_home_page 'Web Development'
  end

  def create_new_category_called(category_name)
   click_link 'New Category'
   fill_in 'Name', with: category_name
   click_button 'Create Category'
  end

  def see_category_on_home_page(category_name)
   page.should have_content 'Web Development'
  end
end
