require 'spec_helper'

feature 'Display latest posts', js: true do
  scenario 'when no posts' do
    create_and_sign_in_user_with_roles('user')
    visit categories_path
    find("#posts").should have_content('')
    post = create(:post)
    sleep ENV['POLL_INTERVAL'].to_i/1000.0
    find("#posts").should have_content(post.user.username)
  end
end
