# frozen_string_literal: true

require './lib/soccer_league'

# Accept file path as argument
filepath = ARGV[0]

# Open file and read contents
file = File.open(filepath)
data = file.readlines.map(&:chomp)

league = SoccerLeague.new(data)
league.process_matchday
