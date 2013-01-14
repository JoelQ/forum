module Features
  def set_up_topic
    @category = create :category, name: 'Ruby on Rails'
    @topic = create :topic, name: 'Integration Testing', category: @category
  end

  def navigate_to_topic(category_name, topic_name)
    click_link category_name
    click_link topic_name
  end

  def create_and_navigate_to_topic
    category = create :category
    topic = create :topic, category: category
    visit categories_path
    navigate_to_topic category.name, topic.name
  end
end
