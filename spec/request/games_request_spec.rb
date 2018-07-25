require 'rails_helper'

describe 'get request to games' do
  it 'makes proper response' do
    get '/api/v1/games/1'

    expected =  {
      "game_id":1,
      "scores": [
        {
          "user_id":1,
          "score":15
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    }

    expect(response).to be_success
    expect(response.body).to eq(expected)
  end
end
