require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:name) }
  it { should belong_to(:category) }
  it { should belong_to(:user) }
  it { should have_many(:posts).dependent(:destroy) }

  context 'truncating content' do
    let(:topic) { create :topic, name: 'Integration Testing', content: 'Integration testing (sometimes called Integration and Testing, abbreviated "I&T") is the phase in software testing in which individual software modules are combined and tested as a group. It occurs after unit testing and before validation testing. Integration testing takes as its input modules that have been unit tested, groups them in larger aggregates, applies tests defined in an integration test plan to those aggregates, and delivers as its output the integrated system ready for system testing.' }

    it 'truncates content to the desired length' do
      topic.truncate_content(2).should eq  'Integration testing ...'
      topic.truncate_content(5).should eq 'Integration testing (sometimes called Integration ...'
    end
  end
end
