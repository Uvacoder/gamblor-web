# In the case of a Bo3/Bo5, we only want the first game.
# The goal is to show which teams will be playing, not
# how many games they played/will play.
module UpcomingMatches
  def self.most_recently_played(num = 5)
    games = Game
      .where(game_number: 1)
      .where('date < ?', Date.today)
      .order(date: :desc)[0...num]
      .reverse

    games.each do |game|
      game.winner_id = match_winner(game).id
    end

    games
  end

  def self.upcoming(num = 5)
    games = Game
      .where(game_number: 1)
      .where('date >= ?', Date.today)
      .order(date: :asc)[0...num]

    games.each do |game|
      game.winner_id = match_winner(game)
    end

    games
  end

  # given a game, check if it is part of a Bo3/Bo5.
  # If so, get the eventual overall winner.
  def self.match_winner(game)
    games_in_match = Game.where(match_uuid: game.match_uuid)

    winner_ids = games_in_match.collect { |x| x.winner_id }
    winner_id = winner_ids.max_by { |x| winner_ids.count(x) }

    Team.find winner_id
  end
end
