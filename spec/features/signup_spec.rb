require 'spec_helper'

feature "Signing up" do

  scenario "new user" do
    visit '/users/new'
    save_and_open_page
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "password"
    click_button "Sign up"
    page.should have_content "Success"
  end
end
