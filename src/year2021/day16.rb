require 'colorize'
require 'pry-byebug'

module Year2021
  class Day16
    attr_accessor :lines, :chars, :binary, :numbers, :versions, :types, :order

    def initialize(input)
      @lines = input.split("\n")
      @chars = @lines.first.chars
      @binary = @chars.map { |char| char.hex.to_s(2).rjust(char.size * 4, '0') }.join
      @numbers = []
      @versions = []
      @types = Hash.new([])
      @order = []
    end

    def part1
      version_sum if numbers.empty?
      versions.sum
    end

    def part2
      version_sum if numbers.empty?
      binding.pry
      sum = types[:sum].flatten.sum
      product = types[:product].flatten.reduce(&:*)
    end

    private

    def version_sum(new_binary = binary.dup.chars, type = nil)
      numbers = []
      until new_binary.empty? || new_binary.uniq.map(&:to_i).all?(&:zero?)
        version = new_binary.shift(3).join.to_i(2)
        @versions << version
        type_id = new_binary.shift(3).join.to_i(2)
        case type_id
        when 4
          numbers << calculate_literal(new_binary, type)
        else
          type =  case type_id
                  when 0
                    :sum
                  when 1
                    :product
                  when 2
                    :min
                  when 3
                    :max
                  when 5
                    :greater
                  when 6
                    :lesser
                  when 7
                    :equal
                  end
          calculate_sub_packet(new_binary, type)
        end
      end
      if !numbers.empty?
        if @types[type].empty?
          @types[type] = numbers
        else
          @types[type] += numbers
        end
        @order << type
      end
      numbers
    end

    def calculate_sub_packet(binary, type)
      lenght_type_id = binary.shift
      length = lenght_type_id == '0' ? 15 : 11
      bits_length = binary.shift(length).join.to_i(2)

      if length == 15
        version_sum(binary.shift(bits_length), type)
      else
        version_sum(binary, type)
      end
    end

    def calculate_literal(binary, type)
      number = []
      local_numbers = []
      while true
        start = binary.shift
        number << binary.shift(4)
        break if start == '0' || start.nil?
      end

      @numbers << number.join.to_i(2)
      local_numbers << number.join.to_i(2)
      version_sum(binary, type)
      local_numbers
    end
  end
end
