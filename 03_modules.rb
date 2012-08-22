module StringStuff

  # class inside a module
  class SomeClass
    # class method to lowercase a string
    def self.l(str)
      str.downcase
    end
  end

  # a module method, can only be called once included into a class
  def caps(str)
    str.upcase
  end

  # a module method, can only be called once included into a class (references the class)
  def caps_me
    caps self
  end
  
  module_function :caps  # turn caps into a module function (so it doesn't need to be included into a class)
end

p StringStuff::SomeClass::l "I LIKE TO SHOUT"
p StringStuff::caps "i would like to be louder"

class String
  include StringStuff  # make the module methods part of String class! This is a mixin
end

p "make me loud".caps_me  # now strings know how to caps_me


