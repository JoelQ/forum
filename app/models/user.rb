class User < ActiveRecord::Base
  attr_accessible :username
  include Clearance::User

  has_many :posts
  has_many :topics
  has_many :category_roles
  has_many :categories, through: :category_roles
  validates :username, presence: true

  def has_role?(role)
    roles.include? role.to_s
  end
end
