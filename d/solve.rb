input = File.open('example.in')
output = File.open('example.out', 'w')

input.readline.to_i.times do |index|
  h, w, max = input.readline.split.map(&:to_i)
  xo, yo = 0, 0
  seen = 0
  hall = []

  h.times do |i|
    hall << input.readline.strip.chars.to_a

    if hall[i].include?('X')
      xo, yo = hall[i].index('X'), i
    end
  end

  puts hall.inspect
  %w(n ne e se s sw w nw).each do |direction|
    x, y = xo, yo
    distance = 0

    while distance <= max
      puts "#{x} #{y}"
      x += 1 if direction =~ /e/
      x -= 1 if direction =~ /w/
      y += 1 if direction =~ /s/
      y -= 1 if direction =~ /n/

      case hall[y][x]
      when '#', 'X'
        distance += 0.5

        case '
      when '.'
        distance += 1.0
      end

      seen += 1 if hall[y][x] == 'X'
    end
  end


  output.puts "Case ##{index + 1}: #{seen}"
end

input.close
output.close
