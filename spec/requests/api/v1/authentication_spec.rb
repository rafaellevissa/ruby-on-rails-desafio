require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do

  path '/api/v1/auth' do

    post('login authentication') do
      consumes('application/json')
      parameter(name: :annotation, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        }
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
end
