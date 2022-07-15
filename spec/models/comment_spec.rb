require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Adriana', photo: 'https://...', bio: 'psychologist from Colombia')
    @post = Post.create(author_id: @user.id, title: 'Hi', text: 'test')
    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'talking to myself')
  end

  it 'Must belog to a user' do
    @comment.author_id = nil
    expect(@comment).to_not be_valid
  end

  it 'Must belog to a post' do
    @comment.post_id = nil
    expect(@comment).to_not be_valid
  end

  it 'Will increase the post comments_counter' do
    expect(@comment.post.comments_counter).to eq 1
  end
end
