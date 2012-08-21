# if
var1 = 10
if var1 < 100
  puts "Below 100!"
end

#in one line
puts "Below 100!" if var1 < 100
puts "Above 5!" unless var1 < 5

var1 += 1 while var1 < 100
puts "var1 is now #{var1}"

# loop
5.times { print "Hi! " }

2.times do
  puts "Hi!"
end

# code block with parameter
10.times do |i|
  next if i % 2 == 0    # skip even numbers
  break if i > 7        # stop after 7
  puts i                
end

# loop through array
[1, 2, 3].each do |i|
  puts i
end

# in one line
['toast', 'cheese', 'wine'].each { |food| print food.capitalize }

# number ranges and index
('a'..'e').each_with_index do |i,index|
  puts "#{index} - #{i}"
end


