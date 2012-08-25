# Add functionality to numbers and time

# Time works on seconds for arthimetic
module NumExtras
  def days
    self * 60 * 60 * 24
  end
  
  def weeks
    days * 7
  end
  
  def months
    days * 30
  end
  
  def years
    days * 365.25
  end
  
  def ago
    Time.new - self
  end

  def from_now
    Time.new + self
  end
end

class Fixnum
  include NumExtras
end
class Float
  include NumExtras
end

class Time
  def weekday
    ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][wday]
  end
end

puts "Five days from now will be %p" % (Time.new + 5.days)
puts "Seven weeks ago was %p" % 7.weeks.ago
puts "Two years from now it will be %s a " % 2.years.from_now.weekday
