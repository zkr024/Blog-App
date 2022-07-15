require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Adriana', photo: 'https://...', bio: 'psychologist from Colombia')
    @post = Post.create(author_id: @user.id, title: 'Hi', text: 'test')
    @like = Like.create(author_id: @user.id, post_id: @post.id)
  end

  it 'Must belog to a user' do
    @like.author_id = nil
    expect(@like).to_not be_valid
  end

  it 'Must belog to a post' do
    @like.post_id = nil
    expect(@like).to_not be_valid
  end

  it 'Will increase the post likes_counter' do
    expect(@like.post.likes_counter).to eq 1
  end
end
