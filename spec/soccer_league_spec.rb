# frozen_string_literal: true

require_relative '../lib/soccer_league'

RSpec.describe SoccerLeague do
  let(:game_results) { ['Team A 2, Team B 2', 'Team C 3, Team D 4'] }

  describe '#process_matchday' do
    context 'when given a list of game results' do
      it 'displays the top three teams for each matchday' do
        expected_output = "\nMatchday 1\nTeam D, 3 pts\nTeam A, 1 pt\nTeam B, 1 pt\n"

        soccer_league = SoccerLeague.new(game_results)
        expect { soccer_league.process_matchday }.to output(expected_output).to_stdout
      end
    end
  end
end
