class Topic < ActiveRecord::Base
  attr_accessible :category_id, :content, :name
  validates_presence_of :name
  belongs_to :category
  belongs_to :user
  has_many :posts, dependent: :destroy

  def truncate_content(word_count)
    content.split[0..(word_count - 1)].join(' ') << ' ...'
  end
end
