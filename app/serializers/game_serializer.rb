class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    p1_plays = object.plays.where(user_id: object.player_1_id)
    p1_score = p1_plays.map do |play|
      play[:score]
    end.sum
    p2_plays = object.plays.where(user_id: object.player_2_id)
    p2_score = p2_plays.map do |play|
      play[:score]
    end.sum

    [
      {
        "user_id" => object.player_1_id,
        "score" => p1_score
      },
      {
        "user_id" => object.player_2_id,
        "score" => p2_score
      },
    ]
  end
end
