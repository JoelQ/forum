class Topic < ActiveRecord::Base
  attr_accessible :category_id, :content, :name
  validates_presence_of :name
  belongs_to :category
end
