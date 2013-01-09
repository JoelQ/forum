class User < ActiveRecord::Base
  attr_accessible :username
  include Clearance::User

  validate :username_not_blank
  has_many :posts
  has_many :topics

  def username_or_email
    username || email
  end

  private

  def username_not_blank
    if username == ''
      self.errors.add :base, 'Username can not be an empty string'
    end
  end
end
