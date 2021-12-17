# AOC CLI

## This repo is a fork of [aoc-cli](https://github.com/Keirua/aoc-cli), by [Keirua](https://github.com/Keirua).

-------

`AoC-rb` is a ruby Advent of Code command line utility. [Advent of Code](https://adventofcode.com/) is a yearly programming challenge that takes place in december.
It allows you to focus on solving the puzzles, not on the manual details:

 - it quickly downloads the puzzles
 - it bootstraps a given day, by preparing the ruby files you'll need and downloading a puzzle if necessary
 - it runs a solution for the day you are working on, loads the input file and benchmark the execution time

## How to use aoc-cli ?

Once you have installed the project, there are 2 main commands. The other one are utilities.

### aoc boostrap YEAR DAY

`aoc bootstrap` is a way to get started playing a given day.
It downloads the input file, creates a sample source file for that day, as well as a spec file. 

Here is an example that gets started playing the first day of year 2021 : `./aoc bootstrap 2021 1`
It will create the input file in the ``
```
aoc-cli
├── input
│   └── 2021
│       └── day-01
├── spec
│   ├── spec_helper.rb
│   └── year2021
│       └── day01_spec.rb
└── src
    └── year2021
        └── day01.rb
```

The `src/year/2021/day01.rb` is simple but it contains all you need: an initializer (that takes as parameter the content of the input file), and 2 methods: `part1` and `part2`, that return the expected value.

```ruby
module Year2021
  class Day01
    attr_accessor :lines
    
    def initialize(input)
      @lines = input.split("\n")
    end

    def part1
      nil
    end

    def part2
      nil
    end
  end
end
```

### aoc run YEAR DAY

If you run your solution with `aoc-run`, aoc-cli takes care of loading the input file and measuring the execution time for you.

```
./aoc run 2021 1      
Result for part 1:
expected_result
(obtained in 2.1908000235271174e-05 seconds)

no result for part 2
```

### other commands

There are 3 other commands you may want to use:

 - `aoc download YEAR DAY`: it downloads a puzzle input file in the `input` directory
 - `aoc part1 YEAR DAY`: same as `aoc run`, but only runs the part 1 for a given day
 - `aoc part2 YEAR DAY`: same as `aoc run`, but only runs the part 2 for a given day

To run your local test, update the spec file for the correct day. Than you can run the following commands:

 - `aoc test YEAR DAY`: runs the tests for both part 1 and 2
 - `aoc test1 YEAR DAY`: only runs the tests for part 1 for a given day
 - `aoc test2 YEAR DAY`: only runs the tests for part 2 for a given day

## Installation

 - clone this project
 - install the dependencies by running `bundle install`
 - login to [adventofcode](https://adventofcode.com/), and copy your session cookie. 
 - copy the `.env.example` file into `.env`.
 - paste the cookie in the AOC_COOKIE variable. The `.env` file should look like this:
```
AOC_COOKIE="536…"
AOC_INPUT_DIRECTORY="input"
```

You are done ! You should now be able to download the input file by running the `aoc` command.
