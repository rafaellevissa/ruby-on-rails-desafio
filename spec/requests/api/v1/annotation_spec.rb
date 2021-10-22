require 'swagger_helper'

RSpec.describe 'api/v1/annotation', type: :request do

  path '/api/v1/annotation' do

    get('list annotations') do
      produces('application/json')
      security([Bearer: {}])

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

    post('create annotation') do
      consumes('application/json')
      produces('application/json')
      security([Bearer: {}])

      parameter(name: :annotation, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string },
          lat: { type: :string },
          long: { type: :string },
          user_id: { type: :integer },
        },
        required: ['content', 'lat', 'long', 'user_id'],
      })

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
  end

  path '/api/v1/annotation/{id}' do
    # You'll want to customize the parameter types...
    parameter(name: 'id', in: :path, type: :string, description: 'id')
    
    get('show annotation') do
      produces('application/json')
      security([Bearer: {}])
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

    patch('update annotation') do
      produces('application/json')
      security([Bearer: {}])
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

    put('update annotation') do
      consumes('application/json')
      produces('application/json')
      security([Bearer: {}])
      parameter(name: :annotation, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string },
          lat: { type: :string },
          long: { type: :string },
          user_id: { type: :integer },
        }
      })
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

    delete('delete annotation') do
      produces('application/json')
      security([Bearer: {}])
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
