File::open( 'file_io.txt', 'w' ) do |f|
   f << "This is the text that will be written to the file"
end

Dir['*.rb'].each do |f|
    puts "Ruby file: #{f}"
end

puts "Contents of file_io.txt:"
puts File.read( "file_io.txt" )
