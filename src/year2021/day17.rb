require 'colorize'
require 'pry-byebug'

module Year2021
  class Day17
    attr_accessor :lines, :x_range, :y_range, :best_x, :best_y, :failed, :hits

    def initialize(input)
      @lines = input.split("\n").first.scan(/(\d+)|(-\d+)/).flatten.compact.map(&:to_i)
      lines = @lines.map(&:dup)
      @x_range = (lines.shift..lines.shift).to_a
      @y_range = (lines.shift..lines.shift).to_a
      @best_x = 0
      @best_y = 0
      @failed = 0
      @hits = []
    end

    def part1
      x = 0
      y = 0
      highest = 0

      local_highest = best_angle(x, y)
      highest = local_highest if local_highest > highest
      puts "highest => #{highest.to_s.black} at #{[best_x, best_y]}".on_blue
      highest
    end

    def part2
      all_shots
      @hits.uniq.count
    end

    private

    def all_shots(x = 0, y = 0)
      last_overshots = [false, false, false, false]
      max_x = @x_range.max.negative? ? @x_range.min : @x_range.max
      max_y = @y_range.max.negative? ? @y_range.min : @y_range.max
      attack_range_x = max_x.negative? ? (max_x..0) : (0..max_x)
      attack_range_y = max_y.negative? ? (max_y..max_x.abs) : (0..max_x.abs)
      puts attack_range_x
      puts attack_range_y
      for x in attack_range_x do
        for y in attack_range_y do
          shoot(x, y, last_overshots)
        end
      end
    end

    def best_angle(x, y, highest = 0)
      hit = false
      last_overshots = [false, false, false, false]

      while hit == false
        # puts "shoot[#{x}, #{y}]".green
        hit, local_highest, overshots, last_overshots = shoot(x, y, last_overshots)
        # puts ''
        if overshots.first || overshots.last
          break if (overshots.first && last_overshots[1]) || (overshots.last && last_overshots[2])

          x -= 1
        elsif overshots[1] || overshots[2]
          break if (last_overshots.first && overshots[1]) || (last_overshots.last && overshots[2])

          x += 1
        end
        last_overshots = overshots
      end

      if hit && local_highest >= highest
        @failed = 0
        @best_x = x
        @best_y = y
        highest = local_highest
        # puts highest.to_s.green
        y += 1
        best_angle(x, y, highest)
      elsif @failed < 100
        @failed += 1
        y += 1
        best_angle(x, y, highest)
      else
        highest
      end
    end

    def shoot(x_vel, y_vel, last_overshots)
      initial_x = x_vel
      initial_y = y_vel
      hit = false
      highest = 0
      shot = 0
      x = 0
      y = 0
      until hit == true
        if !shot.zero?
          if x_vel.positive?
            x_vel -= 1
          elsif x_vel.negative?
            x_vel += 1
          end
          y_vel -= 1
        else
          shot += 1
        end
        highest = y if y > highest
        x += x_vel
        y += y_vel
        # print [x, y]
        # puts ''
        hit = true if @x_range.include?(x) && @y_range.include?(y)
        overshots = outside_range(x, y)
        break if overshots.any?
      end
      @hits << [initial_x, initial_y] if hit

      [hit, highest, overshots, last_overshots]
    end

    def outside_range(x, y)
      x_overshot_positive = (@x_range.last.positive? && x > @x_range.last)
      x_overshot_negative = (@x_range.last.negative? && x < @x_range.last)
      x_undershot_positive = (!x_overshot_positive && y < @y_range.min && x < @x_range.min)
      x_undershot_negative = (!x_overshot_negative && y < @y_range.min && x > @x_range.min)

      [x_overshot_positive, x_overshot_negative, x_undershot_positive, x_undershot_negative]
    end
  end
end
