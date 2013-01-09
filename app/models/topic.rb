class Topic < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :name, presence: true
  belongs_to :category
  belongs_to :user
  has_many :posts, dependent: :destroy
end
