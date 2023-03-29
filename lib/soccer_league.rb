# frozen_string_literal: true

# Parses file (game_results) and displays the top three teams for each matchday
class SoccerLeague
  def initialize(game_results)
    @game_results = game_results
    @matchday_count = 0
    # Track which teams have played on the current matchday
    @played_teams = {}
    @teams_and_points = {}
  end

  def process_matchday
    @game_results.each { |result| process_match(result) }
    @matchday_count += 1
    display_matchday_rankings
  end

  private

  def determine_match_score(match)
    _, team_one_score, _, team_two_score = match
    # If team one has a higher score, team one gets 3 points
    if team_one_score > team_two_score
      [3, 0]
    # If the scores are equal, both teams get 1 point
    elsif team_one_score == team_two_score
      [1, 1]
    # If team two has a higher score, team two gets 3 points
    else
      [0, 3]
    end
  end

  def determine_top_three_teams
    weekly_rankings = @teams_and_points.sort_by { |name, points| [-points, name] }
    top_three_teams = weekly_rankings.first(3)
    top_three_teams.map do |name, points|
      pt = points > 1 ? 'pts' : 'pt'
      "#{name}, #{points} #{pt}"
    end
  end

  def display_matchday_rankings
    top_three_teams = determine_top_three_teams
    puts "\nMatchday #{@matchday_count}"
    puts top_three_teams
  end

  # Check if a team has already played on the current matchday
  def new_matchday?(match)
    team_one, _, team_two = match
    @played_teams[team_one] || @played_teams[team_two]
  end

  def parse_match_result(result)
    # Split the result into an array of teams and scores
    teams_and_points = result.sub(', ', '').split(/([0-9])/)
    [teams_and_points[0].strip, teams_and_points[1],
     teams_and_points[2].strip, teams_and_points[3]]
  end

  def record_match_result(match, team_one_score, team_two_score)
    team_one, _, team_two = match
    @played_teams[team_one] = true
    @played_teams[team_two] = true
    # If the team has already played, add the score to the existing score
    if @matchday_count.positive?
      @teams_and_points[team_one] += team_one_score
      @teams_and_points[team_two] += team_two_score
    # If the team has not played, record the score
    else
      @teams_and_points[team_one] = team_one_score
      @teams_and_points[team_two] = team_two_score
    end
  end

  def process_match(match)
    match = parse_match_result(match)

    # If a team has already played on the current matchday, print the rankings
    if new_matchday?(match)
      @matchday_count += 1
      @played_teams = {}
      display_matchday_rankings
    end

    team_one_score, team_two_score = determine_match_score(match)
    record_match_result(match, team_one_score, team_two_score)
  end
end
