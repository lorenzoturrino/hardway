## Animal is-a object look at the extra credit
class Animal
end

## ?? is
class Dog < Animal

  def initialize(name)
    ## ?? has
    @name = name
  end
end

## ?? is
class Cat < Animal

  def initialize(name)
    ## ?? has
    @name = name
  end
end

## ?? def
class Person

  def initialize(name)
    ## ?? has
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet
end

## ?? is
class Employee < Person

  def initialize(name, salary)
    ## ?? hmm what is this strange magic?
    super(name)			#run init of Person class
    ## ?? has
    @salary = salary
  end

end

## ?? def
class Fish
end

## ?? is
class Salmon < Fish
end

## ?? is
class Halibut < Fish
end


## rover is-a Dog
rover = Dog.new("Rover")

## ?? is obj
satan = Cat.new("Satan")

## ?? is obj
mary = Person.new("Mary")

## ?? ~has
mary.pet = satan

## ?? is obj
frank = Employee.new("Frank", 120000)

## ?? ~has
frank.pet = rover

## ?? is obj
flipper = Fish.new()

## ?? is obj
crouse = Salmon.new()

## ?? is obj
harry = Halibut.new()