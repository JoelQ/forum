require 'spec_helper'

feature 'Embed media' do
  scenario 'image' do
    create_and_sign_in_user_with_roles('user')
    create_and_navigate_to_topic
    post_image_link_in_response_to_topic('https://www.google.com/images/srpr/logo3w.png')
    image_is_displayed_on_page 'https://www.google.com/images/srpr/logo3w.png'
  end
end

def post_image_link_in_response_to_topic(image)
  click_link 'Post Reply'
  fill_in 'Content', with: image
  click_button 'Create Post'
end

def image_is_displayed_on_page(url)
  page.should have_css("img[src='#{url}']")
end
