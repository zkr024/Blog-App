require 'rails_helper'
RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before :each do
      User.create(name: 'Tom', photo: 'profiles/profile1.jpg', bio: 'Teacher from Mexico.')
      visit users_path
    end
    it "displays user's name" do
      User.all.each do |user|
        user.id
        expect(page).to have_content user.name
      end
    end
    it "displays user's picture" do
      expect(page).to have_css('.img')
    end
    it "displays user's post counter" do
      User.all.each do |user|
        expect(page).to have_content user.post_counter
      end
    end
    it 'access button clicked directs to user profile' do
      User.all.each do |user|
        click_link 'Access'
        expect(page).to have_current_path user_path(user)
      end
    end
  end
end
