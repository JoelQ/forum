class User < ActiveRecord::Base
  attr_accessible :username
  include Clearance::User

  # validate :username, exclusion: { in: [""] }
  # validate :username, presence: true, allow_nil: true
  # validate :username, length: { minimum: 1}, allow_nil: true

  validate :username_not_blank

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
