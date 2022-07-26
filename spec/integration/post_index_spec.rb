require 'rails_helper'
RSpec.describe 'Posts', type: :system do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'profiles/profile1.jpg', bio: 'Teacher from Mexico.')
      @first_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post')
      @comment = Comment.create(post_id: @first_post.id, author_id: @user.id, text: 'Hi Me!')
      visit("/users/#{@user.id}/posts")
    end
    it "displays user's picture" do
      expect(page).to have_css('.img')
    end
    it "displays user's name" do
      expect(page).to have_content @user.name
    end
    it "displays post's title" do
      expect(page).to have_content @first_post.title
    end
    it "displays post's body" do
      expect(page).to have_content @first_post.text
    end
    it "displays post's comments" do
      Comment.where(post_id: @first_post.id).each do |comment|
        expect(page).to have_content comment.text
      end
    end
    it "displays post's comment counter" do
      expect(page).to have_content @first_post.comments_counter
    end
    it "displays post's likes counter" do
      expect(page).to have_content @first_post.likes_counter
    end
    it 'access button directs to post page' do
      click_link 'Access'
      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@first_post.id}")
    end
  end
end
