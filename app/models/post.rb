class Post < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :content, presence: true
  belongs_to :topic
  belongs_to :user
  before_save :parse_content

  scope :for_activity_feed, select('posts.*, users.username AS author_name').joins(:user).order('created_at DESC').limit(5)

  private

  def parse_content
    parser = MediaEmbedder::Parser.new(content)
    self.processed_content = parser.parse_links
  end
end
