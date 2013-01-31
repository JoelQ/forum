require 'spec_helper'
require 'clearance/testing'

describe CategoriesController do
  describe 'Permissions' do
    context 'Admin' do
      before do
        user = create :user, roles: ['admin']
        sign_in_as user
      end
      it 'can view the index' do
        get :index
        response.should be_success
      end

      it 'can view the edit page' do
        category = create :category
        get :edit, id: category.id
        response.should be_success
      end

      it 'can update a category' do
        category = create :category
        put :update, id: category.id
        response.code.should_not eq '401'
      end

      it 'can view the new page' do
        get :new
        response.should be_success
      end

      it 'can create a new category' do
        post :create
        response.code.should_not eq '401'
      end

      it 'can destroy a category' do
        category = create :category
        delete :destroy, id: category.id
        response.code.should_not eq '401'
      end

    end

    context 'User' do
      before do
        user = create :user, roles: ['user']
        sign_in_as user
      end

      it 'can view the index' do
        get :index
        response.should be_success
      end

      it 'cannot view the edit page' do
        category = create :category
        get :edit, id: category.id
        response.code.should eq '401'
      end

      it 'cannot update a category' do
        category = create :category
        put :update, id: category.id
        response.code.should eq '401'
      end

      it 'cannot view the new page' do
        get :new
        response.code.should eq '401'
      end

      it 'cannot create a new category' do
        post :create
        response.code.should eq '401'
      end

      it 'cannot destroy a category' do
        category = create :category
        delete :destroy, id: category.id
        response.code.should eq '401'
      end
    end

    context 'Guest' do
      before { sign_out }
      it 'can view the index' do
        get :index
        response.should be_success
      end

      it 'cannot view the edit page' do
        category = create :category
        get :edit, id: category.id
        response.code.should eq '401'
      end

      it 'cannot update a category' do
        category = create :category
        put :update, id: category.id
        response.code.should eq '401'
      end

      it 'cannot view the new page' do
        get :new
        response.code.should eq '401'
      end

      it 'cannot create a new category' do
        post :create
        response.code.should eq '401'
      end

      it 'cannot destroy a category' do
        category = create :category
        delete :destroy, id: category.id
        response.code.should eq '401'
      end
    end
  end
end
