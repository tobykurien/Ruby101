# class_eval
class Person
  @@Fields = :name, :surname, :title, :age
  
  # generate getters and setters for the fields
  @@Fields.each do |field|
    class_eval "@#{field}"                                # define the attribute
    class_eval "def #{field}; @#{field}; end"             # add a getter
    class_eval "def #{field}=(val); @#{field}=val; end"   # add a setter
  end
end

person = Person.new
p person.respond_to? :name
person.name = "Toby"
person.surname = "Kurien"
p person

# method_missing
class Person2
  @@data = {
    :name => "House4Hack",
    :address => "4 Burger Ave, Centurion, South Africa"
  }
  
  def method_missing(sym, *args, &block)
    return @@data[sym] if @@data.has_key? sym
    super(sym, *args, &block)
  end
end

p2 = Person2.new
p p2.respond_to? :name
p p2.name
p p2.address

# adding keywords to the language to make a DSL using module mixin
#--------------
#  Here we set up the DSL magic
#--------------
  module CarProperties

    # this method will be called as the class is loaded
    def top_speed(value)
      class_variable_set "@@top_speed", value   # set a class variable
    end

  end

  class Car
    extend CarProperties    # adds "top_speed" as a method
    attr_accessor :colour   # normal attribute
  end

#--------------
# Here we use the DSL
#-------------- 
class Toyota86 < Car
  top_speed 230           # executes the "top_speed" method on the Car class
  
  def to_s
    "Model: #{self.class}, Colour: #{@colour}, Top speed: #{@@top_speed}"
  end
end

my_car = Toyota86.new
my_car.colour = :blue
p my_car.to_s

