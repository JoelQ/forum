class Topic < ActiveRecord::Base
  attr_accessible :category_id, :content, :name
  validates_presence_of :name
  belongs_to :category

  def truncate_content(word_count)
    content.split[0..(word_count - 1)].join(' ') << ' ...'
  end
end
