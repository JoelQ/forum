require 'spec_helper'

feature 'Creating acategory' do
  scenario 'as a user' do
    create_and_sign_in_user_with_roles('user')
    user_does_not_see_creation_ui
  end

  def user_does_not_see_creation_ui
   page.should_not have_content 'New Category'
  end

end
