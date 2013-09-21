#!ruby

require 'pp'

def clamp value, min, max
  return min if value < min
  return max if value > max
  value
end

def mkpoint x, y
  {x: x.to_i, y: y.to_i}
end

def mkline a, b
  {start: a, end: b}
end

def midpoint line
  a = line[:start]
  b = line[:end]
  x = (a[:x] + b[:x]) / 2
  y = (a[:y] + b[:y]) / 2
  mkpoint x, y
end

def iterate width, height
  length = width / 2

  tiles = []
  height.times { tiles << length }

  lines = []
  lines << mkline(mkpoint(0, length), mkpoint(height - 1, length))

  rand_max = width / 2

  offset = tiles.size
  while offset > 0
    lines.map! do |line|
      mid = midpoint(line)
      length = Random.rand(Range.new(-rand_max, rand_max))
      mid[:y] += length.to_i
      mid[:y] = clamp(mid[:y], 0, width)
      rand_max *= 0.5
      [mkline(line[:start], mid), mkline(mid, line[:end])]
    end
    lines.flatten!
    offset /= 2
  end

  lines.each do |line|
    tiles[line[:start][:x]] = line[:start][:y]
    tiles[line[:end][:x]] = line[:end][:y]
  end

  tiles
end

loop do
  iterate(16, 22).each do |value|
    coast = '.' * value
    coast += ' ' * (16 - value)
    coast += '|'
    puts coast
    sleep 0.05
  end
end
