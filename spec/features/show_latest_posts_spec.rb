require 'spec_helper'

feature 'Display latest posts', js: true do
  scenario 'when no posts' do
    create(:category, name: 'Testing')
    create_and_sign_in_user_with_roles('user')
    click_link 'Testing'
    post_feed_is_empty
    post_feed_updates_on_post_creation
  end
end

def post_feed_is_empty
  find("#posts").should have_content('')
end

def post_feed_updates_on_post_creation
  post = create(:post)
  sleep ENV['POLL_INTERVAL_IN_MS'].to_i/1000.0
  find("#posts").should have_content(post.user.username)
end
