
var1 = 1 + 1                    # variable
puts "1 + 1 = #{var1}"          # string templating
var2 = nil                      # Equivalent of Null/Nothing
$global = "global variable"     # global variable

Pi = 3.14159                    # constant (Ruby only warns you)

puts "3/2 = #{3/2}"             # int
puts "3/2 = #{3.0/2}"           # type coersion into float

# numbers
puts "x + 1 = #{var1 += 1}"
puts "3 squared = #{3 ** 2}"
puts "5 modulus 2 = #{5 % 2}"
puts "3.24 * ((34/2) - 54)/33.4 * 3.4 = #{3.24 * ((34/2) - 54)/33.4 * 3.4}"
puts "Long number = #{1_234_567_890}"
puts "Big number = #{1.7e9}"
var3 = 1..100                   # number range, inclusive
var4 = 0...100                  # excludes last value

# strings
puts "Hello" + ' World'         # single or double quotes
puts "Hi! " * 3
puts "hello".capitalize         # also reverse,next,upcase,downcase,swapcase
puts "1" + "2"
puts "1".to_i + "2".to_f        # type conversion
puts 1.to_s + 2.to_s
puts "this".is_a?(String)
puts "Clover".include? "love"

str1 = "Hello"
str1.upcase!                    # destructive methods have !
puts str1

avril_quote = "I'm a lot wiser.  Now I know 
 what the business is like -- what you have 
 to do and how to work it."
puts avril_quote

# symbols - light-weight strings, use like enums
puts :a_symbol
puts :toby.to_s + :kurien.to_s

# method
def hi(msg)
  puts "You said: #{msg}"
end

hi("Hello, world!")             # method call
alias h hi                      # method alias
h("Hi")
#puts "Hello".methods            # reflection
puts "Hello".respond_to? "upcase"
puts "this".is_a? String        # brackets optional for method call, period optional for operator

# array
arr1 = [ 1, 2, "3", 4.0 ]
puts arr1[1]

# hash
data = {
    :name => "Toby",
    :surname => "Kurien",    
}

puts data[:name]

