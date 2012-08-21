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

# case
def dr_chams_timeline( year )
 case year
 when 1894
   "Born." 
 when 1895..1913
   "Childhood in Lousville, Winston Co., Mississippi." 
 when 1914..1919
   "Worked at a pecan nursery; punched a Quaker." 
 when 1920..1928
   "Sailed in the Brotherhood of River Wisdomming, which journeyed \
    the Mississippi River and engaged in thoughtful self-improvement, \
    where he finished 140 credit hours from their Oarniversity." 
 when 1929
   "Returned to Louisville to pen a novel about time-travelling pheasant hunters." 
 when 1930..1933
   "Took up a respectable career insuring pecan nurseries.  Financially stable, he \
    spent time in Brazil and New Mexico, buying up rare paper-shell pecan trees.  Just \
    as his notariety came to a crescendo: gosh, he tried to buried himself alive." 
 when 1934
   "Went back to writing his novel.  Changed the hunters to insurance tycoons and the \
    pheasants to Quakers." 
 when 1935..1940
   "Took Arthur Cone, the Headmaster of the Brotherhood of River Wisdomming, as a \
    houseguest.  Together for five years, engineering and inventing." 
 when 1941
   "And this is where things got interesting." 
 else
   "No information about that year"
 end
end
puts dr_chams_timeline( 1941 )
