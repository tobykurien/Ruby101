# if
var1 = 10
if var1 < 100
  p "Below 100!"
end

#in one line
p "Below 100!" if var1 < 100
p "Above 5!" unless var1 < 5

var1 += 1 while var1 < 100
p "var1 is now #{var1}"

# loop
5.times { print "Hi! " }

2.times do
  p "Hi!"
end

# code block with parameter
10.times do |i|
  next if i % 2 == 0    # skip even numbers
  break if i > 7        # stop after 7
  p i                
end

# loop through array
[1, 2, 3].each do |i|
  p i
end

# in one line
['toast', 'cheese', 'wine'].each { |food| print food.capitalize }

# number ranges and index
('a'..'e').each_with_index do |i,index|
  p "#{index} - #{i}"
end

# list comprehension
p [1,2,3,4,5].collect{|salary| salary *= 1.10 } # 10% increase (can also use map)
p [1,2,3,4,5].reduce{|tot,i| tot + i}           # sum all the values
p [1,2,[3,4],[5,6]].flatten                     # flatten into one array
p [1,2,3,4,5].reject{|i| i % 2 == 0}            # remove even numbers
p [1,2,3] + [4,5]                               # add 2 arrays
p [1,2,3] << 4 << 5                             # add items (like a stack), can 'pop' last value out
p ["Hello", " world"].join(",")

# case
def timeline( year )
 case year
 when 1894
   "Born." 
 when 1895..1913
   "Childhood in Lousville, Winston Co., Mississippi." 
 when 1941..1956
   "And this is where things got interesting." 
 else
   "No information about that year"
 end
end
p timeline( 1945 )

