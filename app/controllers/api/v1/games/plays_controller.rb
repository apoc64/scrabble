class Api::V1::Games::PlaysController < ActionController::API
  def update
    # So insecure :(
    game = Game.find(params[:game_id])
    user = User.find(params[:user_id])
    play = Play.create(game: game, user: user, word: params[:word])
  
    render json: game, status: 201
  end
end
