require 'spec_helper'

feature 'creating topic' do
  scenario 'user' do
    create :category, name: 'Ruby on Rails'
    create_and_sign_in_user
    click_link 'Ruby on Rails'
    click_link 'New Topic'
    fill_in 'Name', with: 'Integration Testing'
    fill_in 'Content', with: 'Integration Testing is great... blah blah blah'
    click_button 'Create Topic'
    page.should have_content 'Integration Testing'
  end
end

feature 'updating topic' do
  scenario 'user' do
    category = create :category, name: 'Ruby on Rails'
    create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user
    click_link 'Ruby on Rails'
    click_link 'Edit'
    fill_in 'Name', with: 'Unit Testing'
    click_button 'Update Topic'
    page.should have_content 'Unit Testing'
  end
end

feature 'deleting topic' do
  scenario 'user' do
    category = create :category, name: 'Ruby on Rails'
    create :topic, name: 'Integration Testing', category: category
    create_and_sign_in_user
    click_link 'Ruby on Rails'
    click_link 'Delete'
    page.should_not have_content 'Integration Testing'
  end
end
