# class
class Point
    attr_accessor :x, :y # creates instance vars and getters and setters
    @@num_points = 0
    
    def initialize(x, y)
        @x = x
        @y = y
        @org = "#{x},#{y}"  # created out of thin air
        @@num_points += 1
    end
    
    def to_s
        "Point(#{@x},#{@y}) originally #{@org}. Total points: #{@@num_points}"
    end
end

p1 = Point.new(10,1)
p p1
p p1.methods.sort.grep /instance/

# add to class
class Point
    # addition operator
    def +(p2)
        Point.new @x+p2.x, @y+p2.y
    end
    
    # a class method
    def self.make(str)
      "My point is this: #{str}"
    end
end

# call class method
p Point::make "Ruby is cool"

# override any class
class Fixnum
    def *(num)
      self / num    # change multiplication into division!
    end
end
p "4 * 2 = #{4 * 2}"

p2 = Point.new(5,5)
p "p1.+(p2) = %p" % (p1.+(p2))
p "p1 + p2 = %p" % (p1 + p2)

# named parameters
class Point
    def move(params)
        params = {:delta_x => 0, :delta_y => 0}.merge params    # quick way to set up defaults
        @x += params[:delta_x]
        @y += params[:delta_y]
        self
    end
end

p2.move :delta_x => -10 # shortcut for last parameter being a hashmap
p p2

# inheritance
class Vertex < Point
    attr_accessor :z
    
    def initialize(x,y,z)
        super(x,y)
        @z = z
    end
    
    def to_s
        "Vertex(#{@x},#{@y},#{@z})"
    end
end

v = Vertex.new(10,20,30)
p v

# inner class
class Point
    class Color
        attr_accessor :r, :g, :b
    end
end

c = Point::Color.new
p c
