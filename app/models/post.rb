class Post < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :content, presence: true
  belongs_to :topic
  belongs_to :user
end
