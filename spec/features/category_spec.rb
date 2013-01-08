require 'spec_helper'

feature 'categories' do
  scenario 'creating' do
   create_and_sign_in_user
   click_link 'New Category'
   fill_in 'Name', with: 'Web Development'
   click_button 'Create Category'
   page.should have_content 'Web Development'
  end

  scenario 'editing' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    click_link 'Edit'
    fill_in 'Name', with: 'Rails Issues'
    click_button 'Update Category'
    page.should have_content 'Rails Issues'
  end

  scenario 'destroying' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    click_link 'Delete'
    page.should_not have_content 'Ruby on Rails'
  end
end
