require 'benchmark'

# Manage a solution's source file for a given day
class PuzzleSource
  def self.create_puzzle(year, day)
    padded_day = Day.pad(day)
    input = PuzzleInput.load(year, day)
    begin
      Module.const_get("Year#{year}").const_get("Day#{padded_day}").new(input)
    rescue NameError
      puts 'There is no solution for this puzzle'
    end
  end

  def self.run_part(part_name)
    has_result = false
    t = Benchmark.realtime do
      solution = yield
      if !solution.nil?
        puts "Result for #{part_name}:"
        puts solution
        has_result = true
      else
        puts "no result for #{part_name}"
      end
    end
    puts "(obtained in #{t} seconds)" if has_result
  end

  def self.puzzle_source_directory(year)
    File.join('src', "year#{year}")
  end

  def self.puzzle_source_path(year, day)
    day = Day.pad(day)
    File.join(puzzle_source_directory(year), "day#{day}.rb")
  end

  def self.puzzle_source(year, day)
    day = Day.pad(day)

    <<~TPL
      require 'colorize'
      require 'pry-byebug'

      module Year#{year}
        class Day#{day}
          attr_accessor :lines

          def initialize(input)
            @lines = input.split("/\n")
          end

          def part1
            nil
          end

          def part2
            nil
          end
        end
      end
    TPL
  end
end
