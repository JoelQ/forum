class CategoryRole < ActiveRecord::Base
  attr_accessible :banned, :category_id, :moderator, :user_id
  belongs_to :user
  belongs_to :category

  def self.category_banned_for_user?(category, user)
    where(user_id: user.id, banned: true, category_id: category.id).present?
  end
end
