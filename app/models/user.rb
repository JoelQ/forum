class User < ActiveRecord::Base
  attr_accessible :username
  include Clearance::User

  def username_or_email
    username || email
  end
end
