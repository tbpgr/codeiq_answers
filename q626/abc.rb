# encoding: utf-8

def add_hex_numbers(*hexes)
  hexes.reduce(0) {|sum, e|sum += e.hex}.to_s(16)
end

p add_hex_numbers('A', 'B')
p add_hex_numbers('A', '2B')
p add_hex_numbers('A', 'B', 'C')
