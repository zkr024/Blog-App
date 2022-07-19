require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(5) }

    it 'response status is correct' do
      expect(response).to have_http_status(200)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'Posts'
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/5/posts/5' }

    it 'response status is correct' do
      expect(response).to have_http_status(200)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'Post_ID'
    end
  end
end
