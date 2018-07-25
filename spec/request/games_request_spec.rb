require 'rails_helper'

describe 'get request to games', :type => :request do
  it 'makes proper response' do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal, id: 1)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    get '/api/v1/games/1'

    expected = JSON.parse('{
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
    }')

    expect(response).to be_success
    expect(JSON.parse(response.body)).to eq(expected)
  end

  it 'makes a play' do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal, id: 1)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    post "/api/v1/games/1/plays?user_id=1&word=at"

    expect(response.status).to be(201)
    expected = JSON.parse('{
      "game_id":1,
      "scores": [
        {
          "user_id":1,
          "score":17
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    }')

    expect(response).to be_success
    expect(JSON.parse(response.body)).to eq(expected)
  end
end
