module StringStuff

  def caps(str)
    str.upcase
  end

end

include StringStuff
p caps "i would like to be louder"

module StringStuff
  def caps_me
    self.upcase
  end
end

def String
  include StringSuffsdfsdf
end

p "make me loud".caps_me


