require 'spec_helper'
require 'clearance/testing'

describe TopicsController do

  describe 'Permissions' do
    context 'Admin' do
      before do
        user = create :user, roles: ['admin']
        sign_in_as user
        @category = create :category
      end

      it 'can view the index' do
        get :index, category_id: @category.id
        response.should be_success
      end

      it 'can view the new page' do
        get :new, category_id: @category.id
        response.should be_success
      end

      it 'can create a new topic' do
        post :create, category_id: @category.id
        response.code.should_not eq '401'
      end

      it 'can view the edit page' do
        topic = create :topic, category: @category
        get :edit, category_id: @category.id, id: topic.id
        response.should be_success
      end

      it 'can update a topic' do
        topic = create :topic, category: @category
        put :update, category_id: @category.id, id: topic.id
        response.code.should_not eq '401'
      end

      it 'can delete a topic' do
        topic = create :topic, category: @category
        delete :destroy, category_id: @category.id, id: topic.id
        response.code.should_not eq '401'
      end
    end

    context 'User' do
      before do
        @user = create :user, roles: ['user']
        @category = create :category
        sign_in_as @user
      end

      context 'when banned from category' do
        before { create :category_role, banned: true, category: @category, user: @user }

        it 'cannot view the index' do
          get :index, category_id: @category.id
          response.code.should eq '401'
        end

        it 'cannot view the new page' do
          get :new, category_id: @category.id
          response.code.should eq '401'
        end

        it 'cannot create a new topic' do
          post :create, category_id: @category.id
          response.code.should eq '401'
        end

        it 'cannot view the edit page' do
          topic = create :topic, category: @category
          get :edit, category_id: @category.id, id: topic.id
          response.code.should eq '401'
        end

        it 'cannot update a topic' do
          topic = create :topic, category: @category
          put :update, category_id: @category.id, id: topic.id
          response.code.should eq '401'
        end

        it 'cannot delete a topic' do
          topic = create :topic, category: @category
          delete :destroy, category_id: @category.id, id: topic.id
          response.code.should eq '401'
        end
      end

      context 'when not banned from category' do
        it 'can view the index' do
          get :index, category_id: @category.id
          response.should be_success
        end

        it 'can view the new page' do
          get :new, category_id: @category.id
          response.should be_success
        end

        it 'can create a new topic' do
          post :create, category_id: @category.id
          response.code.should_not eq '401'
        end

        it 'can view the edit page' do
          topic = create :topic, category: @category
          get :edit, category_id: @category.id, id: topic.id
          response.should be_success
        end

        it 'can update a topic' do
          topic = create :topic, category: @category
          put :update, category_id: @category.id, id: topic.id
          response.code.should_not eq '401'
        end

        it 'cannot delete a topic' do
          topic = create :topic, category: @category
          delete :destroy, category_id: @category.id, id: topic.id
          response.code.should eq '401'
        end
      end
    end

    context 'Guest' do
      before do
        sign_out
        @category = create :category
      end

      it 'cannot view the index' do
        get :index, category_id: @category.id
        response.code.should eq '401'
      end

      it 'cannot view the new page' do
        get :new, category_id: @category.id
        response.code.should eq '401'
      end

      it 'cannot create a new topic' do
        post :create, category_id: @category.id
        response.code.should eq '401'
      end

      it 'cannot view the edit page' do
        topic = create :topic, category: @category
        get :edit, category_id: @category.id, id: topic.id
        response.code.should eq '401'
      end

      it 'cannot update a topic' do
        topic = create :topic, category: @category
        put :update, category_id: @category.id, id: topic.id
        response.code.should eq '401'
      end

      it 'cannot delete a topic' do
        topic = create :topic, category: @category
        delete :destroy, category_id: @category.id, id: topic.id
        response.code.should eq '401'
      end

    end
  end
end
