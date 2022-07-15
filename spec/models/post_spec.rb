require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, title: 'Hi', text: 'test') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title cannot be more tnan 250 length' do
    word = ['title'] * 51 * ''
    subject.title = word
    expect(subject).to_not be_valid
  end

  it 'comments counter cannot be a string' do
    subject.comments_counter = 'here'
    expect(subject).to_not be_valid
  end

  it 'likes counter must be equal or greater than 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post_counter increments after creating a post' do
    user = User.create(name: 'Adriana', photo: 'https://...', bio: 'psychologist from Colombia')
    post = Post.create(author_id: user.id, title: 'Hi', text: 'test')
    expect(post.user.post_counter).to eq 1
  end
end
