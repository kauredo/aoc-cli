require 'spec_helper'

RSpec.describe Year2021::Day17 do
  it 'solves part1', part1: true do
    d = Year2021::Day17.new('target area: x=20..30, y=-10..-5')
    expect(d.part1).to eq(45)
  end

  it 'solves part2', part2: true do
    d = Year2021::Day17.new('target area: x=20..30, y=-10..-5')
    expect(d.part2).to eq(112)
  end
end
