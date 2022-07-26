require 'rails_helper'
RSpec.describe 'Users', type: :system do
  describe 'show page' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'profiles/profile1.jpg', bio: 'Teacher from Mexico.')
      @first_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post')
      visit user_path(@user.id)
    end
    it "displays user's name" do
      expect(page).to have_content @user.name
    end
    it "displays user's picture" do
      expect(page).to have_css('.img')
    end
    it "displays user's post counter" do
      expect(page).to have_content @user.post_counter
    end
    it "displays user's bio" do
      expect(page).to have_content @user.bio
    end
    it 'displays the first three posts' do
      @user.recent_three_posts.each do |post|
        expect(page).to have_content post.title
        expect(page).to have_content post.text
      end
    end
    it 'see all posts button' do
      expect(page).to have_text('See all posts')
    end
    it 'access button directs to user posts page' do
      visit user_path(@user.id)
      click_link 'See all posts'
      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end
