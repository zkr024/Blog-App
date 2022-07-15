require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Adriana', photo: 'https://...', bio: 'psychologist from Colombia') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post_counter should be an integer' do
    type = subject.post_counter.class
    expect(type).to eq(Integer)
  end

  it 'test' do
    post = Post.create(author_id: subject.id, title: 'Hi', text: 'test')
    expect(subject.recent_three_posts).to eq([post])
  end
end
