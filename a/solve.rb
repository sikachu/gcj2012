input = File.open('input')
output = File.open('output', 'w')

# Solve for mapping
example = <<-end
ejp mysljylc kd kxveddknmc re jsicpdrysi
rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd
de kr kd eoya kw aej tysr re ujdr lkgc jv
end

result = <<-end
our language is impossible to understand
there are twenty six factorial possibilities
so it is okay if you want to just give up
end

mapping = {}
example.size.times do |index|
  if example[index] =~ /[a-z]/i
    mapping[example[index]] = result[index]
  end
end

# missing
mapping['z'] = 'q'
mapping['q'] = 'z'

puts mapping.keys.sort.inspect
puts mapping.values.sort.inspect
puts mapping.inspect
puts mapping.size

# Solve for input
input.readline.to_i.times do |index|
  line = input.readline.gsub(/[a-z]/) do |chr|
    mapping[chr]
  end

  output.puts "Case ##{index + 1}: #{line}"
end

input.close
output.close
