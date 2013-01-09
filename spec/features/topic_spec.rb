require 'spec_helper'

feature 'view list of topics' do
  scenario 'user' do
    category = create :category, name: 'Ruby on Rails'
    create :topic, name: 'Integration Testing', category: category, content: 'Integration testing (sometimes called Integration and Testing, abbreviated "I&T") is the phase in software testing in which individual software modules are combined and tested as a group. It occurs after unit testing and before validation testing. Integration testing takes as its input modules that have been unit tested, groups them in larger aggregates, applies tests defined in an integration test plan to those aggregates, and delivers as its output the integrated system ready for system testing.'
    create_and_sign_in_user
    click_link 'Ruby on Rails'
    page.should have_content 'Integration Testing'
    page.should have_content 'Integration testing (sometimes called Integration and Testing,...'
  end
end


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
