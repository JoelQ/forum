class Category < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :name, presence: true
  has_many :topics, dependent: :destroy
end
