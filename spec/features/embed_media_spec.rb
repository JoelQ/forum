require 'spec_helper'

feature 'Embed media' do
  scenario 'image' do
    create_and_sign_in_user_with_roles('user')
    create_and_navigate_to_topic
    post_link_in_response_to_topic('https://www.google.com/images/srpr/logo3w.png')
    image_is_displayed_on_page 'https://www.google.com/images/srpr/logo3w.png'
  end


  scenario 'youtube video' do
    create_and_sign_in_user_with_roles('user')
    create_and_navigate_to_topic
    post_link_in_response_to_topic('http://www.youtube.com/watch?v=NSWOvw5N4nUs')
    youtube_video_is_embedded_on_page('NSWOvw5N4nUs')
  end

  scenario 'other link' do
    create_and_sign_in_user_with_roles('user')
    create_and_navigate_to_topic
    post_link_in_response_to_topic('http://www.google.com')
    link_is_displayed_on_page('http://www.google.com')
  end
end

def post_link_in_response_to_topic(link)
  click_link 'Post Reply'
  fill_in 'Content', with: "Check this out #{link} I think you will realy enjoy"
  click_button 'Create Post'
end

def image_is_displayed_on_page(url)
  page.should have_css("img[src='#{url}']")
end

def link_is_displayed_on_page(url)
  page.should have_css("a[href='#{url}']")
end

def youtube_video_is_embedded_on_page(video_id)
  page.should have_css("iframe[src='http://www.youtube.com/embed/#{video_id}']")
end
