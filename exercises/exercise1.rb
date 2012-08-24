# Fun with arrays

movies = %{The Grapes of Wrath  1940  8.3  25770  Drama
Harry Potter and the Goblet of Fire  2005  7.6  123237  Adventure  Family  Fantasy  Mystery  Adventure  Fantasy
The Pink Panther Strikes Again  1976  7.1  10386  Comedy  Crime  Family  Sci-Fi
A Few Good Men  1992  7.6  68236  Crime  Drama  Mystery  Thriller
The Lookout  2007  7.2  27358  Crime  Drama  Thriller
BloodRayne  2005  2.7  20953  Action  Adventure  Fantasy  Horror}

# parse movies into array of arrays
movie_data = movies.collect{|m| m.split "  "}

# Find number of movies of a category
category = "Mystery"
filtered_movies = movie_data.select{ |m| m[4..-1].include? category }
puts "Found #{filtered_movies.length} movie(s) of type #{category}"

# Find best movie of 2000's
best = movie_data.select{|m| (2000..2100).include? m[1].to_i }.sort{|m1,m2| m2[2] <=> m1[2] }.take(1)
puts "Best movie of 2000's is %s" % best[0]

# Sum of votes of top 2 movies
votes = movie_data.sort{|m1,m2| m2[2] <=> m1[2]}.take(2).reduce(0){|sum,m| sum += m[3].to_i}
puts "Votes for top 2 movies is %d" % votes
