input = File.open('C-large.in')
output = File.open('C-large.out', 'w')

input.readline.to_i.times do |index|
  a, b = input.readline.split
  min, max = a.to_i, b.to_i
  cache = []

  if max >= 10
    (min..max).each do |n|
      str = n.to_s
      (str.size - 1).times do |i|
        front_length = str.size - i - 1
        back_length = i + 1
        back_index = back_length * -1
        check = str[back_index, back_length] + str[0, front_length]
        # puts check

        if check !~ /^0/ && check != str && check.to_i >= min && check.to_i <= max
          cache << [str, check]
        end
      end
    end
  end
  cache.uniq!
  # puts cache.inspect

  output.puts "Case ##{index + 1}: #{cache.size / 2}"
end

input.close
output.close
