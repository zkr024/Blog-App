require 'swagger_helper'

describe 'Post API' do
  path '/api/v1/posts' do
    post 'Creates a post' do
      tags 'Posts'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer }
        },
        required: %w[title body]
      }

      response '201', 'post created' do
        let(:post) { { title: 'Hello', text: 'This is my first post' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post) { { title: 'Hello' } }
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    get 'Retrieves a post' do
      tags 'Posts'
      produces 'application/json'

      response '200', 'Post retrieved' do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{user.token}" }
        run_test!
      end
    end
  end
end
