# jane-technologies

This is a Ruby CLI that reads a list of game results for a soccer league, and returns the top teams at the end of each matchday.
This CLI follows [this prompt](./instructions/PROMPT.md), with [this input](./instructions/sample-input.txt) and [this output](./instructions/expected-output.txt) as examples.

## Installation

First, clone the repository. Then, run `bundle install` to install gem dependencies. Then, run `ruby main.rb < ./instructions/sample-input.txt` to read game results from the given file.

## Testing

To run the tests, run `rspec`.

## Design Approach

I decided to use Ruby because I like the syntax and object-oriented design. Also, I have been working mostly in TypeScript, so I decided to challenge myself by working in Ruby, which I don't use on a daily basis. Also, I know that Jane uses Ruby, so I wanted to demonstrate my ability to learn.

I will approach the problem by breaking it down into smaller sub-problems:

- Read the input data.
- Parse the input data to calculate the points for each team and determine the top teams.
- Calculate the points for each team and determine the top teams.
- Print the top teams for each match day when the end of the match day is detected.
