
var1 = 1 + 1                    # variable
p "1 + 1 = #{var1}"          # string templating
p "Hi %s, meet %s! Cost: R%0.2f" % [ "Jack", "Jill", 12.3456 ]  # more string templating
$global = "global variable"     # global variable (like environment variables)
p "Script name: %s" % $0
p "Params: %p" % $*

Pi = 3.14159                    # constant
Pi = 123                     # can be changed, you only get a warning
p Pi

p "3/2 = #{3/2}"             # int
p "3/2 = #{3.0/2}"           # type coersion into float

# boolean
var2 = nil                      # Equivalent of Null/Nothing
var2 = true || false

# numbers
p "x + 1 = #{var1 += 1}"
p "3 squared = #{3 ** 2}"
p "5 modulus 2 = #{5 % 2}"
p "3.24 * ((34/2) - 54)/33.4 * 3.4 = #{3.24 * ((34/2) - 54)/33.4 * 3.4}"
p "Long number = #{1_234_567_890}"
p "Big number = #{1.7e9}"
var3 = 1..100                   # number range, inclusive
var4 = 0...100                  # excludes last value

# strings
p "Hello" + ' World'         # single or double quotes
p "Hi! " * 3
p "hello".capitalize         # also reverse,next,upcase,downcase,swapcase
p "1" + "2"
p "1".to_i + "2".to_f        # type conversion
p 1.to_s + 2.to_s
p "this".is_a?(String)
p "Clover".include? "love"
p "This is a long story..."[8..-1]  # substring using number ranges
p "1,2,3,4".split(',').inspect

str1 = "Hello"
str1.upcase!                    # destructive methods have !
p str1

# multi-line string
avril_quote = "I'm a lot wiser.  Now I know 
 what the business is like -- what you have 
 to do and how to work it."
p avril_quote

# symbols - light-weight strings, use like enums
p :a_symbol
p :toby.to_s + :kurien.to_s

# method
def hi(msg)
  p "You said: #{msg}"
end

hi("Hello, world!")             # method call
alias h hi                      # method alias
h("Hi")
#p "Hello".methods            # reflection
p "Hello".respond_to? "upcase"
p "this".is_a? String        # brackets optional for method call, period optional for operator

# array
arr1 = [ 1, 2, "3", 4.0 ]
p arr1[1]

# hash
data = {
    :name => "Toby",
    :surname => "Kurien",    
}

p data[:name]

# easy word array
word_array = %w{
  one two three four five six
}
p word_array

# easy embedded string, no escaping needed (can use %{} or %q{})
embedded_string = %{
  In this 'sentence' we can "quote" and 'quote' as
  much as we like!
}
p embedded_string

# errors
1.include? 2 rescue p "Oops, #{$!}"
raise "an error"
raise ArgumentError, "Haha, just kidding"

