class User < ActiveRecord::Base
  attr_accessible :username
  include Clearance::User

  has_many :posts
  has_many :topics
  validates :username, presence: true

  def has_role?(role)
    roles.include? role.to_s
  end
end
