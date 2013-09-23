#!ruby

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
  base = (width * 0.5).to_i

  tiles = []
  height.times { tiles << base }

  lines = []
  lines << mkline(mkpoint(0, base), mkpoint(height - 1, base))

  rand_max = 1.0

  while lines.length < tiles.length
    lines.map! do |line|
      mid = midpoint(line)
      length = Random.rand(Range.new(-rand_max, rand_max)) * width
      mid[:y] += length.to_i
      mid[:y] = clamp(mid[:y], 4, width)
      tiles[mid[:x]] = mid[:y]
      [mkline(line[:start], mid), mkline(mid, line[:end])]
    end
    lines.flatten!
    rand_max *= 0.5
  end

  tiles[ 0] = base
  tiles[-1] = base
  tiles
end

snooze = 0.05
snooze = ARGV[0].to_f if ARGV.length > 0

loop do
  puts '+' + ('-' * 16) + '+'
  iterate(16, 22).each do |value|
    coast = '|'
    coast += '.' * value
    coast += ' ' * (16 - value)
    coast += '|'
    puts coast
    sleep snooze
  end
end
