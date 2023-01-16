require 'swagger_helper'

RSpec.describe 'api/v1/cleaners', type: :request do
  path '/api/v1/cleaners' do
    get('list cleaners') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create cleaner') do
      response(200, 'cleaner added successfully') do
        consumes 'application/json'
        parameter name: :cleaner, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            location: { type: :string },
            charges: { type: :integer },
            photo: { type: :string }
          },
          required: %w[name location charges photo]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/cleaners/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show cleaner') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update cleaner') do
      response(200, 'cleaner added successfully') do
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :cleaner, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            location: { type: :string },
            charges: { type: :integer },
            photo: { type: :string }
          },
          required: %w[name location charges photo]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update cleaner') do
      response(200, 'cleaner added successfully') do
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :cleaner, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            location: { type: :string },
            charges: { type: :integer },
            photo: { type: :string }
          },
          required: %w[name location charges photo]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete cleaner') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
