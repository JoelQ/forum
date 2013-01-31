class Category < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :name, presence: true
  has_many :topics, dependent: :destroy
  has_many :category_roles
  has_many :users, through: :category_roles
end
