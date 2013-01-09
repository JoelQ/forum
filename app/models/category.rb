class Category < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :topics, dependent: :destroy
end
