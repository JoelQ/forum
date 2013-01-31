require 'spec_helper'
require 'clearance/testing'

describe PostsController do
  describe 'Permissions' do
    context 'Admin' do
      before do
        user = create :user, roles: ['admin']
        sign_in_as user
        @topic = create :topic
      end

      it 'can view the index' do
        get :index, topic_id: @topic.id
        response.should be_success
      end

      it 'can create a new post' do
        post :create, topic_id: @topic.id
        response.code.should_not eq '401'
      end

      it 'can view the edit page' do
        post = create :post, topic: @topic
        get :edit, topic_id: @topic.id, id: post.id
        response.should be_success
      end

      it 'can update a post' do
        post = create :post, topic: @topic
        put :update, topic_id: @topic.id, id: post.id, post: attributes_for(:post)
        response.code.should_not eq '401'
      end

      it 'can delete a post' do
        post = create :post, topic: @topic
        delete :destroy, topic_id: @topic.id, id: post.id
        response.code.should_not eq '401'
      end
    end
    context 'User' do
    end
    context 'Guest' do
    end
  end
end
