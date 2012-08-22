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
p p2.name
p p2.address

