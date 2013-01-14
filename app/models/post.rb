class Post < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :content, presence: true
  belongs_to :topic
  belongs_to :user
  before_save :parse_content

  private

  def parse_content
    parser = MediaParser.new(content)
    self.processed_content = parser.parse_links
  end
end
