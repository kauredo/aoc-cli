require 'spec_helper'

RSpec.describe Year2021::Day16 do
  it 'solves part1', part1: true do
    d1 = Year2021::Day16.new('8A004A801A8002F478')
    expect(d1.part1).to eq(16)
    d2 = Year2021::Day16.new('620080001611562C8802118E34')
    expect(d2.part1).to eq(12)
    d3 = Year2021::Day16.new('C0015000016115A2E0802F182340')
    expect(d3.part1).to eq(23)
    d4 = Year2021::Day16.new('A0016C880162017C3686B18A3D4780')
    expect(d4.part1).to eq(31)
  end

  it 'solves part2', part2: true do
    # d = Year2021::Day16.new('C200B40A82')
    # expect(d.part2).to eq(3)
    d = Year2021::Day16.new('04005AC33890')
    expect(d.part2).to eq(54)
    # d = Year2021::Day16.new('880086C3E88112')
    # expect(d.part2).to eq(7)
    # d = Year2021::Day16.new('CE00C43D881120')
    # expect(d.part2).to eq(9)
    # d = Year2021::Day16.new('D8005AC2A8F0')
    # expect(d.part2).to eq(1)
    # d = Year2021::Day16.new('F600BC2D8F')
    # expect(d.part2).to eq(0)
    # d = Year2021::Day16.new('9C005AC2F8F0')
    # expect(d.part2).to eq(0)
    # d = Year2021::Day16.new('9C0141080250320F1802104A08')
    # expect(d.part2).to eq(1)
  end
end
