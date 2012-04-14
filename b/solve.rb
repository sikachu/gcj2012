input = File.open('B-large.in')
output = File.open('B-large.out', 'w')

input.readline.to_i.times do |index|
  participants, surprise_count, passing_score, *scores =
    input.readline.split.map(&:to_i)
  two_remainder, zero_remainder = [], []
  passed = 0

  scores.each do |score|
    base_score = score / 3

    if score >= passing_score
      if base_score >= passing_score
        passed += 1
      else
        case score % 3
        when 0
          if base_score == 10 && base_score >= passing_score
            passed += 1
          else
            zero_remainder << base_score + 1 if base_score + 1 >= passing_score
          end
        when 1
          passed += 1 if base_score + 1 >= passing_score
        when 2
          if base_score == 9
            passed += 1 if base_score + 1 >= passing_score
          elsif base_score + 1 >= passing_score
            passed += 1
          else
            two_remainder << base_score + 2 if base_score + 2 >= passing_score
          end
        end
      end
    end
  end

  two_remainder.sort
  zero_remainder.sort

  # puts passed
  # puts two_remainder.inspect
  # puts zero_remainder.inspect

  surprise_count.times do
    break if two_remainder.empty? && zero_remainder.empty?
    passed += 1 if two_remainder.shift || zero_remainder.shift
  end

  passed += zero_remainder.select{ |score| score - 1 >= passing_score }.size

  output.puts "Case ##{index + 1}: #{passed}"
end

input.close
output.close
